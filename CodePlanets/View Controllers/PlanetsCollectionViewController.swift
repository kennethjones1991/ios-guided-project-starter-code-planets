//
//  PlanetsCollectionViewController.swift
//  CodePlanets
//
//  Created by Ben Gohlke on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PlanetsCollectionViewController: UIViewController {

    // MARK: - Properties
    
    let planetController = PlanetController()
    private var collectionView: UICollectionView?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Our Planets"
    }
    
    // MARK: - Private
    
    private func configureCollectionView() {
        // 1. Create a collection view layout object and configure it
        
        // 2. Create a collection view and assign it the above layout,
        //    set the background color
        
        // 3. Add the collection view to the view hierarchy
        
        // 4. Register the appropriate cell class to the collection view
        
        // 5. Assign the datasource
        
        // 6. Assign the local collection view to the property to
        //    add a strong reference such that it won't get deallocated
        
    }
    
    /// Takes the place of a segue between the button and the settings view
    /// Use the below method to init a `SettingsViewController` and present
    /// it from the navigation controller.
    @objc private func presentSettingsView() {
        
    }
}

extension PlanetsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCollectionViewCell.reuseIdentifier, for: indexPath) as? PlanetCollectionViewCell else {
            fatalError("Dequeued cell could not be cast as \(PlanetCollectionViewCell.self)")
        }

        cell.planet = planetController.planets[indexPath.item]
        return cell
    }
}

extension PlanetsCollectionViewController: SettingsDelegate {
    func settingsWereUpdated() {
        
    }
}
