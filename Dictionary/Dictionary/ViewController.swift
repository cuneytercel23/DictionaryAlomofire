//
//  ViewController.swift
//  Dictionary
//
//  Created by Cüneyt Erçel on 4.09.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var wordList = [Words]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        getAllContacts()
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        
        let DetailsVC = segue.destination as! DetailsVC
        
        DetailsVC.words  = wordList[index!] // burada detalisvc.w yapamıyoruz cünkü w yok diyor words yapıcaz o yüzden 
        DetailsVC.words = wordList[index!]
        
        
    }
    
    
    
    
    
    func getAllContacts() { // tüm kişileri al select işlemi.
        AF.request("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php", method: .get).response {
            response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(DictionaryResponse.self, from: data) // Dictionary Responsedaki kelimeler yazan yeri web servisi ile bağdaştırıyor ve verileri decode ederek, json verisini dataya ceviriyor ve cevapa atıyor.
                    if let arrivedWordsList = cevap.kelimeler { // bununla birlikte cevaptaki kelimeler(webservis ismi ve DictionaryResponsadeki) arrivedWordsliste atıyoruz.
                        self.wordList = arrivedWordsList // wordlisti de arr. e işliyoruz. Ve bu işi yaparak verileri almış oluyoruz.
                    }
                    
                    DispatchQueue.main.async { // bunu da yaparak arayüzü güncellemiş oluyorum.
                        self.tableView.reloadData()
                    }
                    
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
    }
    
    
    
    // getall contacts kopyalayıp ekleme yapacaz.
    // parametre, post işlemi dışında her şey aynı ve bu doSearchı aşağıdaki, searchbar extensionun içinde calıstırıcam.
    
    func doSearch (searchingWord : String) { // arama işlemi
        
        let parameter: Parameters = ["ingilizce":searchingWord] // bununla parametre belirttik arama için
        
        AF.request("http://kasimadalan.pe.hu/sozluk/kelime_ara.php", method: .post, parameters: parameter).response { // method post olcak ve ek oalrak parametre olcak
            response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(DictionaryResponse.self, from: data) // Decode ederek  DictionaryResponsedaki json verisini dataya ceviriyor ve cevapa atıyor.
                    if let arrivedWordsList = cevap.kelimeler { // bununla birlikte cevaptaki kelimeler(webservis ismi ve DictionaryResponsadeki) arrivedWordsliste atıyoruz.
                        self.wordList = arrivedWordsList // wordlisti de arr. e işliyoruz. Ve bu işi yaparak verileri almış oluyoruz.
                    }
                    
                    DispatchQueue.main.async { // bunu da yaparak arayüzü güncellemiş oluyorum.
                        self.tableView.reloadData()
                    }
                    
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
    }

    
}





extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let word = wordList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWords") as! WordsTableViewCell
        
        cell.turkishLabel.text = word.ingilizce
        cell.englishLabel.text = word.turkce
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: indexPath.row)
        
    }
    
    
    
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        doSearch(searchingWord: searchText) 
    }
    
    
}
