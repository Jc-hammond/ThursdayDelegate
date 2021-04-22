//
//  CharactersCollectionViewController.swift
//  MarioPicker
//
//  Created by Connor Hammond on 4/22/21.
//

import UIKit



class CardCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var displayedCharacters: [Character] = []
    var targetedCharacter: Character?
    var selectedFaction = "GoodGuy"

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCharacter(faction: selectedFaction)
    }

    //MARK: - Helper Methods
    func shuffleCharacter(faction: String){
        if faction == "GoodGuy" {
            let shuffledGoodGuys = CharacterController.goodGuys.shuffled()
            let goodGuys = shuffledGoodGuys.prefix(3)
            displayedCharacters = Array(goodGuys)
            targetedCharacter = CharacterController.badGuys.randomElement()
        } else {
            let shuffledBadguys = CharacterController.badGuys.shuffled()
            let badGuys = shuffledBadguys.prefix(3)
            displayedCharacters = Array(badGuys)
            targetedCharacter = CharacterController.goodGuys.randomElement()
        }
        updateViews()
    }
    
    func updateViews() {
        guard let character = targetedCharacter else {return}
        displayedCharacters.append(character)
        displayedCharacters.shuffle()
        self.title = "Find \(character.name)"
        collectionView.reloadData()
    }
    
    func presentAlert(character: Character){
        let success = character == targetedCharacter
        let alertController = UIAlertController(title: success ? "Let's-a-go!" : "BAHAWHAW!", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Play Again!", style: .default) { (_) in
            self.shuffleCharacter(faction: self.selectedFaction)
        }
        
        alertController.addAction(doneAction)
        
        if success{
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterVC" {
            guard let destination = segue.destination as? FilterViewController else {return}
            
            destination.delegate = self
        }
    }
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell()}
    
        let character = displayedCharacters[indexPath.row]
        cell.character = character
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = displayedCharacters[indexPath.row]
        presentAlert(character: character)
    }

}//End of class


//MARK: - Extension
extension CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 30)
    }
}//End of extension

extension CardCollectionViewController: FilterSelectionDelegate {
    func factionWasSelected(faction: String) {
        selectedFaction = faction
        shuffleCharacter(faction: faction)
    }
}//End of extension
