//
//  APIClient.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 29/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation


final class SessionAPI {
    
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    func send<T: APIRequest>(request: T, completion: @escaping(Result<T.Response, ApiErrorResponse>) -> ()) {
        let request = request.requestWithBaseUrl()
        print("La url destino es \(request.debugDescription)")
        let task = session.dataTask(with: request) { data, response, error in
            do {
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print(json)
                    if let _ = json?["errors"] {
                        let apiError = try JSONDecoder().decode(ApiErrorResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(.failure(apiError))
                        }
                    }
                    let model = try JSONDecoder().decode(T.Response.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(model))
                    }
                }
            } catch let error {
                DispatchQueue.main.async {
                    let apiError = ApiErrorResponse(errors: [error.localizedDescription], action: "An error ocurred, try again later!")
                    completion(.failure(apiError))
                }
            }
        }
        task.resume()
    }
}
