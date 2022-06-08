//
//  StoryboardInitializable.swift
//  iOS_ParserApp
//
//  Created by Prefect on 07.06.2022.
//

import UIKit

protocol StoryboardInitializable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    
    static func createFromStoryboard() -> Self
}

extension StoryboardInitializable where Self : UIViewController {
    
    static var storyboardBundle: Bundle? {
        return nil
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func createFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}

extension StoryboardInitializable where Self: FilterViewController {
    static var storyboardName: String {
        return "Filter"
    }
}

//extension StoryboardInitializable where Self: SortView {
//        static var storyboardName: String {
//            return "Sort"
//        }
//    }
