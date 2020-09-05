//
//  APIProvider.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation
import Moya
import RxSwift


class APIProvider {
    
    let provider: MoyaProvider<Request>
    
    var plugin: NetworkLoggerPlugin = {
        
        NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { (target, array) in
            if let log = array.first {
                print(log)
            }
        }, logOptions: .formatRequestAscURL))
    }()
    
    let disposeBag = DisposeBag()
    
    init() {
        provider = .init(plugins: [plugin])
    }
    
    func getMediaLibraryFree() -> Single<Response> {
        provider.rx.request(.mediaFree)
    }
    
}
