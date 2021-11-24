//
//  Kategorilerdao.swift
//  FilmlerUygulamasi
//
//  Created by Ebubekir Aykut on 24.11.2021.
//  Copyright © 2021 info. All rights reserved.
//

import Foundation

class Kategorilerdao{
    
    let db:FMDatabase?
    
    init(){
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: targetWay).appendingPathComponent("filmler.sqlite")
        
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func kategorileriAl() -> [Kategoriler]{
        var list = [Kategoriler]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            
            while rs.next() {
                let kategori = Kategoriler(kategori_id: Int(rs.string(forColumn: "kategori_id")!)!, kategori_ad: rs.string(forColumn: "kategori_ad")!)
                
                list.append(kategori)
            }
        } catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return list
    }
}
