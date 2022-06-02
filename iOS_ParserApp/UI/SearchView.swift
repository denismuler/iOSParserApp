//
//  SearchView.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 25.05.2022.
//

import UIKit

protocol SearchViewDelegate: SearchViewController {
    func addSearchRecord(nameValue: String)
}

class SearchView: UIView, UITextFieldDelegate {
    
    @IBOutlet var containerView1: UIView!
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var delegate: SearchViewDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
        textField.delegate = self
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
        print("textFieldDidEndEditing")
        // add another method into protocol
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.addSearchRecord(nameValue: textField.text ?? "")
    }
}
