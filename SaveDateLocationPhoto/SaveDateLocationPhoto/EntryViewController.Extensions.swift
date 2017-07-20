//
//  ViewController.Extensions.swift
//  SaveDateLocationPhoto
//
//  Created by Ben Whitley on 6/20/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit
import CoreLocation

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension EntryViewController: UIImagePickerControllerDelegate,
                               UINavigationControllerDelegate {

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : Any]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImageView.image = image
        }

        dismiss(animated: true,
                completion: nil)

        textView.becomeFirstResponder()
    }
}

// MARK: - CLLocationManagerDelegate

extension EntryViewController: CLLocationManagerDelegate {

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
               let countryCode = locationData.isoCountryCode {

                let text = "\(city), \(state) \(zipCode), \(countryCode)"
                self.locationLabel.text = text
            }
        }
    }
}
