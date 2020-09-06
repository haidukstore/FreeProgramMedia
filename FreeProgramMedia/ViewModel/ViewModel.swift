//
//  ViewModel.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import Foundation
import UIKit


protocol ViewModelProtocol {
    
    associatedtype Bindings
    associatedtype Model: Codable
    var provider: APIProvider { get }
}


protocol ViewModelAttachingProtocol: class {
    associatedtype ViewModel: ViewModelProtocol
    
    var bindings: ViewModel.Bindings { get }
    var viewModel: ViewModel! { get set }
    
    func bind(viewModel: ViewModel) -> ViewModel
    func configureReactiveBinding(viewModel: ViewModel) -> ViewModel
}

extension ViewModelAttachingProtocol where Self: UIViewController {
    
    static func initWith(viewModel: ViewModel, storyboard: String = "Main") -> Self {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let fullDescription = Self.description()
        let decription = String(fullDescription.split(separator: ".").last ?? "")
        let vc: Self = storyboard.instantiateViewController(identifier: decription)
        vc.viewModel = vc.bind(viewModel: viewModel)
        return vc
    }
    
    @discardableResult
    func bind(viewModel: ViewModel) -> ViewModel {

        loadViewIfNeeded()
        return configureReactiveBinding(viewModel: viewModel)
    }
}
