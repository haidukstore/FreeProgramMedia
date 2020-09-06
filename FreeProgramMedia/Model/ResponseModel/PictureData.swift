//
//  PictureData.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation


struct PictureData<Size: Codable>: Codable {
    
    struct Resolution<Size: Codable>: Codable {
        let url: String?
        let size: Size?
    }
    
    let url: String?
    let thumbnail: String?
    let resolutions: [Resolution<Size>]
    
    var URL: Foundation.URL? {
        return Foundation.URL(string: url ?? "")
    }
}
