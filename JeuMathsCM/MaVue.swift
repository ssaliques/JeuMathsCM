//
//  MaVue.swift
//  JeuMathsCM
//
//  Created by Sébastien SALIQUES on 28/05/2020.
//  Copyright © 2020 MassiveDynamic Ltd. All rights reserved.
//

import UIKit

class MaVue: UIView {
    
    var masque = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func ajoutMasque() {
        masque = UIView(frame: bounds)
        masque.backgroundColor = .green
        masque.layer.cornerRadius = 10
        masque.alpha = 0.25
        addSubview(masque)
    }

    func setup() {
        setLayer()
        ajoutMasque()
        isUserInteractionEnabled = true
        
    }
    
    
    
    
    
    
    
    
    
}
