//
//  APIRoutable.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 02.05.2024.
//

import Foundation
import Alamofire

protocol APIRoutable: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension APIRoutable {
    
    // MARK: -
    // MARK: Variables
    
    var baseURL: String { return "http://ip-api.com/" }
    
    // MARK: -
    // MARK: Request
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
