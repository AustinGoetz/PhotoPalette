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
    
    // MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    var buttons: [UIButton] {
        return[featuredButton, doubleRainbowButton, randomButton]
    }
    
    var photos: [UnsplashPhoto] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - API Helper Function
    
    func searchForCategory(_ route: UnsplashRoute) {
        UnsplashService.shared.fetchFromUnsplash(for: route) { (photos) in
            DispatchQueue.main.async {
                guard let photos = photos else { return }
                self.photos = photos
                self.paletteTableView.reloadData()
            }
        }
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
    
    // MARK: - Add SubViews (Part Two)
    
    func addAllSubViews() {
        self.view.addSubview(featuredButton)
        self.view.addSubview(randomButton)
        self.view.addSubview(doubleRainbowButton)
        self.view.addSubview(buttonStackView)
        self.view.addSubview(paletteTableView)
    }
    
    func setUpStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.addArrangedSubview(featuredButton)
        buttonStackView.addArrangedSubview(doubleRainbowButton)
        buttonStackView.addArrangedSubview(randomButton)
    }
    
    func configureTableView() {
        paletteTableView.delegate = self
        paletteTableView.dataSource = self
        paletteTableView.register(PaletteTableViewCell.self, forCellReuseIdentifier: "paletteCell")
        paletteTableView.allowsSelection = false
    }
    
    // MARK: - Constrain Views (Part Three)
    
    func constrainViews() {
        paletteTableView.anchor(top: buttonStackView.bottomAnchor, bottom: self.safeArea.bottomAnchor, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: (buttonStackView.frame.height/2), bottomPadding: 0, leadingPadding: 0, trailingPadding: 0)
        
        buttonStackView.anchor(top: self.safeArea.topAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 0, bottomPadding: 0, leadingPadding: 8, trailingPadding: 8)
    }
    
    // MARK: - IBAction For Buttons
    func activateButtons() {
        buttons.forEach{ $0.addTarget(self, action: #selector(searchButtonTapped(sender:)), for: .touchUpInside)}
    }
    
    @objc func searchButtonTapped(sender: UIButton) {
        selectButton(sender)
        switch sender {
        case randomButton:
            searchForCategory(.random)
        case doubleRainbowButton:
            searchForCategory(.doubleRainbow)
        case featuredButton:
            searchForCategory(.featured)
        default:
            print("Error, button was not found")
        }
    }
    
    func selectButton(_ button: UIButton) {
        
        buttons.forEach {$0.setTitleColor(UIColor(named: "offWhite"), for: .normal)}
        button.setTitleColor(UIColor(named: "devMountainBlue"), for: .normal)
    }
    
    
}


extension PaletteListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
