//
//  ViewController.swift
//  SetLocation
//
//  Created by Ben Whitley on 6/20/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var locationLabel: UILabel!

    // MARK: - Properties

    let locationManager = CLLocationManager()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }

    // MARK: - Actions

    @IBAction func setLocationAction(_ sender: UIButton) {
        getLocation()
    }

    // MARK: - Helper Functions
    
    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {

        locationManager.stopUpdatingLocation()

        let geoCoder = CLGeocoder()
        guard let managerLocation = manager.location else { return }

        geoCoder.reverseGeocodeLocation(managerLocation) {
            (placemarks, error) in

            if let placemarksData = placemarks,
               let locationData = placemarksData.first,
               let city = locationData.locality,
               let state = locationData.administrativeArea,
               let zipCode = locationData.postalCode,
               let country = locationData.country {

                self.locationLabel.text = "\(city), \(state) \(zipCode), \(country)"
            }
        }
    }
}
