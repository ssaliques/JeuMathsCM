//
//  MaVue.swift
//  JeuMathsCM
//
//  Created by Sébastien SALIQUES on 28/05/2020.
//  Copyright © 2020 MassiveDynamic Ltd. All rights reserved.
//

import UIKit

class MaVue: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor  = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.75
        layer.shadowRadius  = 3
        isUserInteractionEnabled = true
        
    }
    
    
    
    
    
    
    
    
    
}
