//
//  File.swift
//  
//
//  Created by Jevon Cowell on 9/17/17.
//
//

import Foundation
import Firebase



class DB {

    
    var reference: FIRDatabaseReference?
    var hotspotRef: SFIRDatabaseReference?
    var brodcastRef: FIRDatabaseReference?
    var itemRef: FIRDatabaseReference?
    var userRef: FIRDatabaseReference?
    var vendorRef: FIRDatabaseReference?
    
    init() {
        reference = "jotspot-154e1"
        self.reference
    }
}
