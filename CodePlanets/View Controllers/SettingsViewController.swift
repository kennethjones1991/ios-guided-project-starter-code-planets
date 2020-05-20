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
    let delegate: SettingsDelegate
    
    // MARK: - Initialization
    init(with delegate: SettingsDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    // This init method is required, but since we're not going to use it
    // (mostly used by storyboard), we'll warn others not to use it by adding
    // the fatalError call (which intentionally crashes the app).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.setUpSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate.settingsWereUpdated()
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
        let doneButton = UIButton(type: .system)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        // 2. Add to view hierarchy
        view.addSubview(doneButton)
        
        // 3. Create constraints
        let doneButtonTopConstraint = doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        let doneButtonTrailingConstraint = NSLayoutConstraint(item: doneButton,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: view.safeAreaLayoutGuide,
                                                              attribute: .trailing,
                                                              multiplier: 1,
                                                              constant: -20)
        
        // Switch
        // 1. Create/configure
        shouldShowPlutoSwitch.translatesAutoresizingMaskIntoConstraints = false
        shouldShowPlutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto(_:)), for: .valueChanged)
        
        // 2. Add to view hierarchy
        view.addSubview(shouldShowPlutoSwitch)
        
        // 3. Create constraints
        let switchTopConstraint = shouldShowPlutoSwitch.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 60)
        let switchTrailingConstraint = shouldShowPlutoSwitch.trailingAnchor.constraint(equalTo: doneButton.trailingAnchor)
        
        // Label
        // 1. Create/configure
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Is Pluto a planet?"
        
        // 2. Add to view hierarchy
        view.addSubview(label)
        
        // 3. Create constraints
        let labelLeading = label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let labelCenterYConstraint = label.centerYAnchor.constraint(equalTo: shouldShowPlutoSwitch.centerYAnchor)
        
        // All
        // 4. Activate constraints
        NSLayoutConstraint.activate([
            doneButtonTopConstraint,
            doneButtonTrailingConstraint,
            switchTopConstraint,
            switchTrailingConstraint,
            labelLeading,
            labelCenterYConstraint
        ])
        
    }
}

