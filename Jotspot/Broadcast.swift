//
//  Broadcast.swift
//  Jotspot
//
//  Created by Jevon Cowell on 9/17/17.
//  Copyright © 2017 TJS. All rights reserved.
//

import Foundation
import MapKit

class Broadcast {
    var name: String?
    var description: String?
    var id: String?
    var user: String?
    var x: Double?
    var y: Double?
    var area: MKCircle?
    var center: CLLocation?
    var location: CLLocationCoordinate2D?
    var radius: Double = 5.0
    var spotee: Broadcast?
    var next: Broadcast?
    var time: String?
    
    init() {
        
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
        location = CLLocationCoordinate2D(latitude: x, longitude: y)
        center = CLLocation(latitude: location!.latitude, longitude: location!.longitude)
        area = MKCircle(center: location!, radius: radius)
        createPotentialHotspot()
        if createdHotspot() {
            //Populate Firebase with new Hotspot
        }
    }
    
    init(name: String, description: String, time: String, user: String, x: Double, y: Double) {
        self.name = name
        self.description = description
        self.x = x
        self.y = y
        self.time = time
        self.user = user
        center = CLLocation(latitude: x, longitude: y)
        
        location = CLLocationCoordinate2D(latitude: x, longitude: y)
        area = MKCircle(center: location!, radius: radius)
    }
    
    
    func createdHotspot() -> Bool {
        return spotee != nil
    }
    
    func createPotentialHotspot() {
        let hotspots = Hotspot()
        var distance: Double?
        for cast in hotspots.broadcasts {
            distance = center?.distance(from: cast.center!)
            if (distance! < radius) || (distance! == radius) {
                if self.spotee != nil {self.spotee = cast; next = spotee}
                else {
                    next?.spotee = cast
                    next = cast
                }
            }
        }
    }
}


class Hotspot {
    var name: String?
    var area: Double?
    var x: Double?
    var y: Double?
    var broadcasts = [Broadcast]()
    var center: CLLocation?
    var location: CLLocationCoordinate2D?
    var radius: Double = 5

    
    init() {
        center = CLLocation(latitude: 42.3558, longitude: -71.1056)
    }
    
    init(area: Double, x: Double, y: Double) {
        self.area = area
        self.x = x
        self.y = y
    }
    
    
}
