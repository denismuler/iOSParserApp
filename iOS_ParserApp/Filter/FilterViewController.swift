//
//  FilterViewController.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 06.06.2022.
//

import Foundation
import UIKit

class FilterViewController: UIViewController, StoryboardInitializable {
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var fromDateTextFieldView: DateTextField!
    @IBOutlet weak var toDateTextFieldView: DateTextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
