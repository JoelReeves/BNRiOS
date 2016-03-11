//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Joel Reeves on 3/11/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // create a map view
        mapView = MKMapView()
        
        // set it as the view of this view controller
        view = mapView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
}
