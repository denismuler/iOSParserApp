//
//  SearchView.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 25.05.2022.
//

import UIKit

protocol SearchViewDelegate: SearchViewController {
    func addSearchRecord(nameValue: String)
    func openFilterScreen()
}

class SearchView: UIView, UITextFieldDelegate {
    
    @IBOutlet var containerView1: UIView!
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        delegate?.openFilterScreen()
    }
    
    @IBAction func listButtonPressed(_ sender: UIButton) {
    }
    
    var delegate: SearchViewDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        textField.delegate = self
        
        self.listButton.setTitle("", for: .normal)
        self.filterButton.setTitle("", for: .normal)
        
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Search", owner: self, options: nil)
        filterButton.setTitle(nil, for: .normal)
        
        clipsToBounds = true
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

    
        addSubview(containerView1)
        containerView1.frame = self.bounds
        containerView1.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        containerView1.layer.cornerRadius = 20
        containerView1.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.addSearchRecord(nameValue: textField.text ?? "")
    }
}
