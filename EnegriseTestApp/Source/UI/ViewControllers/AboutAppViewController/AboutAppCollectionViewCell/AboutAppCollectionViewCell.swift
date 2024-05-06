//
//  AboutAppCollectionViewCell.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import UIKit

struct AboutAppCollectionCellModel {
    let title: String
    let action: AboutAppCommand
}

final class AboutAppCommand {
    private let action: () -> ()
    
    private(set) var isExecuted: Bool = false
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    func execute() {
        self.action()
        self.isExecuted = true
    }
}

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
    
    func configure(with _model: AboutAppCollectionCellModel) {
        self.button.setTitle(_model.title, for: .normal)
        self.button.addAction(UIAction(handler: {_ in
            _model.action.execute()
        }), for: .touchUpInside)
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
}
