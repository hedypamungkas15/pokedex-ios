//
//  EvolutionCell.swift
//  pokedex-ios
//
//  Created by Hedy on 09/08/21.
//

import UIKit
import Kingfisher

class EvolutionCell: UITableViewCell {

    @IBOutlet private weak var levelLabel: UILabel!
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var leftLabel: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!
    @IBOutlet private weak var rightLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: EvolutionModel) {
        levelLabel.text = "Lv. \(model.level ?? 0)"
        if let image = model.fromSpecies.image {
            leftImageView.kf.setImage(with: URL(string: image), placeholder: nil, options: nil) { _ in
                self.setNeedsLayout()
            }
        }
        leftLabel.text = model.fromSpecies.name
        
        if let image = model.targetSpecies.image {
            rightImageView.kf.setImage(with: URL(string: image), placeholder: nil, options: nil) { _ in
                self.setNeedsLayout()
            }
        }
        rightLabel.text = model.targetSpecies.name
    }
    
}
