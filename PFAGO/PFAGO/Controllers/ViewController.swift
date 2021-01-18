//
//  ViewController.swift
//  PFAGO
//
//  Created by Robin Törnqvist on 2020-04-03.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var controlls = [Control(id: 1, controlStartDate: Date(), controlEndDate: Date(), location: "Vänersborgs Kommun", locationType: .Road, carrier: Transporter(name: "GLÅAB", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "Sweden"), driver: Transporter(name: "Robin Törnqvist", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "sweden"), passenger: Transporter(name: "Ida Johansson", phoneNumber: "0722227748", adress: "Sandelheilmsgatan 22", ZipNumber: 46235, city: "Vänersborg", nationality: "Sweden"), truck: Vehicle(licensePlateNumber: "ABC123", nationality: "Sweden", vehicleType: .Truck), trailer: Vehicle(licensePlateNumber: "CBA321", nationality: "Sweden", vehicleType: .SemiTrailer), sender: nil, reciver: nil, quantity: Quantity(quantity: 200, quantityType: .LQ, packagingStandard: .Liter), valueQuantityExceeded: true, valueQuantity: 123, transportType: .Bulk, transportStandard: .ADRS, writenInstrucktions: ControlRow(controlled: true, breakingTheLaw: false, notApplicable: false, riskCategory: "AB1203", imposed: false, banned: true, notes: "Jag heter janne, detta var fel")), Control(id: 1, controlStartDate: Date(), controlEndDate: Date(), location: "Vänersborgs Kommun", locationType: .Road, carrier: Transporter(name: "GLÅAB", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "Sweden"), driver: Transporter(name: "Robin Törnqvist", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "sweden"), passenger: Transporter(name: "Ida Johansson", phoneNumber: "0722227748", adress: "Sandelheilmsgatan 22", ZipNumber: 46235, city: "Vänersborg", nationality: "Sweden"), truck: Vehicle(licensePlateNumber: "ABC123", nationality: "Sweden", vehicleType: .Truck), trailer: Vehicle(licensePlateNumber: "CBA321", nationality: "Sweden", vehicleType: .SemiTrailer), sender: nil, reciver: nil, quantity: Quantity(quantity: 200, quantityType: .LQ, packagingStandard: .Liter), valueQuantityExceeded: true, valueQuantity: 123, transportType: .Bulk, transportStandard: .ADRS, writenInstrucktions: ControlRow(controlled: true, breakingTheLaw: false, notApplicable: false, riskCategory: "AB1203", imposed: false, banned: true, notes: "Jag heter janne, detta var fel")),Control(id: 1, controlStartDate: Date(), controlEndDate: Date(), location: "Vänersborgs Kommun", locationType: .Road, carrier: Transporter(name: "GLÅAB", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "Sweden"), driver: Transporter(name: "Robin Törnqvist", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "sweden"), passenger: Transporter(name: "Ida Johansson", phoneNumber: "0722227748", adress: "Sandelheilmsgatan 22", ZipNumber: 46235, city: "Vänersborg", nationality: "Sweden"), truck: Vehicle(licensePlateNumber: "ABC123", nationality: "Sweden", vehicleType: .Truck), trailer: Vehicle(licensePlateNumber: "CBA321", nationality: "Sweden", vehicleType: .SemiTrailer), sender: nil, reciver: nil, quantity: Quantity(quantity: 200, quantityType: .LQ, packagingStandard: .Liter), valueQuantityExceeded: true, valueQuantity: 123, transportType: .Bulk, transportStandard: .ADRS, writenInstrucktions: ControlRow(controlled: true, breakingTheLaw: false, notApplicable: false, riskCategory: "AB1203", imposed: false, banned: true, notes: "Jag heter janne, detta var fel")),Control(id: 1, controlStartDate: Date(), controlEndDate: Date(), location: "Vänersborgs Kommun", locationType: .Road, carrier: Transporter(name: "GLÅAB", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "Sweden"), driver: Transporter(name: "Robin Törnqvist", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "sweden"), passenger: Transporter(name: "Ida Johansson", phoneNumber: "0722227748", adress: "Sandelheilmsgatan 22", ZipNumber: 46235, city: "Vänersborg", nationality: "Sweden"), truck: Vehicle(licensePlateNumber: "ABC123", nationality: "Sweden", vehicleType: .Truck), trailer: Vehicle(licensePlateNumber: "CBA321", nationality: "Sweden", vehicleType: .SemiTrailer), sender: nil, reciver: nil, quantity: Quantity(quantity: 200, quantityType: .LQ, packagingStandard: .Liter), valueQuantityExceeded: true, valueQuantity: 123, transportType: .Bulk, transportStandard: .ADRS, writenInstrucktions: ControlRow(controlled: true, breakingTheLaw: false, notApplicable: false, riskCategory: "AB1203", imposed: false, banned: true, notes: "Jag heter janne, detta var fel")),Control(id: 1, controlStartDate: Date(), controlEndDate: Date(), location: "Vänersborgs Kommun", locationType: .Road, carrier: Transporter(name: "GLÅAB", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "Sweden"), driver: Transporter(name: "Robin Törnqvist", phoneNumber: "0702050925", adress: "Marierovägen 16a", ZipNumber: 46237, city: "Vänersborg", nationality: "sweden"), passenger: Transporter(name: "Ida Johansson", phoneNumber: "0722227748", adress: "Sandelheilmsgatan 22", ZipNumber: 46235, city: "Vänersborg", nationality: "Sweden"), truck: Vehicle(licensePlateNumber: "ABC123", nationality: "Sweden", vehicleType: .Truck), trailer: Vehicle(licensePlateNumber: "CBA321", nationality: "Sweden", vehicleType: .SemiTrailer), sender: nil, reciver: nil, quantity: Quantity(quantity: 200, quantityType: .LQ, packagingStandard: .Liter), valueQuantityExceeded: true, valueQuantity: 123, transportType: .Bulk, transportStandard: .ADRS, writenInstrucktions: ControlRow(controlled: true, breakingTheLaw: false, notApplicable: false, riskCategory: "AB1203", imposed: false, banned: true, notes: "Jag heter janne, detta var fel")),]
        
    var displayControls = [Control]()
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Ny Kontroll", style: .plain, target: self, action: #selector(newFAGOControll))
        title = "PFAGO"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "ABC123 / 19920402-3411"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        collectinoView.register(ControllCell2.self, forCellWithReuseIdentifier: "cell")

        collectinoView.dataSource = self
        collectinoView.delegate = self
        //searchBar.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        collectinoView.keyboardDismissMode = .onDrag
        
    }
    
    lazy var collectinoView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .systemBackground
        
        return cv
    }()
    
//    lazy var searchBar: UISearchBar = {
//        let srcBar = UISearchBar()
//        srcBar.translatesAutoresizingMaskIntoConstraints = false
//        srcBar.placeholder = "ABC123 / 19920402-3411"
//        srcBar.autocapitalizationType = .allCharacters
//        srcBar.autocorrectionType = .no
//        return srcBar
//    }()

    func setup() {
        
        view.addSubview(collectinoView)
//        view.addSubview(searchBar)

        
        NSLayoutConstraint.activate([
//            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            searchBar.heightAnchor.constraint(equalToConstant: 50),
//            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            collectinoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectinoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectinoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectinoView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    func searchFAGOControls(_ searchText: String) {
        self.displayControls = self.controlls.filter { $0.truck.licensePlateNumber == searchText }
        self.collectinoView.reloadData()
    }
    
    @objc func newFAGOControll() {
        navigationController?.pushViewController(NewFAGOVC(), animated: true)
    }
}

// MARK: UISeatchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.searchTextField.text else { return }
        let alert = UIAlertController(title: "\(search)", message: "Är detta korrekt?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "JA", style: .default, handler: { UIAlertAction in
            print("searching...")
            searchBar.resignFirstResponder()
            self.displayControls = self.controlls.filter { $0.truck.licensePlateNumber == search }
            DispatchQueue.main.async {
                self.collectinoView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "NEJ", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayControls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ControllCell2
        cell.control = displayControls[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(OldFagoControlVC(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 10, height: view.frame.width / 2)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        searchFAGOControls(searchBar.text!)
    }
}
