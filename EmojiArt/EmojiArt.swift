//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Thara Nagaraj on 12/13/18.
//  Copyright © 2018 Thara Nagaraj. All rights reserved.
//

import Foundation


struct EmojiArt : Codable{
    var url : URL
    var emojis = [EmojiInfo]()
    
    struct EmojiInfo : Codable{
        let x : Int
        let y : Int
        let text : String
        let size : Int
    }
    
    var json : Data?{
        return try? JSONEncoder().encode(self)
    }
    
    init(url : URL, emojis: [EmojiInfo]){
        self.url = url
        self.emojis = emojis
    }
    
    init? (json: Data){
        if let newValue = try? JSONDecoder().decode(EmojiArt.self, from: json){
            self = newValue
        } else{
            return nil
        }
    }
    
}
