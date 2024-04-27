//
//  AboutAppView.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit

final class AboutAppView: UIView {
    
    // MARK: -
    // MARK: Variables
    
    let edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    let collectionView: UICollectionView = UICollectionView(frame: .null, collectionViewLayout: UICollectionViewLayout())
    
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
    // MARK: Private
    
    private func setup() {
        self.prepareViews()
        self.prepareConstraints()
    }
    
    private func prepareViews() {
        self.addSubview(self.collectionView)
        self.backgroundColor = .darkGray
        self.collectionView.backgroundColor = .darkGray
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.isScrollEnabled = false
    }
    
    private func prepareConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    private func prepareLayout() {
        let itemWidth: CGFloat = self.collectionView.frame.size.width - 32
        let itemHeight: CGFloat = 100
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = self.edgeInsets
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.sectionInset = self.edgeInsets
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = layout
        self.collectionView.alwaysBounceVertical = true
    }
    
    // MARK: -
    // MARK: Overrided
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.prepareLayout()
    }
}
