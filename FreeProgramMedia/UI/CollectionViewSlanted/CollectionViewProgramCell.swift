//
//  CollectionViewSlantedCell.swift
//  FreeProgramMedia
//
//  Created by Roman Haiduk on 06.09.2020.
//  Copyright © 2020 Roman Haiduk. All rights reserved.
//

import UIKit
import SDWebImage


class CollectionViewProgramCell: CollectionViewSlantedCell {
    
    @IBOutlet weak var imageView: SDAnimatedImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var gradient = CAGradientLayer()
    
    var imageHeight: CGFloat {
           return (imageView?.image?.size.height) ?? 0.0
    }
    
    var imageWidth: CGFloat {
           return (imageView?.image?.size.width) ?? 0.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        if let backgroundView = backgroundView {
            gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradient.locations = [0.0, 1.0]
            gradient.frame = backgroundView.bounds
            backgroundView.layer.addSublayer(gradient)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let backgroundView = backgroundView {
            gradient.frame = backgroundView.bounds
        }
    }

    
    func offset(_ offset: CGPoint) {
        imageView.frame = imageView.bounds.offsetBy(dx: offset.x, dy: offset.y)
    }
}


extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
        
        self.dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as! T
    }
}
