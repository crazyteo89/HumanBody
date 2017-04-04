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
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.commonInit()
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
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if self.isFocused {
            imageForChoice.adjustsImageWhenAncestorFocused = true
        } else {
            imageForChoice.adjustsImageWhenAncestorFocused = false
        }
    }
}
