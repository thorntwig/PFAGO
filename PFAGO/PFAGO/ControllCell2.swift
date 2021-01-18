//
//  ControllCell2.swift
//  PFAGO
//
//  Created by Robin Törnqvist on 2020-04-07.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class ControllCell2: UICollectionViewCell {
    
    var control: Control? {
        didSet {
            truckLicensePlateNumberLabel.text = "Lastbil: \(control?.truck.licensePlateNumber ?? "Något gick fel")"
            trailerLicensePlateNumberLabel.text = "Släp: \(control?.trailer.licensePlateNumber ?? "Något gick fel")"
            socialSecurityNumberLabel.text = "Chaufför: \(control?.driver.name ?? "Något gick fel")"
            shortageDescriptionLabel.text = "Transpotör: \(control?.carrier.name ?? "Något gick fel")"
            switch control?.valueQuantityExceeded {
            case true:
                shortageLabel.text = "Ålagd med brister"
            default:
                shortageLabel.text = "Kontrollerad utan anmärkning"
            }
        }
    }
    
    lazy var truckLicensePlateNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var trailerLicensePlateNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var socialSecurityNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var shortageDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        return lbl
    }()
    
    lazy var shortageLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .secondarySystemBackground
        
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let bottomRect = CGRect(
            origin: CGPoint(x: rect.origin.x, y: rect.height / 2 + rect.height / 4),
            size: CGSize(width: rect.size.width, height: rect.size.height / 4)
        )
        switch control?.valueQuantityExceeded {
        case true:
            UIColor.systemRed.set()
            UIRectFill(bottomRect)
        default:
            UIColor.systemGreen.set()
            UIRectFill(bottomRect)
        }
    }
    
    func setup() {
        addSubview(truckLicensePlateNumberLabel)
        addSubview(trailerLicensePlateNumberLabel)
        addSubview(socialSecurityNumberLabel)
        addSubview(shortageDescriptionLabel)
        addSubview(shortageLabel)
        
        NSLayoutConstraint.activate([
            truckLicensePlateNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            truckLicensePlateNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            truckLicensePlateNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            trailerLicensePlateNumberLabel.topAnchor.constraint(equalTo: truckLicensePlateNumberLabel.bottomAnchor, constant: 5),
            trailerLicensePlateNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trailerLicensePlateNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            socialSecurityNumberLabel.topAnchor.constraint(equalTo: trailerLicensePlateNumberLabel.bottomAnchor, constant: 5),
            socialSecurityNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            socialSecurityNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            shortageDescriptionLabel.topAnchor.constraint(equalTo: socialSecurityNumberLabel.bottomAnchor, constant: 5),
            shortageDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            shortageDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            shortageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(frame.height / 4) / 4),
            shortageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            shortageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
