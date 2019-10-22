//
//  PaletteListViewController.swift
//  PaletteiOS29
//
//  Created by Austin Goetz on 10/22/19.
//  Copyright © 2019 Darin Armstrong. All rights reserved.
//

// Step 1 - Declare our Views
// Step 2 - Add our subviews to their superview
// Step 3 - Constrain our views

import UIKit

class PaletteListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Create SubViews (Part One)
    
    let featuredButton: UIButton = {
        let button = UIButton()
        button.setTitle("Featured", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let doubleRainbowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Double Rainbow", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        
        return stackView
    }()
    
    let paletteTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
}
