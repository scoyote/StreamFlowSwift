//
//  stcClasses.swift
//  Scorekeeper
//
//  Created by Samuel Croker on 4/1/16.
//  Copyright © 2016 scoyote. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MyAnnotation: NSObject,MKAnnotation {
    
    var title : String?
    var subTit : String?
    var coordinate : CLLocationCoordinate2D
    
    init(title:String,coordinate : CLLocationCoordinate2D,subtitle:String){
        
        self.title = title;
        self.coordinate = coordinate;
        self.subTit = subtitle;
        
    }
    
}