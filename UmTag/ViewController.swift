//
//  ViewController.swift
//  UmTag
//
//  Created by 박태준 on 2017. 11. 9..
//  Copyright © 2017년 SeoulAppContest. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    var mapView: GMSMapView!
    var marker = GMSMarker?
    var locationManager:CLLocationManager!
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.accessibilityElementsHidden = false
        mapView.isMyLocationEnabled = true
        view = mapView
        
        mapView.delegate = self
        
        //블루투스 통신해야함
//        let position = CLLocationCoordinate2D(latitude: coor.latitude, longitude: coor.longitude)
//        marker = GMSMarker(position: position)
//        marker.title = "HERE"
//        marker.snippet = "Status : " + text
//        marker.map = mapView
        
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUI()
    }

    //UI생성
    func setUI(){
        setUISetting()
        setButtonView()
        GPSSetting()
    }
    
    //기본 UI 세팅
    func setUISetting(){
        
        //배경 색
        view.backgroundColor = UIColor.green
    }
    
    //GPS 권한 요청
    func GPSSetting(){
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }
    }

    
    //버튼 생성
    func setButtonView(){
        let unLockButton = UIButton(frame: CGRect(x: 10, y: view.frame.height * 0.9, width: view.frame.width * 0.5 - 5, height: view.frame.height * 0.1))
        unLockButton.setTitle("UNLOCK", for: .normal)
        unLockButton.addTarget(ViewController(), action: #selector(unLockButtonClicked), for: .touchUpInside)
        view.addSubview(unLockButton)
        
        let umbrellaLocationButton = UIButton(frame: CGRect(x: 10, y: view.frame.height * 0.9, width: view.frame.width * 0.5 - 5, height: view.frame.height * 0.1))
        umbrellaLocationButton.setTitle("CURRENT LOCATION", for: .normal)
        umbrellaLocationButton.addTarget(ViewController(), action: #selector(umbrellaLocationButtonClicked), for: .touchUpInside)
        view.addSubview(umbrellaLocationButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coor = manager.location?.coordinate{
            print("latitude" + String(coor.latitude) + "/ longitude" + String(coor.longitude))
        }
    }

    func getCurrentLocation(){
        
    }
    
    func getUmbrellaLocation(){
        
    }
    
    func unLockButtonClicked(){
        //블루투스로 무언가 받고
        var isLock: Bool = false
        if(isLock){
            isLock = false
        }else{
            isLock = true
        }
    }
    
    func umbrellaLocationButtonClicked(){
        //블루투스로 무언가 받고
        var isLock: Bool = false
        var text:String
        if(isLock){
            text = "Locked"
        }else{
            text = "UnLocked"
        }
        //블루투스통신해야함
//        let position = CLLocationCoordinate2D(latitude: coor.latitude, longitude: coor.longitude)
//        marker = GMSMarker(position: position)
//        marker.title = "HERE"
//        marker.snippet = "Status : " + text
//        marker.map = mapView
    }
}

