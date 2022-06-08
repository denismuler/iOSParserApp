//
//  Coordinator.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 31.05.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
