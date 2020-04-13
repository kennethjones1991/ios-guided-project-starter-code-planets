//
//  PlanetCollectionViewCell.swift
//  CodePlanets
//
//  Created by Ben Gohlke on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PlanetCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Initialization
    
    // This init method is required, but since we're not going to use it
    // (mostly used by storyboard), we'll warn others not to use it by adding
    // the fatalError call (which intentionally crashes the app).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard let planet = planet else { return }
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
    private func setUpSubviews() {
        // Image View
        // 1. Create/configure
        
        // 2. Add to view hierarchy
        
        // 3. Create/activate constraints
        
        // Label
        // 1. Create/configure
        
        // 2. Add to view hierarchy
        
        // 3. Create/activate constraints
        
    }
}
