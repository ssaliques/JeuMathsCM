//
//  ViewController.swift
//  JeuMathsCM
//
//  Created by Sébastien SALIQUES on 28/05/2020.
//  Copyright © 2020 MassiveDynamic Ltd. All rights reserved.
//

import UIKit
@available (iOS 13.0, *)
class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    
    
    var carte: MaVue?
    var hauteurCarte : CGFloat = 200
    var largeurCarte : CGFloat = 200
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.opacity = 1
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        view.bringSubviewToFront(container)
        
        
        
        carte = MaVue(frame: CGRect(x: container.frame.midX - (largeurCarte / 2), y: container.frame.midY - (hauteurCarte / 2), width: largeurCarte, height: hauteurCarte))
        container.addSubview(carte ?? UIView())
        
        
        
    }


}

