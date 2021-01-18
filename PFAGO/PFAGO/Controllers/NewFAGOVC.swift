//
//  NewFAGOVC.swift
//  PFAGO
//
//  Created by Robin Törnqvist on 2020-04-03.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import CoreLocation
import MapKit

class NewFAGOVC: UIViewController {
    let manager = CLLocationManager()
    var control: Control?
    var data = ["Godsterminal", "Hamnterminal", "Företagsbesök", "System/tema", "Väg"]
    var picker = UIPickerView()
    
    let trailerPicker = UIPickerView()
    let trailerPickerDelegate = TrailerPickerDelegate()
    let countryPicker = UIPickerView()
    let countryPickerDelegate = CountryPickerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
        view.backgroundColor = .systemBackground
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        title = "Ny Kontroll"
        setup()
        picker.delegate = self
        picker.dataSource = self
        
        trailerPickerDelegate.vc = self
        trailerPicker.delegate = trailerPickerDelegate
        trailerPicker.dataSource = trailerPickerDelegate
        trailerTypeTextField.inputView = trailerPicker
        
        countryPickerDelegate.vc = self
        countryPicker.delegate = countryPickerDelegate
        countryPicker.dataSource = countryPickerDelegate
        vehicleNationalityTextField.inputView = countryPicker
        
        controlType.inputView = picker
    }
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var PlaceLabel: UILabel = {
        let placeLabel = UILabel()
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.text = "Plats"
        placeLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return placeLabel
    }()
    
    lazy var textField: SkyFloatingLabelTextField = {
        let textfield = SkyFloatingLabelTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        textfield.placeholder = "Plats/Kommun"
        textfield.title = "Plats/Kommun"
        return textfield
    }()
    
    lazy var controlType: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Kontrollplats"
        tf.title = "Kontrollplats"
        return tf
    }()
    
    lazy var vehicleLabel: UILabel = {
        let placeLabel = UILabel()
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.text = "Fordon och släpvagn"
        placeLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return placeLabel
    }()
    
    lazy var vehicleNationalityTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nationalitet Fordon"
        tf.title = "Nationalitet på fordonet"
        return tf
    }()
    
    lazy var vehicleLicensePlateTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Reg.nummer Fordon"
        tf.title = "Reg.nummer"
        return tf
    }()
    
    lazy var trailerNationalityTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nationalitet Släpvagn"
        tf.title = "Nationalitet Släpvagn"
        return tf
    }()
    
    lazy var trailerTypeTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Typ av släp"
        tf.title = "Typ av släp"
        return tf
    }()
    
    lazy var trailerLicensePlateTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Reg.nummer Släpvagn"
        tf.title = "Reg.nummer Släpvagn"
        return tf
    }()
    
    lazy var carrierLabel: UILabel = {
        let carrierLabel = UILabel()
        carrierLabel.translatesAutoresizingMaskIntoConstraints = false
        
        carrierLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return carrierLabel
    }()
    
    lazy var carrierNameTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Transportör"
        tf.placeholder = "Transportör"
        return tf
        
    }()
    
    lazy var carrierPhoneTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Telefon"
        tf.placeholder = "Telefon"
        return tf
        
    }()

    lazy var carrierAdressTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Utdelningsadress"
        tf.title = "Utdelningsadress"
        return tf
    }()
    
    lazy var carrierZipCodeTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Postnummer"
        tf.title = "Postnummer"
        return tf
    }()
    
    lazy var carrierCityTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Postort"
        tf.title = "Postort"
        return tf
        
    }()
    
    lazy var carrierCountryTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Land"
        tf.title = "Land"
        return tf
        
    }()
    
    lazy var driverLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Förare"
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return lbl
    }()
    
    lazy var driverNameTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Förare"
        tf.title = "Förare"
        return tf
    }()
    
    lazy var driverPhoneTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Telefon"
        tf.title = "Telefon"
        return tf
    }()
    
    lazy var driverAdressTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Utdelningsadress"
        tf.title = "Utdelningsadress"
        return tf
    }()
    
    lazy var driverZipCodeTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Postnummer"
        tf.title = "Postnummer"
        return tf
    }()
    
    lazy var driverCityTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Postort"
        tf.title = "Postort"
        return tf
        
    }()
    
    lazy var driverCountryTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Land"
        tf.title = "Land"
        return tf
    }()
    
    lazy var coDriverLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Annan besättningsmedlem"
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return lbl
    }()
    
    lazy var coDriverNameTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Annan besättningsmedlem"
        tf.title = "Annan besättningsmedlem"
        return tf
    }()
    
    lazy var coDriverPhoneTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Telefon"
        tf.title = "Telefon"
        return tf
    }()
    
    lazy var coDriverAdressTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Utdelningsadress"
        tf.title = "Utdelningsadress"
        return tf
    }()
    
    lazy var coDriverZipCodeTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Postnummer"
        tf.title = "Postnummer"
        return tf
    }()
    
    lazy var coDriverCityTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Postort"
        tf.title = "Postort"
        return tf
        
    }()
    
    lazy var coDriverCountryTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Land"
        tf.title = "Land"
        return tf
    }()
    
    lazy var senderLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Avsändare"
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return lbl
    }()
    
    lazy var senderAdressCodeTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Avsändare utdelninsadress"
        tf.title = "Avsändare utdelninsadress"
        return tf
    }()
    
    lazy var senderLoadPlceTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Lastplats"
        tf.title = "Lastplats"
        return tf
        
    }()
    
    lazy var senderPhoneTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Telefon"
        tf.title = "Telefon"
        return tf
    }()
    
    
    func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(PlaceLabel)
        scrollView.addSubview(textField)
        scrollView.addSubview(controlType)
        scrollView.addSubview(vehicleLabel)
        scrollView.addSubview(vehicleNationalityTextField)
        scrollView.addSubview(vehicleLicensePlateTextField)
        scrollView.addSubview(trailerNationalityTextField)
        scrollView.addSubview(trailerTypeTextField)
        scrollView.addSubview(trailerLicensePlateTextField)
        scrollView.addSubview(carrierLabel)
        scrollView.addSubview(carrierNameTextField)
        scrollView.addSubview(carrierPhoneTextField)
        scrollView.addSubview(carrierAdressTextField)
        scrollView.addSubview(carrierZipCodeTextField)
        scrollView.addSubview(carrierCityTextField)
        scrollView.addSubview(carrierCountryTextField)
        scrollView.addSubview(driverLabel)
        scrollView.addSubview(driverNameTextField)
        scrollView.addSubview(driverPhoneTextField)
        scrollView.addSubview(driverAdressTextField)
        scrollView.addSubview(driverCountryTextField)
        scrollView.addSubview(driverCityTextField)
        scrollView.addSubview(driverZipCodeTextField)
        scrollView.addSubview(coDriverLabel)
        scrollView.addSubview(coDriverNameTextField)
        scrollView.addSubview(coDriverPhoneTextField)
        scrollView.addSubview(coDriverAdressTextField)
        scrollView.addSubview(coDriverCountryTextField)
        scrollView.addSubview(coDriverCityTextField)
        scrollView.addSubview(coDriverZipCodeTextField)
        scrollView.addSubview(senderLabel)
        scrollView.addSubview(senderAdressCodeTextField)
        scrollView.addSubview(senderPhoneTextField)
        scrollView.addSubview(senderLoadPlceTextField)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            PlaceLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            PlaceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            PlaceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: PlaceLabel.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: controlType.leadingAnchor, constant: -10),
            textField.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 15),
        
            controlType.topAnchor.constraint(equalTo: PlaceLabel.bottomAnchor),
            controlType.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            controlType.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 10),
            controlType.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 15),
        ])
        
        NSLayoutConstraint.activate([
            vehicleLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            vehicleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            vehicleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            vehicleNationalityTextField.topAnchor.constraint(equalTo: vehicleLabel.bottomAnchor),
            vehicleNationalityTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            vehicleNationalityTextField.trailingAnchor.constraint(equalTo: vehicleLicensePlateTextField.leadingAnchor, constant: -10),
            vehicleNationalityTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 15),
            
            vehicleLicensePlateTextField.topAnchor.constraint(equalTo: vehicleLabel.bottomAnchor),
            vehicleLicensePlateTextField.leadingAnchor.constraint(equalTo: vehicleNationalityTextField.trailingAnchor, constant: 10),
            vehicleLicensePlateTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            vehicleLicensePlateTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 15),
        ])
        
        NSLayoutConstraint.activate([
            trailerNationalityTextField.topAnchor.constraint(equalTo: vehicleNationalityTextField.bottomAnchor, constant: 10),
            trailerNationalityTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            trailerNationalityTextField.trailingAnchor.constraint(equalTo: trailerTypeTextField.leadingAnchor, constant: -10),
            trailerNationalityTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 3 - 10),
            
            trailerTypeTextField.topAnchor.constraint(equalTo: vehicleNationalityTextField.bottomAnchor, constant: 10),
            trailerTypeTextField.leadingAnchor.constraint(equalTo: trailerNationalityTextField.trailingAnchor, constant: 10),
            trailerTypeTextField.trailingAnchor.constraint(equalTo: trailerLicensePlateTextField.leadingAnchor, constant: -10),
            trailerTypeTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 3 - 10),
            
            trailerLicensePlateTextField.topAnchor.constraint(equalTo: vehicleNationalityTextField.bottomAnchor, constant: 10),
            trailerLicensePlateTextField.leadingAnchor.constraint(equalTo: trailerTypeTextField.trailingAnchor, constant: 10),
            trailerLicensePlateTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            trailerLicensePlateTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 3 - 10),
        ])
        
        NSLayoutConstraint.activate([
            
            carrierLabel.topAnchor.constraint(equalTo: trailerLicensePlateTextField.bottomAnchor, constant: 10),
            carrierLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            carrierLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            carrierNameTextField.topAnchor.constraint(equalTo: carrierLabel.bottomAnchor),
            carrierNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            carrierNameTextField.trailingAnchor.constraint(equalTo: carrierPhoneTextField.leadingAnchor, constant: -10),
            carrierNameTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 5 * 3) - 15),
            
            carrierPhoneTextField.topAnchor.constraint(equalTo: carrierLabel.bottomAnchor),
            carrierPhoneTextField.leadingAnchor.constraint(equalTo: carrierNameTextField.trailingAnchor, constant: 10),
            carrierPhoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            carrierPhoneTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 5 * 2) - 15),
            
            carrierAdressTextField.topAnchor.constraint(equalTo: carrierNameTextField.bottomAnchor, constant: 10),
            carrierAdressTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            carrierAdressTextField.trailingAnchor.constraint(equalTo: carrierZipCodeTextField.leadingAnchor, constant: -10),
            carrierAdressTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 6 * 4) - 15),
            
            carrierZipCodeTextField.topAnchor.constraint(equalTo: carrierPhoneTextField.bottomAnchor, constant: 10),
            carrierZipCodeTextField.leadingAnchor.constraint(equalTo: carrierAdressTextField.trailingAnchor, constant: 10),
            carrierZipCodeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            carrierZipCodeTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 6 * 2) - 15),
            
            carrierCityTextField.topAnchor.constraint(equalTo: carrierZipCodeTextField.bottomAnchor, constant: 10),
            carrierCityTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            carrierCityTextField.trailingAnchor.constraint(equalTo: carrierCountryTextField.leadingAnchor, constant: -10),
            carrierCityTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15),
            
            carrierCountryTextField.topAnchor.constraint(equalTo: carrierZipCodeTextField.bottomAnchor, constant: 10),
            carrierCountryTextField.leadingAnchor.constraint(equalTo: carrierCityTextField.trailingAnchor, constant: 10),
            carrierCountryTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            carrierCountryTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15),
        ])
        
        NSLayoutConstraint.activate([
            driverLabel.topAnchor.constraint(equalTo: carrierCountryTextField.bottomAnchor, constant: 10),
            driverLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            driverLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        
            driverNameTextField.topAnchor.constraint(equalTo: driverLabel.bottomAnchor),
            driverNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            driverNameTextField.trailingAnchor.constraint(equalTo: driverPhoneTextField.leadingAnchor, constant: -10),
            driverNameTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 5 * 3) - 15),
            
            driverPhoneTextField.topAnchor.constraint(equalTo: driverLabel.bottomAnchor),
            driverPhoneTextField.leadingAnchor.constraint(equalTo: driverNameTextField.trailingAnchor, constant: 10),
            driverPhoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            driverPhoneTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 5 * 2) - 15),
            
            driverAdressTextField.topAnchor.constraint(equalTo: driverNameTextField.bottomAnchor, constant: 10),
            driverAdressTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            driverAdressTextField.trailingAnchor.constraint(equalTo: driverZipCodeTextField.leadingAnchor, constant: -10),
            driverAdressTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 6 * 4) - 15),
            
            driverZipCodeTextField.topAnchor.constraint(equalTo: driverPhoneTextField.bottomAnchor, constant: 10),
            driverZipCodeTextField.leadingAnchor.constraint(equalTo: driverAdressTextField.trailingAnchor, constant: 10),
            driverZipCodeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            driverZipCodeTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 6 * 2) - 15),
            
            driverCityTextField.topAnchor.constraint(equalTo: driverZipCodeTextField.bottomAnchor, constant: 10),
            driverCityTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            driverCityTextField.trailingAnchor.constraint(equalTo: driverCountryTextField.leadingAnchor, constant: -10),
            driverCityTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15),
            
            driverCountryTextField.topAnchor.constraint(equalTo: driverZipCodeTextField.bottomAnchor, constant: 10),
            driverCountryTextField.leadingAnchor.constraint(equalTo: driverCityTextField.trailingAnchor, constant: 10),
            driverCountryTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            driverCountryTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15),
            
        ])
        
        NSLayoutConstraint.activate([
            coDriverLabel.topAnchor.constraint(equalTo: driverCountryTextField.bottomAnchor, constant: 10),
            coDriverLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            coDriverLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        
            coDriverNameTextField.topAnchor.constraint(equalTo: coDriverLabel.bottomAnchor),
            coDriverNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            coDriverNameTextField.trailingAnchor.constraint(equalTo: coDriverPhoneTextField.leadingAnchor, constant: -10),
            coDriverNameTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 5 * 3) - 15),
            
            coDriverPhoneTextField.topAnchor.constraint(equalTo: coDriverLabel.bottomAnchor),
            coDriverPhoneTextField.leadingAnchor.constraint(equalTo: coDriverNameTextField.trailingAnchor, constant: 10),
            coDriverPhoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            coDriverPhoneTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 5 * 2) - 15),
            
            coDriverAdressTextField.topAnchor.constraint(equalTo: coDriverNameTextField.bottomAnchor, constant: 10),
            coDriverAdressTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            coDriverAdressTextField.trailingAnchor.constraint(equalTo: coDriverZipCodeTextField.leadingAnchor, constant: -10),
            coDriverAdressTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 6 * 4) - 15),
            
            coDriverZipCodeTextField.topAnchor.constraint(equalTo: coDriverPhoneTextField.bottomAnchor, constant: 10),
            coDriverZipCodeTextField.leadingAnchor.constraint(equalTo: coDriverAdressTextField.trailingAnchor, constant: 10),
            coDriverZipCodeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            coDriverZipCodeTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 6 * 2) - 15),
            
            coDriverCityTextField.topAnchor.constraint(equalTo: coDriverZipCodeTextField.bottomAnchor, constant: 10),
            coDriverCityTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            coDriverCityTextField.trailingAnchor.constraint(equalTo: coDriverCountryTextField.leadingAnchor, constant: -10),
            coDriverCityTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15),
            
            coDriverCountryTextField.topAnchor.constraint(equalTo: coDriverZipCodeTextField.bottomAnchor, constant: 10),
            coDriverCountryTextField.leadingAnchor.constraint(equalTo: coDriverCityTextField.trailingAnchor, constant: 10),
            coDriverCountryTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            coDriverCountryTextField.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15),
        ])
        
        NSLayoutConstraint.activate([
            senderLabel.topAnchor.constraint(equalTo: coDriverCountryTextField.bottomAnchor, constant: 10),
            senderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            senderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),

            senderAdressCodeTextField.topAnchor.constraint(equalTo: senderLabel.bottomAnchor, constant: 10),
            senderAdressCodeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            senderAdressCodeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            senderLoadPlceTextField.topAnchor.constraint(equalTo: senderAdressCodeTextField.bottomAnchor, constant: 10),
            senderLoadPlceTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            senderLoadPlceTextField.trailingAnchor.constraint(equalTo: senderPhoneTextField.leadingAnchor, constant: -10),
            senderLoadPlceTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 15),

            senderPhoneTextField.topAnchor.constraint(equalTo: senderAdressCodeTextField.bottomAnchor, constant: 10),
            senderPhoneTextField.leadingAnchor.constraint(equalTo: senderLoadPlceTextField.trailingAnchor, constant: 10),
            senderPhoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            senderPhoneTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 10),
            senderPhoneTextField.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15),
        ])
        
    }
}
extension NewFAGOVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        controlType.text = data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
}
extension NewFAGOVC: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
                guard let placemarks = placemark else { return }
                guard let city = placemarks[0].locality else { return }
                self.textField.text = city
                self.textField.isEnabled = false
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
class TrailerPickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let types = ["","Släp", "Påhängsvagn", "Container"]
    weak var vc: NewFAGOVC?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        vc?.trailerTypeTextField.text = types[row]
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
}
class CountryPickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    weak var vc: NewFAGOVC?
    
    let countryCodes = ["Monaco" : "MC", "Mongoliet" : "MN", "Montenegro" : "ME", "Montserrat" : "MS", "Myanmar" : "MM", "Namibia" : "NA",  "Nauru" : "NR", "Nederländerna" : "NL", "Antillerna" : "AN",  "Nepal" : "NP", "Nicaragua" : "NI", "Niger" : "NE", "Nigeria" : "NG", "Niue" : "NU", "Nordkorea" : "KP",  "Nordmarianerna" : "MP"]
    let countryCodesOften = ["Sverige": "S", "Danmark" : "DK", "Finland" : "F", "Norge" : "N"]
    
    var countryArrayOften = [String]()
    var countryArray = [String]()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return countryCodesOften.count

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        vc?.vehicleNationalityTextField.text = countryCodesOften[countryArrayOften[row]]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            countryArrayOften = Array(countryCodesOften.keys).sorted()
            return countryArrayOften[row]
    }
}
