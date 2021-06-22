//
//  UIViewController + Storyboard.swift
//  MusicPlayer
//
//  Created by Иван Мельников on 20/04/2021.
//  Copyright © 2021 Иван Мельников. All rights reserved.
//
import Foundation
import UIKit


extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
    
}
