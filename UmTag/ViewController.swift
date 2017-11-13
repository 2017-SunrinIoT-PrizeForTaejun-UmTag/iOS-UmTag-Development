//
//  ViewController.swift
//  UmTag
//
//  Created by 박태준 on 2017. 11. 9..
//  Copyright © 2017년 SeoulAppContest. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUI()
    }

    //UI생성
    func setUI(){
        setUISetting()
        setGoogleMapView()
        setButtonView()
    }
    
    //기본 UI 세팅
    func setUISetting(){
        
        //네비게이션 바 없애는 코드
//        self.navigationController?.setNavigationBarHidden(true, animated: true)

        //배경 색
        view.backgroundColor = UIColor.green
    }
    
    //구글 맵 생성
    func setGoogleMapView(){
        
    }
    
    
    //버튼 생성
    func setButtonView(){
        let currentLocationButton = UIButton(frame: CGRect(x: 10, y: view.frame.height * 0.9, width: view.frame.width * 0.5 - 5, height: view.frame.height * 0.1))
        currentLocationButton.setTitle("CURRENT LOCATION", for: .normal)
        currentLocationButton.addTarget(ViewController(), action: #selector(currentLocationButtonClicked), for: .touchUpInside)
        view.addSubview(currentLocationButton)
        
        let umbrellaLocationButton = UIButton(frame: CGRect(x: 10, y: view.frame.height * 0.9, width: view.frame.width * 0.5 - 5, height: view.frame.height * 0.1))
        umbrellaLocationButton.setTitle("CURRENT LOCATION", for: .normal)
        umbrellaLocationButton.addTarget(ViewController(), action: #selector(umbrellaLocationButtonClicked), for: .touchUpInside)
        view.addSubview(umbrellaLocationButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    class GoogleMapView: UIViewController{
        override func loadView() {
            let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            mapView.isMyLocationEnabled = true
            view = mapView
            
            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
            marker.title = "Sydney"
            marker.snippet = "Australia"
            marker.map = mapView
        }
    }
 
    func getCurrentLocation(){
        
    }
    
    func getUmbrellaLocation(){
        
    }
    
    func currentLocationButtonClicked(){
        
    }
    
    func umbrellaLocationButtonClicked(){
        
    }
}

