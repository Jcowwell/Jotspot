//
//  User.swift
//  Jotspot
//
//  Created by Jevon Cowell on 9/17/17.
//  Copyright © 2017 TJS. All rights reserved.
//

import Foundation
import MapKit

class User {
    
    var id: String?
    var firstName: String?
    var lastName: String?
    var age: Int?
    var email: String?
    var phone: String?
    var x: Double?
    var y: Double?
    var area: MKCircle?
    var center: CLLocation?
    var location: CLLocationCoordinate2D?
    var radius: Double = 5
    var localBroadcastPins = [BroadcastAnnotation]()
    
    init() {
        
    }
    
    init(location: CLLocationCoordinate2D) {
        self.location = location
        center = CLLocation(latitude: location.latitude, longitude: location.longitude)
    }
    
    
    
    
    func hotSpotAvaliable() -> Bool {
        return localBroadcastPins.count == nil
    }
    
    func findHotspot(_ hotspots: Hotspot) {
        
        
        var distance: Double?
        distance = center?.distance(from: hotspots.center!)
        if (distance! < radius) || (distance! == radius) {
            
            for x in hotspots.broadcasts {
                print(x.name!)
                localBroadcastPins.append( BroadcastAnnotation(name: x.name!, summary: x.description!, coordinate: x.location!))
            }
        }
        
    }
    
    func findBroadcast() {
        let hotspots = Hotspot()
        var distance: Double?
        for cast in hotspots.broadcasts {
            distance = center?.distance(from: cast.center!)
            if (distance! < radius) || (distance! == radius) {
                
                
            }
        }
    }
}

    
    
    
    
