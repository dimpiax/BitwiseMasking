//
//  GenreUISwitch.swift
//  BitwiseMasking
//
//  Created by Pilipenko Dima on 11/2/15.
//  Copyright © 2015 dimpiax. All rights reserved.
//

import Foundation
import UIKit

class GenreUISwitch: UISwitch {
    let responsibleGengre: Genre
    let label: UILabel
    
    init(responsibleGengre type: Genre) {
        responsibleGengre = type
        label = UILabel()
        
        super.init(frame: CGRectZero)
        
        label.text = type.name
        label.sizeToFit()
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame.origin.x = 60
        label.frame.origin.y = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}