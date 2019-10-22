//
//  ColorPaletteView.swift
//  PaletteiOS29
//
//  Created by Austin Goetz on 10/22/19.
//  Copyright © 2019 Darin Armstrong. All rights reserved.
//

import UIKit

class ColorPaletteView: UIView {
    
    var colors: [UIColor] {
        didSet {
            
        }
    }
    
    init(colors: [UIColor] = [], frame: CGRect = .zero) {
        self.colors = colors
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create SubViews (Step One)
    
    lazy var colorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    // MARK: - Add SubViews and Constrain (Steps 2 and 3)
    
    private func setUpViews() {
        addSubview(colorStackView)
        colorStackView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, topPadding: 0, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0)
    }
}
