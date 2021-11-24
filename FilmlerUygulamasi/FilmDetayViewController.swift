//
//  FilmDetayViewController.swift
//  FilmlerUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import UIKit

class FilmDetayViewController: UIViewController {
    @IBOutlet weak var imageViewFilmResim: UIImageView!
    
    @IBOutlet weak var labelFilmAd: UILabel!
    @IBOutlet weak var labelFilmYil: UILabel!
    @IBOutlet weak var labelFilmKategori: UILabel!
    @IBOutlet weak var labelFilmYonetmen: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let f = film{
            navigationItem.title = "\(f.film_ad!)"
            labelFilmAd.text = f.film_ad
            labelFilmYil.text = String(f.film_yil!)
            imageViewFilmResim.image = UIImage(named: f.film_resim!)
            labelFilmKategori.text = f.kategori?.kategori_ad
            labelFilmYonetmen.text = f.yonetmen?.yonetmen_ad
            
        }
    }

}
