//
//  HomeViewController.swift
//  Jotspot
//
//  Created by Jevon Cowell on 9/16/17.
//  Copyright © 2017 TJS. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase

class HomeViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    let hotspot: Hotspot? = Hotspot()
    
    @IBOutlet weak var userLocation: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        var ref: DatabaseReference!
        
        var name: String?
        var description: String?
        var x: Double?
        var y: Double?
        var user: String?
        var time: String?
        
        
        ref = Database.database().reference().child("Hotspot").child("Brodcast")
        
        ref.observe(.value, with:{ (snapshot: DataSnapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                
                print(value)

                
                x = (value as! NSDictionary).value(forKey: "x") as? Double
                y = (value as! NSDictionary).value(forKey: "y") as? Double
                time = (value as! NSDictionary).value(forKey: "time") as? String
                user = (value as! NSDictionary).value(forKey: "user") as? String
                description = (value as! NSDictionary).value(forKey: "description") as? String
                name = (value as! NSDictionary).value(forKey: "name") as? String
           
                self.hotspot?.broadcasts.append(Broadcast(name: name!, description: description!, time: time!, user: user!, x: x!, y: y!))
                
                print(self.hotspot!.broadcasts.count)
                
                print(self.hotspot!)
            }
        })
    }
    
    
    @IBAction func didTapMyLocation(_ sender: Any) {
        let userLocation = CLLocationCoordinate2D(latitude: locationManager.location!.coordinate.latitude,longitude: locationManager.location!.coordinate.longitude)

        let user: User? = User(location: userLocation)
        user?.findHotspot(hotspot!)
        
        
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation, 200, 200)
        mapView.setRegion(viewRegion, animated: true)
        if user!.hotSpotAvaliable() {
            for x in user!.localBroadcastPins {
                self.mapView.addAnnotation(x)
            }
        }

        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        isAuthorizedtoGetUserLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation();
            
        }

        if mapView != nil {
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: - Functions
    
    func isAuthorizedtoGetUserLocation() {
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("User allowed us to access location")
            //do whatever init activities here.
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            print("location:: \(locations)")
        }
       
        //store the user location here to firebase or somewhere
    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        print("Did location updates is called but failed getting location \(error)")
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
