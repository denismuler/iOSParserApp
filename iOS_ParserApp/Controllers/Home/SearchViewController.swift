//
//  SearchViewController.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 18.05.2022.
//

import UIKit
import SQLite

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    private let searchView: SearchView = {
            let view = SearchView()
            return view
        }()
//
//    private let tableView: UITableView = {
//        let table = UITableView()
//        tableView.register(SearchHistoryTableViewCell.self, forCellReuseIdentifier: SearchHistoryTableViewCell.identifier)
//        return table
//    }()
    
//    private var viewModels = [SearchHistoryTableViewCell]()

    let tableView = UITableView()
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for x in 0...20 {
            data.append("Some data\(x)")
        }
        
        title = "Search history"
        tableView.register(SearchHistoryTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        configureUI()
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func configureUI() {
        
        view.addSubview(searchView)

        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchView.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.rightAnchor.constraint(equalTo: view.rightAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
    
//    static func dataSource() -> DataSource<SearchTableViewSection> {
//        return .init(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
//            switch dataSource[indexPath] {
//            case let .searchHistory(title):
//                tableView.separatorStyle = .singleLine
//                tableView.separatorColor = .white
//                tableView.refreshControl?.isHidden = true
//                tableView.rowHeight = 49
//                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.searchHistoryCell,
//                                                         for: indexPath)!
//                cell.itemLabel.text = title
//                return cell
//            case let .news(article):
//                tableView.separatorStyle = .none
//                tableView.rowHeight = 118
//                tableView.refreshControl?.isHidden = false
//                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.newsCell,
//                                                         for: indexPath)!
//                cell.newsImageView.load(url: URL(string: article.image)!)
//                cell.titleLabel.text = article.title
//                cell.bodyLabel.text = article.description
//                return cell
//            }})
//    }
    
}
