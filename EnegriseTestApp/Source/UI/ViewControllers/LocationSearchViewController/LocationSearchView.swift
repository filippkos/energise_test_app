//
//  IPSearchView.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit
import MapKit

final class LocationSearchView: UIView {
    
    typealias Loc = L10n.LocationSearch
    
    // MARK: -
    // MARK: Variables
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.Colors.greenClock.color
        button.setTitle(Loc.buttonTitle, for: .normal)
        button.setTitleColor(Colors.Colors.greenTitle.color, for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    private let annotation: MKPointAnnotation = MKPointAnnotation()

    private let buttonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let mapHeight: CGFloat = 200
    let reloadButtonBarHeight: CGFloat = 64
    
    // MARK: -
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    func setPoint(location: CLLocationCoordinate2D, animation: Bool = true) {
        self.mapView.setCenter(location, animated: animation)
        self.annotation.coordinate = location
        self.mapView.addAnnotation(self.annotation)
    }
    
    // MARK: -
    // MARK: Private
    
    private func setup() {
        self.backgroundColor = .gray
        self.prepareViews()
        self.prepareConstraints()
    }
    
    private func prepareViews() {
        self.addSubview(self.mapView)
        self.addSubview(self.tableView)
        self.addSubview(self.buttonContainer)
        self.buttonContainer.addSubview(self.button)
    }
    
    private func prepareConstraints() {
        NSLayoutConstraint.activate([
            self.mapView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.mapView.bottomAnchor.constraint(equalTo: self.tableView.topAnchor),
            self.mapView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.mapView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.mapView.heightAnchor.constraint(equalToConstant: self.mapHeight),

            self.tableView.bottomAnchor.constraint(equalTo: self.buttonContainer.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),

            self.buttonContainer.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.buttonContainer.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.buttonContainer.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.buttonContainer.heightAnchor.constraint(equalToConstant: self.reloadButtonBarHeight),
    
            self.button.centerXAnchor.constraint(equalTo: self.buttonContainer.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: self.buttonContainer.centerYAnchor),
            self.button.widthAnchor.constraint(equalToConstant: self.reloadButtonBarHeight * 1.5),
            self.button.heightAnchor.constraint(equalToConstant: self.reloadButtonBarHeight * 0.75)
        ])
    }
}
