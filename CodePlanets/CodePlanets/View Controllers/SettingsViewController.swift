//
//  SettingsViewController.swift
//  CodePlanets
//
//  Created by Ben Gohlke on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func settingsWereUpdated()
}

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    var shouldShowPlutoSwitch = UISwitch()
    
    // MARK: - Initialization
    
    // This init method is required, but since we're not going to use it
    // (mostly used by storyboard), we'll warn others not to use it by adding
    // the fatalError call (which intentionally crashes the app).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // MARK: - Private
    
    @objc private func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }
    
    @objc private func done() {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
    private func setUpSubviews() {
        // Button
        // 1. Create/configure
        
        // 2. Add to view hierarchy
        
        // 3. Create constraints
        
        // Switch
        // 1. Create/configure
        
        // 2. Add to view hierarchy
        
        // 3. Create constraints
        
        // Label
        // 1. Create/configure
        
        // 2. Add to view hierarchy
        
        // 3. Create constraints
        
        // All
        // 4. Activate constraints
        
    }
}

