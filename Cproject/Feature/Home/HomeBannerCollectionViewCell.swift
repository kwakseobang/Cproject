//
//  HomeBannerCollectionViewCell.swift
//  Cproject
//
//  Created by 곽서방 on 6/24/24.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
