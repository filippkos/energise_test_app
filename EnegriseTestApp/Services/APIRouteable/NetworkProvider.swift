//
//  NetworkProvider.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 02.05.2024.
//

import Foundation
import Alamofire

class NetworkProvider {
    
    func perform<T: Decodable>(
        _ apiRoute: APIRoutable,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let dataRequest = AF.request(apiRoute)
        dataRequest
            .validate(statusCode: 200..<300)
            .responseDecodable(completionHandler: { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
        })
    }
}
