//
//  Representitive Controller.swift
//  Representitive
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    // Goal URL: http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json
    static let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        guard let unwrappedURL = baseURL else { fatalError("URL optional is nil")}
        var components = URLComponents(url: unwrappedURL, resolvingAgainstBaseURL: true)
        let stateQuery = URLQueryItem(name: "state", value: "\(state)")
        let jsonQuery = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [stateQuery,jsonQuery]
        guard let finalURL = components?.url else { return }
        print(finalURL)
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error decoding the Data: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            guard let asciiString = String(data: data, encoding: .ascii),
                let newData = asciiString.data(using: .utf8)
                else { completion([]); return }
            do {
                let resultsDictionary = try JSONDecoder().decode([String: [Representative]].self, from: newData)
                let reps = resultsDictionary["results"]
                completion(reps ?? [])
            } catch {
                print("Error decoding the data into our Team Object: \(error.localizedDescription)")
                completion([])
                return
            }
        }
        dataTask.resume()
    }
}
