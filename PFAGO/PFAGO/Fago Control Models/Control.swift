//
//  Controll.swift
//  PFAGO
//
//  Created by Robin Törnqvist on 2020-04-06.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import Foundation

struct Control {
    
    enum LocationType {
        case CargoTerminal
        case CompanyVisit
        case Road
        case PortTerminal
        case System
    }
    
    enum TransportType {
        case Tank
        case Bulk
        case MixedCargo
        case Other
    }
    
    enum TransportStandard {
        case ADR
        case ADRS
        case IMDG
        case ICAOTIATADGR
        case RID
        case RIDS
        case MoU
        case Other
    }
    
    let id: Int
    let controlStartDate: Date
    let controlEndDate: Date
    let location: String
    let locationType: LocationType
    
    let carrier: Transporter
    let driver: Transporter
    let passenger: Transporter
    
    let truck: Vehicle
    let trailer: Vehicle
    
    let sender: TransportLocation?
    let reciver: TransportLocation?
    
    let quantity: Quantity
    let valueQuantityExceeded: Bool
    let valueQuantity: Int
    
    let transportType: TransportType
    let transportStandard: TransportStandard
    
    let writenInstrucktions: ControlRow
}

struct Transporter {
    
    let name: String
    let phoneNumber: String
    let adress: String
    let ZipNumber: Int
    let city: String
    let nationality: String
}

struct Vehicle {
    
    let licensePlateNumber: String
    let nationality: String
    let vehicleType: VehicleType
    
    enum VehicleType {
        case Truck
        case Trailer
        case SemiTrailer
        case Container
    }
}

struct TransportLocation {
    let adress: String
    let place: String
    let phone: String
}

struct Quantity {
    
    let quantity: Int
    let quantityType: QuantityType
    let packagingStandard: PackagingStandard
    
    enum QuantityType {
        case EQ
        case LQ
        case EmptyNotCleaned
    }
    
    enum PackagingStandard {
        case Kg
        case Liter
    }
}

struct ControlRow {
    let controlled: Bool
    let breakingTheLaw: Bool
    let notApplicable: Bool
    let riskCategory: String
    let imposed: Bool
    let banned: Bool
    let notes: String
}
