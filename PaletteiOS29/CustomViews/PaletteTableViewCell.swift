//
//  PaletteTableViewCell.swift
//  PaletteiOS29
//
//  Created by Austin Goetz on 10/22/19.
//  Copyright © 2019 Darin Armstrong. All rights reserved.
//

import UIKit

class PaletteTableViewCell: UITableViewCell {

    var photo: UnsplashPhoto? {
        didSet {
            // Update Views
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Declare SubViews (Step One)
    
    lazy var paletteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = (contentView.frame.height/10)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var paletteTitleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var colorPaletteView: ColorPaletteView = {
       let paletteView = ColorPaletteView()
        
        return paletteView
    }()
}
