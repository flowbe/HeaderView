//
//  HeaderView.swift
//
//  Created by TheFlow_ on 18/10/2015.
//  Copyright © 2015 TheFlow_. All rights reserved.
//

import UIKit

@IBDesignable
class HeaderView: UIView {
    
    @IBInspectable var blurStyle: UIBlurEffectStyle = .Light {
        didSet {
            updateHeaderBackground()
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            updateHeaderBackground()
        }
    }
    
    private lazy var headerBackground: UIImageView! = {
        let headerBackground = UIImageView()
        headerBackground.translatesAutoresizingMaskIntoConstraints = true
        headerBackground.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        headerBackground.image = self.image
        headerBackground.contentMode = .ScaleAspectFill
        headerBackground.frame = self.bounds
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: self.blurStyle))
        visualEffectView.translatesAutoresizingMaskIntoConstraints = true
        visualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        if self.image != nil {
            visualEffectView.frame = headerBackground.bounds
            headerBackground.addSubview(visualEffectView)
        }
        
        return headerBackground
    }()
    
    // whenever a property that effects the header view changes, call this
    //
    private func updateHeaderBackground() {
        headerBackground.removeFromSuperview()
        headerBackground = nil
        addSubview(headerBackground)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        addSubview(headerBackground)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
