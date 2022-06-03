//
//  SearchViewController.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 18.05.2022.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let searchView: SearchView = {
            let view = SearchView()
            return view
        }()

    let tableView = UITableView()
    
    var timer:Timer?
    var data = [String]()
    var actionClosure : (()->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.delegate = self
        
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
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
//                                                 for: indexPath)
        var data = SearchHistoryManager.shared.getHistoryRecords()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchHistoryTableViewCell
//        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.text = data[indexPath.row] as! String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
}

// MARK: - SearchViewDelegate
extension SearchViewController: SearchViewDelegate {
   
    func addSearchRecord(nameValue: String) {
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self,
                                     selector: #selector(self.executeAction),
                                     userInfo: nil, repeats: false)

        if nameValue.count > 4 {
            SearchHistoryManager.shared.addSearchRecord(nameValue: nameValue)
        }
    }
    
    @objc func executeAction() {
        actionClosure?()
    }
    
    func textFieldChanged(with string: String) {
       
    }
}
