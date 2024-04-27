//
//  MainScreenView.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit

final class TimerView: UIView {
    
    // MARK: -
    // MARK: Variables
    
    let timeLabel = AnimatedLabel()
    let playButton = RoundedButton(
        image: UIImage(systemName: "play") ?? UIImage(),
        selectedImage: UIImage(systemName: "pause"),
        selectedTitleColor: Colors.Colors.redTitle.color,
        unselectedTitleColor: Colors.Colors.greenTitle.color,
        unselectedNormalColor: Colors.Colors.greenClock.color,
        unselectedHighlightedColor: Colors.Colors.greenHighlighted.color,
        selectedNormalColor: Colors.Colors.redClock.color,
        selectedHighlightedColor: Colors.Colors.redHighlighted.color
    )
    
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
        self.backgroundColor = .darkGray
        self.prepareTimeLabel()
        self.preparePlayButton()
    }
    
    private func prepareTimeLabel() {
        self.addSubview(self.timeLabel)
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeLabel.text = "00:00:00"
        
        NSLayoutConstraint.activate([
            self.timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.timeLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: 40.0
            )
        ])
    }
    
    private func preparePlayButton() {
        self.addSubview(self.playButton)
        self.playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        self.playButton.startAnimation()
    }
}
