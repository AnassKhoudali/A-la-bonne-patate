//
//  MenuItemData.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-11.
//

import Foundation

var menuItemData: [MenuItem] = loadJson("menuItem.json")

func loadJson<T: Decodable>(_ filename: String) -> T{
    let data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("\(filename) not found.")
    }
    do{
        data = try Data (contentsOf: file)
    }catch{
        fatalError("could not load \(filename): \(error)")
    }
    do{
        return try JSONDecoder().decode(T.self, from: data)
    }catch{
        fatalError("unable to parse \(filename): \(error)")
    }
}
