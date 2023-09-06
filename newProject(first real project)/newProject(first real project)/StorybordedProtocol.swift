//
//  StorybordedProtocol.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 29.08.2023.
//

import Foundation
import UIKit

protocol StorybordedProtocol {
    static func ControllerFromStorybord() -> Self
    
    static func ControllerFromStorybord<T>(withItem: T, complition: @escaping (NSCoder) -> Self) -> Self
}

extension StorybordedProtocol where Self: UIViewController {
    
    static func ControllerFromStorybord() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}

extension StorybordedProtocol where Self: UIViewController {
    
    static func ControllerFromStorybord<T>(withItem: T, complition: @escaping (NSCoder) -> Self) -> Self {
        
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: id) { coder in
            let conteiner = complition(coder)
            return conteiner
        }
        return controller as! Self
    }
}

