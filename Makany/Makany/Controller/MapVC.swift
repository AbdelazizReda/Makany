//
//  MapVC.swift
//  Makany
//
//  Created by عبدالعزيز رضا  on 5/26/21.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {
    @IBOutlet weak var MapV: MKMapView!

    
    let locationmanager = CLLocationManager()
    let radius: CLLocationDistance = 500

    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.delegate = self
        locationmanager.requestAlwaysAuthorization()
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()

    }
    
    @IBAction func SaveInfo(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "popUpVC") as? popUpVC {
            present(vc, animated: true, completion: nil)
            
        }
        
    }
    
}

extension MapVC: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        Places.shared.userLat = location?.coordinate.latitude ?? 0.0
        Places.shared.userLon = location?.coordinate.longitude ?? 0.0

        
        
        
        //put location in map
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        MapV.setRegion(region, animated: true)
        MapV.showsUserLocation = true
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    
}
