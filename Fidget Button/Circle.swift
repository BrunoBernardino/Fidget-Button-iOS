//
//  Circle.swift
//  Fidget Button
//
//  Created by Bruno Bernardino on 11/05/2019.
//  Copyright © 2019 Bruno Bernardino. All rights reserved.
//

import UIKit

@IBDesignable
class Circle:UIView
{
    @IBInspectable var ringColor: UIColor = UIColor(red: 0.99, green: 0.47, blue: 0.87, alpha: 0.8)
    // @IBInspectable var ringColor: UIColor = UIColor.blue
    @IBInspectable var ringThickness: CGFloat = 3
    
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = ringColor.cgColor
        shapeLayer.lineWidth = ringThickness
        layer.addSublayer(shapeLayer)
    }
}
