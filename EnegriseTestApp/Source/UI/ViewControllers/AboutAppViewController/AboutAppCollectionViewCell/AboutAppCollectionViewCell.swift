//
//  AboutAppCollectionViewCell.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import UIKit
import StoreKit

final class AboutAppCollectionViewCell: UICollectionViewCell {
    
    // MARK: -
    // MARK: Variables
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.Colors.greenClock.color
        button.setTitleColor(Colors.Colors.greenTitle.color, for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var buttonHandler: (() -> ())?
    
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
    
    func configure(title: String) {
        self.button.setTitle(title, for: .normal)
    }

    func add(action: @escaping () -> ()) {
        self.buttonHandler = action
        self.button.addTarget(self, action: #selector(self.handleTap), for: .touchUpInside)
    }
    
    // MARK: -
    // MARK: Private
    
    private func setup() {
        self.prepareViews()
        self.prepareConstraints()
    }
    
    private func prepareViews() {
        self.backgroundColor = .darkGray
        self.contentView.addSubview(self.button)
    }
    
    private func prepareConstraints() {
        NSLayoutConstraint.activate([
            self.button.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.button.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.button.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
        ])
    }
    
    @objc private func handleTap() {
        self.buttonHandler?()
    }
}
