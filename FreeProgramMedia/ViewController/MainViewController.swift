//
//  MainViewController.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ViewModelAttachingProtocol {
    
    
    var viewModel: MediaLibraryViewModel!
    
    var bindings: MediaLibraryViewModel.Bindings {
        MediaLibraryViewModel.Bindings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func configureReactiveBinding(viewModel: MediaLibraryViewModel) -> MediaLibraryViewModel {
        return viewModel
    }

}

