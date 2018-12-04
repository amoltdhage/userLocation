//
//  ViewController.swift
//  userLocation
//
//  Created by Amol Dhage on 03/12/18.
//  Copyright © 2018 AmolTDhage. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //map
    
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
     let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpan (latitudeDelta: 0.01,longitudeDelta: 0.01)
        let mylocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude,
        location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: mylocation, span: span)
        map.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.speed)
        
        self.map.showsUserLocation=true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

