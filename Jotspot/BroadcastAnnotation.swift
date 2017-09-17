//
//  BroadcastAnnotation.swift
//  Jotspot
//
//  Created by Jevon Cowell on 9/17/17.
//  Copyright © 2017 TJS. All rights reserved.
//

import Foundation
import MapKit

class BroadcastAnnotation: NSObject, MKAnnotation  {
    
    var title: String?
    var subtitle: String?
    var coordinate : CLLocationCoordinate2D
    
    init(name:String,summary: String, coordinate : CLLocationCoordinate2D){
        
        self.title = name;
        self.subtitle = summary
        self.coordinate = coordinate;
    }
    
}
