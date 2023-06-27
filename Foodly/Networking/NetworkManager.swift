//
//  NetworkManager.swift
//  Foodly
//
//  Created by Orçun Erdil on 26.06.2023.
//

import Foundation

struct NetworkManager {
    
   static let shared = NetworkManager()
    private init() {}
   
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
                request(route: .fethAllCategories, method: .get, completion: completion)
            }
    
    //Kısaca T, kodlanabilen veya decode edilebilen herhangi bir şey olabilir.
    private func request<T:Codable>(route : Route,
                                    method: Method,
                                    parameters: [String:Any]? = nil,
                                    completion: @escaping (Result<T,Error>) -> Void)  {
        //Backend'e bir istekde bulunacağız
        guard let request = CreateRequest(route: route, method: method,parameters: parameters) else {
            completion(.failure(Errors.unknownError))
            return
        }
        // MARK: Create a Session
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            
            var result : Result<Data,Error>?
            if let safeData = data {
                result = .success(safeData)
                let responseString = String(data: safeData, encoding: .utf8) ?? "Error"
                
            }
            else if let error = error {
                result = .failure(error)
            }
            
            DispatchQueue.main.async {
                handleResponse(result: result, completion: completion)
                            
            }
            
        }.resume()
    }
    
    private func handleResponse<T:Codable>(result: Result<Data,Error>?,
                           completion: (Result<T,Error>) -> Void){
        guard let result = result else {
            completion(.failure(Errors.unknownError))
            return
        }
        switch result {
            
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(Response<T>.self, from: data) else {
                completion(.failure(Errors.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(Errors.serverError(error)))
                return
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(Errors.errorDecoding))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    //Generate URL Request
    
    private func CreateRequest(route: Route, method: Method, parameters: [String:Any]? = nil) -> URLRequest? {
        
        // MARK: CREATE URL
        let urlString = Route.baseURL + route.description
            //Örnek url şu şekilde olacak -> https://yummie.glitch.me/temp
        guard let url = urlString.asURL else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
