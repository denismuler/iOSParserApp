//
//  SearchViewController.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 18.05.2022.
//

import UIKit

class SearchViewController: UIViewController {

    private let searchView: SearchView = {
            let view = SearchView()
            return view
        }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.view.backgroundColor = UIColor.orange
        let label = UILabel(frame: CGRect.zero)
        label.text = "Friends View Controller"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.sizeToFit()
        
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
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
}
