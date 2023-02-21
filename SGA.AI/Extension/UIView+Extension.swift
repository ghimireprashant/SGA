//
//  UIView+Extension.swift
//  SGA.AI
//
//  Created by Prashant Ghimire on 2023-02-20.
//

import Foundation
import UIKit


extension UIView{
    func rightTopBottomCorner(radius : CGFloat){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight , .bottomRight],
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    func leftTopBottomCorner(radius : CGFloat){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .bottomLeft],
                                     cornerRadii: CGSize(width: radius, height:radius))
        let maskLayer1 = CAShapeLayer()
        // maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    
    func myRound(radius : CGFloat){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomLeft],
                                     cornerRadii: CGSize(width: radius, height:radius))
      
        
        let maskLayer1 = CAShapeLayer()
        // maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    func setShadow() {
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.7666
    }
    func round() {
        layer.cornerRadius = layer.frame.height/2
    }

}
