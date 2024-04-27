//
//  MainScreenViewController.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit

final class TimerViewController: UIViewController, RootViewGettable {
    
    typealias RootView = TimerView
    
    // MARK: -
    // MARK: Variables
    
    private var buttonAnimationStatus = true
    private var displayLink = CADisplayLink()
    
    private let clockTimer = Timer()

    // MARK: -
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    override func loadView() {
        self.view = TimerView()
    }
    
    // MARK: -
    // MARK: Private
    
    private func setup() {

        self.prepareDisplayLink()
        self.rootView?.playButton.addTarget(
            self,
            action: #selector(self.playButtonAction),
            for: .touchUpInside
        )
    }
    
    private func prepareDisplayLink() {
        self.displayLink = CADisplayLink(target: self, selector: #selector(self.linkTriggered(displayLink:)))
        self.displayLink.add(to: .main, forMode: .common)
    }
    
    
    
    @objc private func linkTriggered(displayLink: CADisplayLink) {
        guard let time = self.clockTimer.formattedTime(), !buttonAnimationStatus else { return }
        self.rootView?.timeLabel.text = "\(time.0.toBondFormat()):\(time.1.toBondFormat()):\(time.2.toBondFormat())"
    }
    
    @objc private func playButtonAction() {
        if self.buttonAnimationStatus {
            self.rootView?.playButton.stopAnimation()
            self.rootView?.timeLabel.startAnimation()
            self.clockTimer.start()
        } else {
            self.rootView?.playButton.startAnimation()
            self.rootView?.timeLabel.stopAnimation()
            guard let time = self.clockTimer.fixLap() else { return }
            self.rootView?.timeLabel.text = "\(time.0.toBondFormat()):\(time.1.toBondFormat()):\(time.2.toBondFormat())"
        }
        
        self.buttonAnimationStatus.toggle()
    }
}

