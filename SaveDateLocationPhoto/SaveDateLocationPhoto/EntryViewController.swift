//
//  ViewController.swift
//  SaveDateLocationPhoto
//
//  Created by Ben Whitley on 6/20/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class EntryViewController: UIViewController {

// MARK: - Outlets

    // MARK: Toolbar

    @IBOutlet var toolbar: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!

    // MARK: View Controller

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!

// MARK: - Properties

    let locationManager = CLLocationManager()
    var currentDate: Date?

// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentDateAndTime()
        textView.inputAccessoryView = toolbar
        textView.becomeFirstResponder()
        locationManager.delegate = self
    }

// MARK: - Actions

    @IBAction func cameraAction(_ sender: UIButton) {
        launchCameraRoll()
    }

    @IBAction func locationAction(_ sender: UIButton) {
        getLocation()
    }

    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        saveEntry()
        textView.resignFirstResponder()
    }

// MARK: - HelperFunctions

    func launchCameraRoll() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        present(imagePicker,
                animated: true,
                completion: nil)
    }

    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }

    func loadCurrentDateAndTime() {
        currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, YYYY 'at' h:mm a"

        guard let date = currentDate else { return }
        dateLabel.text = dateFormatter.string(from: date)
    }

    func saveEntry() {

        if textView.text.characters.count > 0,
           let ad = UIApplication.shared.delegate,
           let appDelegate = ad as? AppDelegate {

            let context = appDelegate.persistentContainer.viewContext
            let name = "Entries"
            let mo = NSEntityDescription.insertNewObject(forEntityName: name,
                                                         into: context)

            if let entries = mo as? Entries {

                if let location = locationLabel.text {
                    entries.location = location
                }

                if let selectedImage = selectedImageView.image,
                    let image = UIImageJPEGRepresentation(selectedImage,
                                                          0.75) {

                    entries.date = currentDate as NSDate?
                    entries.image = image as NSData
                }

                entries.entry = textView.text
                appDelegate.saveContext()
            }
        }
        navigationController?.popToRootViewController(animated: true)
    }
}

