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
    var rect = CGRect()
    var boutonOui = MonButton()
    var boutonNon = MonButton()

    
    
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
        
        // container.backgroundColor = .red
        container.frame = view.bounds
        rect = CGRect(x: container.frame.midX - (largeurCarte / 2), y: container.frame.midY - (hauteurCarte / 2), width: largeurCarte, height: hauteurCarte)
        
        carte = MaVue(frame: rect)
        container.addSubview(carte ?? UIView())
        
        let tiers = container.frame.width / 3
        let quart = container.frame.width / 4
        let hauteur : CGFloat =  50
        let y = container.frame.height - hauteur
        let taille = CGSize(width: tiers, height: hauteur)
        
        boutonNon.frame.size = taille
        boutonNon.center = CGPoint(x: quart, y: y - hauteur / 2)
        boutonNon.setup(string: "NON")
        boutonNon.addTarget(self, action: #selector(non), for: .touchUpInside)
        boutonOui.frame.size = taille
        boutonOui.center = CGPoint(x: quart * 3, y: y - hauteur / 2)
        boutonOui.setup(string: "OUI")
        boutonOui.addTarget(self, action: #selector(oui), for: .touchUpInside)
        container.addSubview(boutonOui)
        container.addSubview(boutonNon)
        
        
        
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == carte?.masque {
            let xPosition = touch.location(in: container).x
            let distance = container.frame.midX - xPosition
            let angle = -distance / 360
            carte?.center.x = xPosition
            carte?.transform = CGAffineTransform(rotationAngle: angle)
            
            if distance >= 75 {
                carte?.setMasqueCouleur(.non)
            } else if distance <= -75 {
                carte?.setMasqueCouleur(.oui)
            } else {
                carte?.setMasqueCouleur(.peutEtre)
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == carte?.masque {
            UIView.animate(withDuration: 0.2, animations: {
                self.carte?.transform = CGAffineTransform.identity
                self.carte?.frame = self.rect
            })
        }
    }
    
    @objc func oui() {
        print("Oui")
    }
    
    @objc func non() {
        print("Non")
    }
    
}

