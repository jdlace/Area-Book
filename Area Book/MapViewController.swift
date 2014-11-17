//
//  MapViewController.swift
//  Area Book
//
//  Created by James Schultz on 9/26/14.
//  Copyright (c) 2014 Blue Boxen, LLC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var addressArray = ["236 Grissom Street, Hercules, CA",
        "242 Grissom Street, Hercules, CA",
        "290 Grissom Street, Hercules, CA",
        "200 Grissom Street, Hercules, CA",
        "205 Grissom Street, Hercules, CA",
        "210 Grissom Street, Hercules, CA",
        "214 Grissom Street, Hercules, CA",
        "222 Grissom Street, Hercules, CA",
        "208 Grissom Street, Hercules, CA",
        "201 Grissom Street, Hercules, CA",
        "305 Grissom Street, Hercules, CA",
        "254 Grissom Street, Hercules, CA"]
    lazy var locationManager = CLLocationManager()
    
    @IBAction func unwindToMapVC(segue: UIStoryboardSegue?) {
        
    }
    
    func startLocationUpdates() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        for location in locations {
            
        }
    }
    
    func configureCurrentLocation() {
        self.mapView.showsUserLocation = true
        if let location = self.locationManager.location {
            let coordinate = location.coordinate
            let span = MKCoordinateSpanMake(0.005, 0.005)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func configureAddressAnnotations() {
        for address in addressArray {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address, completionHandler: {
                (placemark: [AnyObject]!, error: NSError!) -> Void in
                let mark = placemark[0] as CLPlacemark
                let coordinate = CLLocationCoordinate2D(latitude: mark.location.coordinate.latitude, longitude: mark.location.coordinate.longitude)
                let mkAnnotation = MKPointAnnotation()
                mkAnnotation.setCoordinate(coordinate)
                self.mapView.addAnnotation(mkAnnotation)
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startLocationUpdates()
        configureCurrentLocation()
        configureAddressAnnotations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

