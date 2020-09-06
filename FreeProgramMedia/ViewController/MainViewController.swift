//
//  MainViewController.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 05.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, ViewModelAttachingProtocol {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var viewModel: MediaLibraryViewModel!
    
    var bindings: MediaLibraryViewModel.Bindings {
        MediaLibraryViewModel.Bindings()
    }
    
    private var programs = BehaviorRelay<[Library.Program]>(value: [])
    private let disposeBag = DisposeBag()
    

    func configureReactiveBinding(viewModel: MediaLibraryViewModel) -> MediaLibraryViewModel {
        
        viewModel.getLibrary()
        
        viewModel.onLibrary
            .subscribe(onNext: { [weak self] (result) in
                switch result {
                case let .success(lyb):
                    self?.programs.accept(lyb.programs)
                case let .failure(error):
                    print(error)
                     self?.programs.accept([])
                }
                self?.collectionView.collectionViewLayout.invalidateLayout()
            }).disposed(by: disposeBag)
        
        programs
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items) { (collectionView, row, element) in
                
                let indexPath = IndexPath(row: row, section: 0)
                let cell: CollectionViewProgramCell = collectionView.dequeueReusableCell(indexPath: indexPath)
                cell.imageView.sd_setImage(with: element.cover?.URL, completed: nil)
                cell.titleLabel.text = element.title
                
                if let layout = collectionView.collectionViewLayout as? CollectionViewSlantedLayout {
                    cell.contentView.transform = CGAffineTransform(rotationAngle: layout.slantingAngle)
                }
                return cell
            
        }.disposed(by: disposeBag)
        
        
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (collectionView.collectionViewLayout as! CollectionViewSlantedLayout).itemSize = 300
        (collectionView as UIScrollView).delegate = self
    }
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = collectionView else {return}
        guard let visibleCells = collectionView.visibleCells as? [CollectionViewProgramCell] else {return}
        
        let yOffsetSpeed: CGFloat = 100.0
        
        for parallaxCell in visibleCells {
            let yOffset = (collectionView.contentOffset.y - parallaxCell.frame.origin.y) / parallaxCell.imageHeight
            parallaxCell.offset(CGPoint(x: parallaxCell.imageView.frame.minX,
                                        y: yOffset * yOffsetSpeed))
        }
    }
}
