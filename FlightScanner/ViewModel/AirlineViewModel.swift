//
//  AirlineViewModel.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 26/10/2021.
//

import SwiftUI

class AirlineViewModel: ObservableObject {
    @Published var airlines: [AirlinesModel] = []

    
    let api = "http://api.aviationstack.com/v1/"
    static let data = ["flights", "airports", "airlines", "airplanes", "cities", "countries"]
    let apiKey = "?access_key=0957cf60c4353017f4e3eaf00b9f77cc"
    
    var allflightData: URLComponents {
        get {
            URLComponents(string: api + FlightScannerViewModel.data[2] + apiKey)!
        }
    }
    
    init() {
        fetchFlightData { (result) in
            switch result {
            case .success(let airlines):
                DispatchQueue.main.async {
                    self.airlines.append(airlines)
                  }
                
            case .failure(let error):
                print("Fetched FlightData with Error: \(error)")
            }
            
        }
    }
    
    func chooseData() -> String {
        var name = ""
        for i in FlightScannerViewModel.data {
            name = i
        }
        return name
    }
    
    func fetchFlightData(completion: @escaping (Result<AirlinesModel , Error>) -> Void) {
    let urlComponents = allflightData

    let task = URLSession.shared.dataTask(with: urlComponents.url!) {
        (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                let flightData = try jsonDecoder.decode(AirlinesModel.self, from: data)
                completion(.success(flightData))
            } catch {
                completion(.failure(error))
            }
        }
           
        
    }
    task.resume()
    }
}
