//
//  DateTextField.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 06.06.2022.
//

import UIKit

class DateTextField: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DateTextField", owner: self, options: nil)
        
        addSubview(containerView)
        containerView.frame = self.bounds
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        
        datePicker?.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        textField.inputView = datePicker
    }

    @objc func dateChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        textField.text = formatter.string(from: datePicker!.date)
    }
}
