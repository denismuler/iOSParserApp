//
//  UIView+Shadow.swift
//  iOS_ParserApp
//
//  Created by Настя Сергієнко on 03.06.2022.
//

import UIKit

extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        backgroundColor = nil
        layer.backgroundColor =  backgroundColor?.cgColor
    }
}

