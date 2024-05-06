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

    private var model: LocationModel?
    
    private let refreshControl = UIRefreshControl()
    private let networkProvider = NetworkProvider()
    private let storage = Storage()
    
    // MARK: -
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = self.rootView else {
            fatalError("View didn't load")
        }
        
        view.tableView.dataSource = self
        view.tableView.register(cellClass: LocationSearchTableViewCell.self)
        self.rootView?.button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        self.location()
        self.configureRefreshing()
    }
    
    override func loadView() {
        self.view = LocationSearchView()
    }

    // MARK: -
    // MARK: HandleRefresh
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.refreshControl.beginRefreshing()
        defer { self.refreshControl.endRefreshing() }
        self.location()
    }
    
    private func configureRefreshing() {
        self.refreshControl.addTarget(
            self,
            action: #selector(handleRefresh(_:)),
            for: .valueChanged
        )
        self.rootView?.tableView.addSubview(self.refreshControl)
    }
    
    // MARK: -
    // MARK: Private
    
    private func location() {
        self.networkProvider.perform(
            LocationURLRequest(),
            completion: { (result: Result<LocationModel, Error>) -> Void in
                switch result {
                case .success(let model):
                    self.model = model
                    self.updateLocation()
                    self.rootView?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        )
   }
    
    private func updateLocation() {
        self.rootView?.setPoint(location: self.coordinates()!)
    }
    
    private func coordinates() -> CLLocationCoordinate2D? {
        return self.model.map { CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.lon) }
    }
    
    // MARK: -
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.model?.tableModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: LocationSearchTableViewCell.self)
        if let model = self.model?.tableModel[indexPath.item] {
            cell.configure(title: model.0, value: model.1)
        }
        
        return cell
    }
    
    // MARK: -
    // MARK: Actions
    
    @objc func buttonAction(sender: UIButton) {
        self.location()
    }
}
