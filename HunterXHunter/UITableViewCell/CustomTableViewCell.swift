//
//  CustomTableViewCell.swift
//  HunterXHunter
//
//  Created by Felipe Augusto Correia on 27/02/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterImageView.contentMode = .scaleAspectFill
    }
    
    func setupCell(hunter: Hunter) {
        
        characterNameLabel.text = hunter.name
        
        characterImageView.image = hunter.hunterImage
    }

}
