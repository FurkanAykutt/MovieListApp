//
//  Yonetmenler.swift
//  FilmlerUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import Foundation

class Yonetmenler {
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init() {
        
    }
    
    init(yonetmen_id:Int,yonetmen_ad:String) {
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}
