//
//  WordsTableViewCell.swift
//  Dictionary
//
//  Created by Cüneyt Erçel on 4.09.2022.
//

import UIKit

class WordsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var turkishLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
