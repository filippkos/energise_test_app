//
//  IPSearchViewController.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit
import Alamofire
import CoreLocation

final class LocationSearchViewController: UIViewController, RootViewGettable, UITableViewDataSource {
    
    typealias RootView = LocationSearchView
    
    // MARK: -
    // MARK: Variables
    
    private let storage = Storage()
    private var searchText: String = ""
    private var model: IPLocationModel?
    var refreshControl = UIRefreshControl()
    
    // MARK: -
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.tableView.dataSource = self
        self.rootView?.tableView.register(LocationSearchTableViewCell.self, forCellReuseIdentifier: String(describing: LocationSearchTableViewCell.self))
        self.rootView?.button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        self.request()
        self.configureRefreshing()
    }
    
    override func loadView() {
        self.view = LocationSearchView()
    }

    // MARK: -
    // MARK: HandleRefresh
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.refreshControl.beginRefreshing()
        self.request()
        self.refreshControl.endRefreshing()
    }
    
    func configureRefreshing() {
        refreshControl.addTarget(self, action: #selector(LocationSearchViewController.handleRefresh(_:)), for: .valueChanged)
        self.rootView?.tableView.addSubview(self.refreshControl)
    }
    
    // MARK: -
    // MARK: Private
    
    private func request() {
        AF.request("http://ip-api.com/json/").responseData(completionHandler: { response in
            if let error = response.error {
                debugPrint("Error downloading data: \(error)")
                self.model = self.storage.loadProfile()
                self.updateLocation()
            } else {
                guard let data = response.data else {
                    print("Data error")
                    self.model = self.storage.loadProfile()
                    self.updateLocation()
                    return
                }
                let decoder = JSONDecoder()
                if let info = try? decoder.decode(IPLocationModel.self, from: data) {
                    self.model = info
                    self.storage.saveProfile(info)
                    self.updateLocation()
                } else {
                    self.model = self.storage.loadProfile()
                    self.updateLocation()
                }
            }
        })
    }
    
    private func updateLocation() {
        self.rootView?.setPoint(location: self.location()!)
        self.rootView?.tableView.reloadData()
    }
    
    private func location() -> CLLocationCoordinate2D? {
        guard let model else { return nil }
        
        return CLLocationCoordinate2D(latitude: model.lat, longitude: model.lon)
    }
    
    // MARK: -
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.model?.tableModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LocationSearchTableViewCell.self), for: indexPath)
        if let locationCell = cell as? LocationSearchTableViewCell {
            if let model = self.model?.tableModel[indexPath.item] {
                locationCell.configure(title: model.0, value: model.1)
            }
        }
        
        return cell
    }
    
    // MARK: -
    // MARK: Actions
    
    @objc func buttonAction(sender: UIButton!) {
        self.request()
    }
}
