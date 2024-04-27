//
//  UIView+Extensions.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import UIKit

extension UIView {
    
    func startAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 1.2
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        self.layer.add(animation, forKey: "scale")
    }
    
    func stopAnimation() {
        self.layer.removeAnimation(forKey: "scale")
    }
}
