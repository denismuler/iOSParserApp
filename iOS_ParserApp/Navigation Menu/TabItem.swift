//
//  TabBar.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 17.05.2022.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case news = "news"
    case search = "search"
    case profile = "profile"
    case more = "more"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .news:
            return NewsViewController()
        case .search:
            return SearchViewController()
        case .profile:
          return ProfileViewController()
        case .more:
            return MoreViewController()
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home")!
        case .news:
            return UIImage(named: "news")!
        case .search:
            return UIImage(named: "search")!
        case .profile:
            return UIImage(named: "profile")!
        case .more:
            return UIImage(named: "more")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
