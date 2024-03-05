//
//  ImageCollectionViewCell.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 28/2/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.anchorView(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
