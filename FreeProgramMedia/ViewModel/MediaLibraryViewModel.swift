//
//  MediaLibraryViewModel.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


final class MediaLibraryViewModel: ViewModelProtocol {
    
    struct Bindings {
        
    }

    typealias Model = Library
    
    let provider: APIProvider
    private let library = PublishSubject<Result<Model, Error>>()
    
    var onLibrary: Observable<Result<Model, Error>> {
        return library.asObservable()
    }
    
    init() {
        provider = APIProvider()
    }
    
    func getLibrary() {
        
    }
}
