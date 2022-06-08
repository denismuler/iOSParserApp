//
//  SortView.swift
//  iOS_ParserApp
//
//  Created by Настя Сергієнко on 08.06.2022.
//

import UIKit

class SortView: UIView, UITextFieldDelegate {
    
//    let sortView: UIView

    var isActive: Bool = false
    
    @IBOutlet weak var uploadDate: UIButton!
    @IBOutlet weak var relevance: UIButton!
    
    
    @IBAction func uploadDatePressed(_ sender: UIButton) {
        if isActive == false {
            uploadDate.setImage(UIImage(named: "ButtonPressed"), for: .normal)
        }
    }
    
    @IBAction func relevancePressed(_ sender: UIButton) {
        if isActive == false {
            relevance.setImage(UIImage(named: "ButtonPressed"), for: .normal)
        }
    }
    
    required init? (coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 600, width: frame.width, height: frame.width))
        
        self.uploadDate.setTitle("", for: .normal)
        self.relevance.setTitle("", for: .normal)
    }
    
   
    func xibSetup(frame: CGRect) {
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    
    func loadXib() -> UIView {
        let bundle = Bundle (for: type(of: self))
        let nib = UINib(nibName: "Sort", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
}

