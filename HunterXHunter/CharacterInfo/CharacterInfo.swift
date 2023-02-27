//
//  CharacterInfo.swift
//  HunterXHunter
//
//  Created by Felipe Augusto Correia on 27/02/23.
//

import UIKit

class CharacterInfo: UIViewController {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    var nameReceived: String = ""
    var descReceived: String = ""
    var imageReceived: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        characterName.text = nameReceived
        descLabel.text = descReceived
        characterImage.image = imageReceived
    }
    
    func setupCharacterInfo(hunter: Hunter) {
        nameReceived = hunter.name
        descReceived = hunter.desc
        imageReceived = hunter.hunterImage2
    }
}
