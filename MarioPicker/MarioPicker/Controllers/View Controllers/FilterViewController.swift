//
//  FilterViewController.swift
//  MarioPicker
//
//  Created by Connor Hammond on 4/22/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func factionWasSelected(faction: String)
}

class FilterViewController: UIViewController {

    //MARK: - Properties
    weak var delegate: FilterSelectionDelegate?
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func goodGuyButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "GoodGuy")
        self.dismiss(animated: true)
    }
    
    
    @IBAction func badGuyButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "BadGuy")
        self.dismiss(animated: true)
    }
    
}//End of class
