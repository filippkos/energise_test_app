//
//  AboutAppViewController.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit
import StoreKit

final class AboutAppViewController: UIViewController, RootViewGettable, UICollectionViewDataSource, UICollectionViewDelegate {
    
    typealias RootView = AboutAppView
    typealias Loc = L10n.AboutApp
    
    // MARK: -
    // MARK: Variables
    
    private let storage = Storage()
    var dataSource: [AboutAppCollectionCellModel] = []
    
    // MARK: -
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.collectionView.dataSource = self
        self.rootView?.collectionView.delegate = self
        self.rootView?.collectionView.register(AboutAppCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AboutAppCollectionViewCell.self))
        self.fillDataSource()
    }
    
    override func loadView() {
        self.view = AboutAppView()
    }
    
    // MARK: -
    // MARK: Private
    
    private func rateApp() {
        guard let scene = rootView?.window?.windowScene else {
            print("no scene")
            return
        }
        SKStoreReviewController.requestReview(in: scene)
    }
    
    private func shareApp() {
        let shareSheet = UIActivityViewController(
            activityItems: [
                URL(string: "http://ip-api.com") as Any
            ],
            applicationActivities: nil
        )
        
        self.present(shareSheet, animated: true)
    }
    
    private func contactUs() {
        if let url = URL(string: "https://energise.notion.site/Swift-fac45cd4d51640928ce8e7ea38552fc3") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func fillDataSource() {
        self.dataSource = [
            AboutAppCollectionCellModel(title: Loc.rate, action: AboutAppCommand(action: self.rateApp)),
            AboutAppCollectionCellModel(title: Loc.share, action: AboutAppCommand(action: self.shareApp)),
            AboutAppCollectionCellModel(title: Loc.contactUs, action: AboutAppCommand(action: self.contactUs))
        ]
    }
    
    // MARK: -
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AboutAppCollectionViewCell.self), for: indexPath)
        if let buttonCell = cell as? AboutAppCollectionViewCell {
            buttonCell.configure(with: self.dataSource[indexPath.item])
        }
        
        return cell
    }
}
