//
//  UIStoryboard+.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 29.08.2023.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func VCStoryboardWith(id: String) -> UIViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: id)
    }
}
