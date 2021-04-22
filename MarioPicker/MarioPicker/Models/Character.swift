//
//  Character.swift
//  MarioPicker
//
//  Created by Connor Hammond on 4/22/21.
//

import UIKit

class Character {
    
    let name: String
    let photo: UIImage?
    let faction: String
    let uuid: String
    
    init(name: String, photo: UIImage?, faction: String, uuid: String = UUID().uuidString){
        self.name = name
        self.photo = photo
        self.faction = faction
        self.uuid = uuid
    }
}//End of class

//MARK: - Extension
extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}//End of extension
