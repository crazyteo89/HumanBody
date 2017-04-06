//
//  CollectionViewCell.swift
//  Body
//
//  Created by Alessandro Armando on 04/04/17.
//  Copyright © 2017 iOSFoundation. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageForChoice: UIImageView!
    @IBOutlet weak var labelOrgan: UILabel!
    var imagenotfocussed: UIImage!
    var imagefocussed: UIImage!
    var blurEffectView = UIVisualEffectView()
    
    @IBOutlet weak var imageOpaque: UIImageView!
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        //self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    
    fileprivate func commonInit()
    {
        // Initialization code
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if self.isFocused {
            imageForChoice.adjustsImageWhenAncestorFocused = true
            imageForChoice.isHidden = true
            imageOpaque.isHidden = false
            
            //addBlurEffect()
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.labelOrgan.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
            
        } else {
            //blurEffectView.removeFromSuperview()
            imageForChoice.adjustsImageWhenAncestorFocused = false
            imageForChoice.isHidden = false
            imageOpaque.isHidden = true
            //labelOrgan.font = labelOrgan.font.withSize(40)
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.labelOrgan.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        }
    }
}
