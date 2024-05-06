//
//  IPSearchTableViewCell.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 26.04.2024.
//

import UIKit

final class LocationSearchTableViewCell: UITableViewCell {
    
    // MARK: -
    // MARK: Variables
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        
        return stack
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: -
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    func configure(title: String, value: String) {
        self.titleLabel.text = title
        self.valueLabel.text = value
    }
    
    // MARK: -
    // MARK: Private
    
    private func setup() {
        self.selectionStyle = .none
        self.prepareViews()
        self.prepareConstraints()
    }
    
    private func prepareViews() {
        self.contentView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.addArrangedSubview(self.valueLabel)
    }
    
    private func prepareConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 4),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 4),
            self.stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.titleLabel.leftAnchor.constraint(equalTo: self.stackView.leftAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            self.titleLabel.rightAnchor.constraint(equalTo: self.valueLabel.leftAnchor),
            self.titleLabel.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 2),
            self.valueLabel.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            self.valueLabel.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            self.valueLabel.rightAnchor.constraint(equalTo: self.stackView.rightAnchor)
        ])
    }
}
