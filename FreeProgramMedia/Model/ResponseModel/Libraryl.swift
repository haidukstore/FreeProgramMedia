//
//  Library.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation
import UIKit


struct Library: Codable {
    
    let id: String
    let title: String
    let isAvailable: Bool
    let isFree: Bool
    let isFeatured: Bool
    let headphones: Bool
    let descriptionHTML: String?
    let banner: PictureData<Double>?
    let cover: PictureData<CGSize>?
    let track: [Track]
}
