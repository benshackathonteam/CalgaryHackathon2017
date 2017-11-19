//
//  ViewController.swift
//  Launchpad
//
//  Created by Greg Lund on 2017-11-18.
//  Copyright © 2017 Launchpad Inc. All rights reserved.
//


import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    // You don't need to modify the default init(nibName:bundle:) method.
    var mapView = GMSMapView()
    
    func addMarker(latitude:Double, longtitude:Double, title:String, snippet:String) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        marker.title = title
        marker.snippet = snippet
        marker.map = mapView
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 51.0486151, longitude: -114.0708459, zoom: 10.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        //styling to match app
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        view = mapView
        
        // Creates a marker in the center of the map.
        /*
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 51.0486151, longitude: -114.0708459)
        marker.title = "Calgary"
        marker.snippet = "Alberta"
        marker.map = mapView

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: LRTTable[0].latitude, longitude: LRTTable[0].longitude)
        marker.title = "Calgary"
        marker.snippet = "Alberta"
        marker.map = mapView
*/
        
        var squareFootageMin: Double = Double(EmployeesMax) * 250.0;
        var i:Int
        var MarkerTable: [element] = []

    
        for i in 0...RentFasterTable.count - 1 {
            if RentFasterTable[i].Square_Feet > squareFootageMin {
                var tmp = element(name: RentFasterTable[i].name, longitude: RentFasterTable[i].longitude, latitude: RentFasterTable[i].latitude)
                MarkerTable.append(tmp)
            }
        }
        
        for i in 0 ... MarkerTable.count - 1 {
            addMarker(latitude: MarkerTable[i].latitude, longtitude: MarkerTable[i].longitude, title: MarkerTable[i].name, snippet: MarkerTable[i].name)
        }
            
    }
    
    
    

}
