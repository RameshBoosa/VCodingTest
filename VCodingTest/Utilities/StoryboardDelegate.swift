//
//  StoryboardDelegate.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import Foundation
import UIKit

/**
 
 StoryboardDelegate - Utility Class created for creating instance for Viewcontroller derived classes
 instatiateViewController() - instantiates view controller with same class name
 
 */

protocol StoryboardDelegate {
    @discardableResult
    static func instatiateViewController() -> Self
}

extension StoryboardDelegate where Self: UIViewController {
    
    @discardableResult
    static func instatiateViewController() -> Self {
        let name = NSStringFromClass(self) // name here: target.classname
        let className = name.components(separatedBy: ".")[1] // removes target name and gives class name
        let storyboard = UIStoryboard(name: "Main", bundle: .main) // gives main storyboard name
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else { return UIViewController() as! Self}
        return viewController
    }
}
