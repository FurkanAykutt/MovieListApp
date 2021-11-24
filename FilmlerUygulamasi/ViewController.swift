//
//  ViewController.swift
//  FilmlerUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kategoriTableView: UITableView!
    
    var kategorilerListe = [Kategoriler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        copyDataBase()
        
        kategorilerListe = Kategorilerdao().kategorileriAl()
        
        kategoriTableView.delegate = self
        kategoriTableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let destinationVC = segue.destination as! FilmViewController
        destinationVC.kategori = kategorilerListe[indeks!]
    }
    
    func copyDataBase(){
        
        let bundleWay = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let targetToCopy = URL(fileURLWithPath: targetWay).appendingPathComponent("filmler.sqlite")
        
        if fileManager.fileExists(atPath: targetToCopy.path){
            print("Don't need to copy Database")
        }else{
            do {
                try fileManager.copyItem(atPath: bundleWay!, toPath: targetToCopy.path)
            } catch  {
                print(error)
            }
        }
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategorilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kategori = kategorilerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre", for: indexPath) as! KategoriHucreTableViewCell
        
        cell.labelKategoriAd.text = kategori.kategori_ad
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toFilm", sender: indexPath.row)
    }
}
