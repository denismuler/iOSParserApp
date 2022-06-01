////
////  SearchCoordinator .swift
////  iOS_ParserApp
////
////  Created by Настя Сергієнко on 31.05.2022.
////
//
//import UIKit
//
//class SearchCoordinator: Coordinator {
//    
//    var navigationController = UINavigationController()
//    
////    private let dateFromSubject = PublishSubject<Date?>()
////    private let dateToSubject = PublishSubject<Date?>()
//    
//    func start() {
//        guard let viewController = R.storyboard.search.instantiateInitialViewController() else { return }
//        navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.tabBarItem.title = "Search"
//        navigationController.tabBarItem.image = UIImage(systemName: "magnifyingglass")!
//        
//        let viewModel = SearchViewModel(dependencies: .init(dateFromObservable: dateFromSubject.asObservable(),
//                                                            dateToObservable: dateToSubject.asObservable()))
//        viewController.configure(viewModel: viewModel, showArticle: showArticle, showFilter: showFilter)
//    }
//    
//    func showArticle(with url: URL) {
//        guard let viewController = R.storyboard.article.instantiateInitialViewController() else { return }
//        navigationController.present(viewController, animated: true)
//        viewController.showArticle(with: url)
//    }
//    
//    func showFilter() {
//        guard let viewController = R.storyboard.filter.instantiateInitialViewController() else { return }
//        navigationController.pushViewController(viewController, animated: true)
//        let viewModel = FilterViewModel(dateFromSubject: dateFromSubject,
//                                        dateToSubject: dateToSubject)
//        viewController.configure(viewModel: viewModel)
//    }
//}
