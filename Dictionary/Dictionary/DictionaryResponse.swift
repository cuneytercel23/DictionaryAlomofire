//
//  DictionaryResponse.swift
//  Dictionary
//
//  Created by Cüneyt Erçel on 5.09.2022.
//

import Foundation

class DictionaryResponse : Codable { // Burada Web servisinden gelen verileri pars etme işlemi yapacağız.
    
    var kelimeler: [Words]? // Buradaki kelimeler ismi kesinlikle web servisindeki ile aynı olmalıdır. Wordsü ben verdim zaten words dosyasında.
}
