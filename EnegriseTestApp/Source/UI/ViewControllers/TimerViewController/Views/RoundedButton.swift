//
//  RoundedButton.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import UIKit

final class RoundedButton: UIButton {
    
    // MARK: -
    // MARK: Variables
    
    private let image: UIImage
    private let selectedImage: UIImage?
    private let selectedTitleColor: UIColor
    private let unselectedTitleColor: UIColor?
    private let unselectedNormalColor: UIColor
    private let unselectedHighlightedColor: UIColor
    private let selectedNormalColor: UIColor?
    private let selectedHighlightedColor: UIColor?
    
    // MARK: -
    // MARK: Overrided
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted
                ? (self.isSelected
                   ? (selectedHighlightedColor == nil ? unselectedHighlightedColor : selectedHighlightedColor)
                   : unselectedHighlightedColor)
                : (self.isSelected
                   ? (selectedNormalColor == nil ? unselectedNormalColor : selectedNormalColor)
                   : unselectedNormalColor)
            
            self.tintColor = self.isSelected
                ? self.selectedTitleColor
                : (self.unselectedTitleColor == nil ? self.selectedTitleColor : self.unselectedTitleColor)
            
            if let selectedImage {
                self.setImage(self.isSelected
                    ? selectedImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 36.0))
                    : self.image.withConfiguration(UIImage.SymbolConfiguration(pointSize: 36.0)),
                        for: .normal
                )
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted
                ? (self.isSelected
                   ? (selectedHighlightedColor == nil ? unselectedHighlightedColor : selectedHighlightedColor)
                   : unselectedHighlightedColor)
                : (self.isSelected
                   ? (selectedNormalColor == nil ? unselectedNormalColor : selectedNormalColor)
                   : unselectedNormalColor)
        }
    }
    
    // MARK: -
    // MARK: Init
    
    init(
        image: UIImage,
        selectedImage: UIImage? = nil,
        selectedTitleColor: UIColor,
        unselectedTitleColor: UIColor? = nil,
        unselectedNormalColor: UIColor,
        unselectedHighlightedColor: UIColor,
        selectedNormalColor: UIColor? = nil,
        selectedHighlightedColor: UIColor? = nil
    ) {
        self.image = image
        self.selectedImage = selectedImage
        self.selectedTitleColor = selectedTitleColor
        self.unselectedTitleColor = unselectedTitleColor
        self.unselectedNormalColor = unselectedNormalColor
        self.unselectedHighlightedColor = unselectedHighlightedColor
        self.selectedNormalColor = selectedNormalColor
        self.selectedHighlightedColor = selectedHighlightedColor
        
        super.init(frame: .zero)
            
        self.prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Private
    
    private func prepare() {
        self.setImage(
            self.image.withConfiguration(UIImage.SymbolConfiguration(pointSize: 36.0)),
            for: .normal
        )
        
        self.tintColor = self.unselectedTitleColor
        self.backgroundColor = self.unselectedNormalColor
        self.layer.cornerRadius = 48.0
        self.clipsToBounds = true
        self.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        
        self.widthAnchor.constraint(equalToConstant: 96.0).isActive = true
        self.heightAnchor.constraint(equalToConstant: 96.0).isActive = true
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
