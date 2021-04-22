//
//  CharacterController.swift
//  MarioPicker
//
//  Created by Connor Hammond on 4/22/21.
//

import UIKit

class CharacterController {
    static let goodGuys = [Character(name: "Mario", photo: UIImage(named: "mario"), faction: "GoodGuy"),
                           Character(name: "Luigi", photo: #imageLiteral(resourceName: "luigi"), faction: "GoodGuy"),
                           Character(name: "Peach", photo: #imageLiteral(resourceName: "peach"), faction: "GoodGuy"),
                           Character(name: "Toad", photo: #imageLiteral(resourceName: "toad"), faction: "GoodGuy"),
                           Character(name: "Yoshi", photo: #imageLiteral(resourceName: "yoshi"), faction: "GoodGuy"),
                           Character(name: "Daisy", photo: #imageLiteral(resourceName: "daisy"), faction: "GoodGuy")]
    
    static let badGuys = [Character(name: "Bowser", photo: #imageLiteral(resourceName: "bowser"), faction: "BadGuy"),
                          Character(name: "Winged Koopa Troopa", photo: #imageLiteral(resourceName: "flyingTurtle"), faction: "BadGuy"),
                          Character(name: "Goomba", photo: #imageLiteral(resourceName: "goomba"), faction: "BadGuy"),
                          Character(name: "Koopa Troopa", photo: #imageLiteral(resourceName: "turtle"), faction: "BadGuy"),
                          Character(name: "Wario", photo: #imageLiteral(resourceName: "wario"), faction: "BadGuy")]
}//End of class
