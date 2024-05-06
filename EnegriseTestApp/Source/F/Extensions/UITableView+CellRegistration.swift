//
//  UITableView+CellRegistration.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 06.05.2024.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        let className = String(describing: T.self)
        self.register(cellClass, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type) -> T {
        let className = String(describing: T.self)
        let cell = self.dequeueReusableCell(withIdentifier: className) as? T
        guard let cell = cell else {
            fatalError("This cell type doesn't registered")
        }
        
        return cell
    }
}
