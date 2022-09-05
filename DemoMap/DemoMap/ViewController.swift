//
//  ViewController.swift
//  DemoMap
//
//  Created by MAC on 8/20/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocation(latitude: 21.0367743, longitude: 105.8346955)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        //khu vuc nhin thay tren map
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.region = region
        
        //kieu ban do
        mapView.mapType = .satellite
        
    }


    @IBAction func moveToCurrentLocation(_ sender: UIButton) {
    }
}

