//
//  SearchView.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 25.05.2022.
//

import UIKit

class SearchView: UIView {
    
    
    @IBOutlet var containerView1: UIView!
    //    @IBOutlet weak var stackView: UIStackView!
//    @IBOutlet weak var logoLabel: UILabel!
//    @IBOutlet weak var searchBarStackView: UIStackView!
//    @IBInspectable var isSearchBarHidden: Bool {
//        set { searchBarStackView.isHidden = !newValue }
//        get { return !searchBarStackView.isHidden }
//    }
//    @IBOutlet weak var searchTextField: SearchTextField!
//    @IBOutlet weak var filterButton: CircleButton!
//    @IBOutlet weak var sortingButton: CircleButton!
//
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Search", owner: self, options: nil)
        
        clipsToBounds = true
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
//        addShadow(offset: .init(width: 0, height: 6),
//                                color: R.color.shadowColor()!,
//                                radius: 20,
//                                opacity: 0.06)
        
        addSubview(containerView1)
        containerView1.frame = self.bounds
        containerView1.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        containerView1.layer.cornerRadius = 20
        containerView1.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}
