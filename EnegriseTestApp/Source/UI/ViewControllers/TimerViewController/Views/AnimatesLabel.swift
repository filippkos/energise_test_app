//
//  AnimatesLabel.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import UIKit

final class AnimatedLabel: UILabel {
    
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
        self.textColor = .white
        self.textAlignment = .center
        self.font = .monospacedDigitSystemFont(ofSize: 60.0, weight: .medium)
    }
}
