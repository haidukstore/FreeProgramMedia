//
//  Library.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation
import UIKit


struct Size<T: Codable>: Codable {
    let width: T
    let height: T
}

struct Library: Codable {
    
    let programs: [Program]
    
    struct Program: Codable {
    
        let id: String
        let title: String
        let isAvailable: Bool
        let isFree: Bool
        let isFeatured: Bool
        let headphones: Bool
        let descriptionHTML: String?
        let banner: PictureData<Size<Int>>?
        let cover: PictureData<Int>?
        let tracks: [Track]
    }
}
