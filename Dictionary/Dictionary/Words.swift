//
//  Words.swift
//  Dictionary
//
//  Created by Cüneyt Erçel on 4.09.2022.
//

import Foundation

class Words : Codable {
    
    var kelime_id :String? // Normalde bunu int demiştik php web servisinde string istiyor diye tamamı aynı olmalı. hem girdiğim isim yani kelime_id turkce ve ingilizce hemde sağ tarafındaki sınıfı aynı olmalı.
    var ingilizce : String?
    var turkce : String?
    
    init() {
        
    }
    
    init(kelime_id:String, ingilizce: String, turkce: String) {
        self.kelime_id = kelime_id
        self.turkce = turkce
        self.ingilizce = ingilizce 
    }
    
}
