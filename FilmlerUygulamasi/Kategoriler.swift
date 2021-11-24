//
//  Kategoriler.swift
//  FilmlerUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import Foundation

class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init() {
        
    }
    
    init(kategori_id:Int,kategori_ad:String) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}
