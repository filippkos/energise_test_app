//
//  LocationURLRequest.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 02.05.2024.
//

import Foundation
import Alamofire

struct LocationURLRequest: APIRoutable {
    var path: String = "json/"
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var encoding: ParameterEncoding = JSONEncoding.default
}
