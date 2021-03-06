//
//  ViewController.swift
//  Scorekeeper
//
//  Created by Samuel Croker on 3/31/16.
//  Copyright © 2016 scoyote. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    @IBAction func btnLoad(_ sender: UIButton) {
        
      
        // Do any additional setup after loading the view, typically from a nib.
        let homeLat = Float32((locationManager.location?.coordinate.latitude)!)
        let homeLon = Float32((locationManager.location?.coordinate.longitude)!)
        let latDelta = Float32( self.mapView.region.span.latitudeDelta)
        let lonDelta = Float32( self.mapView.region.span.longitudeDelta)
        
       
        
        let latN = homeLat + latDelta/2
        let latS = homeLat - latDelta/2
        let lonW = homeLon - lonDelta/2
        let lonE = homeLon + lonDelta/2
        
        let url = URL(string: "http://waterservices.usgs.gov/nwis/site/?format=rdb&bBox=\(lonW),\(latS),\(lonE),\(latN)&parameterCd=00060,00065")
        
        //print(url as String)
        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            let rx:String? = String(data: data!, encoding: String.Encoding.utf8)
            
            var result:Array? = rx!.components(separatedBy: "\n")
            
            for (index, element) in result!.enumerated() {
                let r2:Array? = result![index].components(separatedBy: "\t")
                if r2![0] == "USGS"{
                    
                    print("\(index): \(element)")
                    print("\(index): Title \(r2![1])")
                    print("\(index): SubTitle \(r2![2])")
                    print("\(index): Latitude \(r2![4])")
                    print("\(index): Longitude \(r2![5])")
                    let latitude:CLLocationDegrees = (r2![4] as NSString).doubleValue
                    let longitude:CLLocationDegrees = (r2![5] as NSString).doubleValue
                    
                    let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                    
                    let pp = MyAnnotation(title: r2![2].capitalized,coordinate: location, subtitle: r2![1].capitalized )
                    
                    self.mapView.addAnnotation(pp);
                    //Instead of writing two lines of annotation we can use addAnnotations() to add.
                }
            }
        }) 
        task.resume()
    }
    @IBOutlet var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate  = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors: " + error.localizedDescription)
    }
    
    
    
    
    
}

