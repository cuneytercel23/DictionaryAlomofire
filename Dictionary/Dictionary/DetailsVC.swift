//
//  DetailsVC.swift
//  Dictionary
//
//  Created by Cüneyt Erçel on 4.09.2022.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var detailsEnglishLabel: UILabel!
    
    @IBOutlet weak var detailsTurkishLabel: UILabel!
    
    var words:Words?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let w = words { // direk words olarak yapardık da işte güya güvenlik yani w.ingilizce yerine words. ingilizce de yapardık.
            detailsEnglishLabel.text = w.ingilizce
            detailsTurkishLabel.text = w.turkce
            
            
        }

    }
    


}
