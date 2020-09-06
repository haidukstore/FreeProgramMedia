//
//  Track.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation


struct Track: Codable {
    
    let key: String
    let title: String
    let order: Int?
    let duration: Int
    let media: Media
    let isAvailable: Bool
}


extension Track {
    
    struct Media: Codable {
        let mp3: MP3
    }
}

extension Track.Media {
    
    struct MP3: Codable {
        let url: String?
        let headUrl: String?
    }
}
