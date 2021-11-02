//
//  FlightScannerViewModel.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 07/10/2021.
//

import SwiftUI
import Combine


class FlightScannerViewModel: ObservableObject {
    @Published var flights: [FlightData] = []
    @Published var allData = data
    
    let api = "http://api.aviationstack.com/v1/"
    static let data = ["flights", "airports", "airlines", "airplanes", "cities", "countries"]
    let apiKey = "?access_key=0957cf60c4353017f4e3eaf00b9f77cc"
    
    var allflightData: URLComponents {
        get {
            URLComponents(string: api + FlightScannerViewModel.data[0] + apiKey)!
        }
    }
    
    init() {
        fetchFlightData { (result) in
            switch result {
            case .success(let flightData):
                DispatchQueue.main.async {
                    self.flights.append(flightData)
                  }
                
            case .failure(let error):
                print("Fetched FlightData with Error: \(error)")
            }
        }
    }
    
    func fetchFlightData(completion: @escaping (Result<FlightData , Error>) -> Void) {
    let urlComponents = allflightData

    let task = URLSession.shared.dataTask(with: urlComponents.url!) {
        (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                let flightData = try jsonDecoder.decode(FlightData.self, from: data)
                completion(.success(flightData))
            } catch {
                completion(.failure(error))
            }
        }
           
        
    }
    task.resume()
    }
    
    
}
