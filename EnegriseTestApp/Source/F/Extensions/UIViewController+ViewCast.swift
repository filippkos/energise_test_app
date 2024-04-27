//
//  UIViewController+ViewCast.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 25.04.2024.
//

import UIKit

protocol RootViewGettable: UIViewController {
    
    associatedtype RootView: UIView
    var rootView: RootView? { get }
}

extension RootViewGettable {
    var rootView: RootView? {
        self.view as? RootView
    }
}
