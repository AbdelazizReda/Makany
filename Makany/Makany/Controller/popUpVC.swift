//
//  popUpVC.swift
//  Makany
//
//  Created by عبدالعزيز رضا  on 5/26/21.
//

import UIKit

class popUpVC: UIViewController {
    //outlets
    @IBOutlet weak var LocationName: UITextField!
    @IBOutlet weak var LocationDescription: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK:- Saving Data about location
    @IBAction func saveInfo(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        //append data in landMark array
        let newLandMark = myLocation(name: LocationName.text!, description: LocationDescription.text!, lan: Places.shared.userLat , lon: Places.shared.userLon , time: Date())
        Places.shared.LandMarks.append(newLandMark)
        
        print("saving good")
    }
}
