//
//  FilmHucreCollectionViewCell.swift
//  FilmlerUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import UIKit

protocol FilmHucreCollectionViewCellProtocol {
    func sepeteEkle(indexPath:IndexPath)
}


class FilmHucreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewFilmResim: UIImageView!
    
    @IBOutlet weak var labelFilmAdi: UILabel!
    @IBOutlet weak var labelFilmFiyat: UILabel!
    
    var hucreProtocol:FilmHucreCollectionViewCellProtocol?
    var indexPath:IndexPath?
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
        
    }
}
