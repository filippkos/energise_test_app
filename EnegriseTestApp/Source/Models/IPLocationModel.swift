//
//  IPLocationModel.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 26.04.2024.
//

import Foundation
import Alamofire

// MARK: - IPLocationModel

struct IPLocationModel: Codable {
    let status, country, countryCode, region: String
    let regionName, city, zip: String
    let lat, lon: Double
    let timezone, isp, org, ipLocationModelAs: String
    let query: String

    enum CodingKeys: String, CodingKey {
        case status, country, countryCode, region, regionName, city, zip, lat, lon, timezone, isp, org
        case ipLocationModelAs = "as"
        case query
    }
    
    typealias Loc = L10n.LocalizationSearch.LocationModel
    
    var tableModel: [(String, String)] {
        return [
            (Loc.status , self.status),
            (Loc.country , self.country),
            (Loc.countryCode , self.countryCode),
            (Loc.region , self.region),
            (Loc.regionName , self.regionName),
            (Loc.city , self.city),
            (Loc.zip , self.zip),
            (Loc.latitude , String(self.lat)),
            (Loc.longitude , String(self.lon)),
            (Loc.timezone , self.timezone),
            (Loc.isp , self.isp),
            (Loc.organizationName , self.org),
            (Loc.asNumber , self.ipLocationModelAs),
            (Loc.query , self.query),
        ]
    }
}

