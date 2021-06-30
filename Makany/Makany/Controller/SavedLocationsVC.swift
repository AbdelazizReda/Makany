//
//  SavedLocationsVC.swift
//  Makany
//
//  Created by عبدالعزيز رضا  on 5/26/21.
//

import UIKit
import CoreLocation
import MapKit

class SavedLocationsVC: UIViewController {
    @IBOutlet weak var LocationsTableView: UITableView!
    
    //load a new location when view controller appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        LocationsTableView.reloadData()
        print(Places.shared.LandMarks)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //setup table view delegets and nibs
        setUpUI()
    }

    
    fileprivate func setUpUI() {
        LocationsTableView.delegate = self
        LocationsTableView.dataSource = self
        LocationsTableView.register(UINib(nibName: "LocationsCell", bundle: nil), forCellReuseIdentifier: "LocationsCell")
    }
    

    
}

//MARK:- Saved locations  tableView methods
extension SavedLocationsVC:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.shared.LandMarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationsCell") as! LocationsCell
        cell.name.text = Places.shared.LandMarks[indexPath.row].name
        cell.des.text = Places.shared.LandMarks[indexPath.row].description
        cell.date.text = DateFormatter.localizedString(from: Places.shared.LandMarks[indexPath.row
        ].time, dateStyle: .short, timeStyle: .short)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let latitude:CLLocationDegrees =  Places.shared.LandMarks[indexPath.row].lan
        let longitude:CLLocationDegrees = Places.shared.LandMarks[indexPath.row].lon
        
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "London, England"
        mapItem.openInMaps(launchOptions: options)

        

       
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let landmark = Places.shared.LandMarks[indexPath.row]
        delete(landmark)
        tableView.reloadData()
        
    }
    
}
