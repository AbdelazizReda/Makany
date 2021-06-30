//
//  Places.swift
//  Makany
//
//  Created by عبدالعزيز رضا  on 5/29/21.
//

import Foundation

struct Places {
    
    static var shared = Places()
    var LandMarks:[myLocation] = []
    var userLat:Double = 0.0
    var userLon:Double = 0.0
    
    private init() {
        
    }
    
    
}
