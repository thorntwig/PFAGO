//
//  oldFagoControlVC.swift
//  PFAGO
//
//  Created by Robin Törnqvist on 2020-04-08.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class OldFagoControlVC: UIViewController {

    var control: Control? {
        didSet {
            placeLabel.text = control?.location
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var placeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.control = Control(id: 1, controlStartDate: Date(), controlEndDate: Date(), location: "Vänersborgs Kommun", locationType: .Road, carrier: Transporter(name: "GLÅAB", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "Sweden"), driver: Transporter(name: "Robin Törnqvist", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "sweden"), passenger: Transporter(name: "Ida Johansson", phoneNumber: "0722227748", adress: "Sandelheilmsgatan 22", ZipNumber: 46235, city: "Vänersborg", nationality: "Sweden"), truck: Vehicle(licensePlateNumber: "ABC123", nationality: "Sweden", vehicleType: .Truck), trailer: Vehicle(licensePlateNumber: "CBA321", nationality: "Sweden", vehicleType: .SemiTrailer), sender: nil, reciver: nil, quantity: Quantity(quantity: 200, quantityType: .LQ, packagingStandard: .Liter), valueQuantityExceeded: true, valueQuantity: 123, transportType: .Bulk, transportStandard: .ADRS, writenInstrucktions: ControlRow(controlled: true, breakingTheLaw: false, notApplicable: false, riskCategory: "AB1203", imposed: false, banned: true, notes: "Jag heter janne, detta var fel"))
        
        view.backgroundColor = .blue
        setupView()
    }
    
    func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(placeLabel)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            placeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            placeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
}
