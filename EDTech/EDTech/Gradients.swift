//
//  Gradients.swift
//  EDTech
//
//  Created by Matt on 12/22/20.
//

import Foundation
import UIKit

extension UIView {
    
    public func setTwoGradient(colorOne: UIColor, colorTwo: UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
       
        //gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
      
    }
    
}
