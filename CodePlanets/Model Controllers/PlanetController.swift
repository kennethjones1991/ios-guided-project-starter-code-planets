//
//  PlanetController.swift
//  CodePlanets
//
//  Created by Ben Gohlke on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class PlanetController {
    var planets: [Planet] {
        var result = [Planet(name: "Mercury"),
                      Planet(name: "Venus"),
                      Planet(name: "Earth"),
                      Planet(name: "Mars"),
                      Planet(name: "Jupiter"),
                      Planet(name: "Saturn"),
                      Planet(name: "Uranus"),
                      Planet(name: "Neptune")]
        
        let shouldShowPluto = UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
        if shouldShowPluto {
            result.append(Planet(name: "Pluto"))
        }
        
        return result
    }
}
