//
//  HeaderView.swift
//
//  Created by TheFlow_ on 18/10/2015.
//  Copyright © 2015 TheFlow_. All rights reserved.
//

import UIKit

@IBDesignable
class HeaderView: UIView {
    @IBInspectable var blurStyle: UIBlurEffectStyle = .Light
    @IBInspectable var image: UIImage?

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        let headerBackground = UIImageView()
        headerBackground.translatesAutoresizingMaskIntoConstraints = true
        headerBackground.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        headerBackground.image = self.image
        headerBackground.contentMode = .ScaleAspectFill
        headerBackground.frame = self.bounds
        self.addSubview(headerBackground)
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: self.blurStyle))
        visualEffectView.translatesAutoresizingMaskIntoConstraints = true
        visualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        if self.image != nil {
            visualEffectView.frame = headerBackground.bounds
            headerBackground.addSubview(visualEffectView)
        }
    }
}
