//
//  ApiService.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 16/03/22.
//

import Foundation


final class ApiService{
    
    static let shared = ApiService()
    public var icons: [Icon] = []
    private var whenReadyBlock: ((Result<[CriptoData], Error>) -> Void)?
    
    private struct Constants{
      static let APIKey = "F33E4632-78C0-4769-8442-3570DB3DAE5A"
      static let assetsEndPoint = "https://rest.coinapi.io/v1/assets/"
      static let searchUrlString = "https://rest.coinapi.io/v1/assets/?apikey=F33E4632-78C0-4769-8442-3570DB3DAE5A"

    }
    
    private init() {}
    
    
    func getCriptoCoins(completion: @escaping (Result<[CriptoData], Error>)-> Void){
        guard !icons.isEmpty else {whenReadyBlock = completion
            return}
       
        guard let url = URL(string: Constants.assetsEndPoint + "?apikey=" + Constants.APIKey) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            do {
                            // Parse the data
                let decoder = try JSONDecoder().decode([CriptoData].self, from: data)
                completion(.success(decoder))
            } catch{
                completion(.failure(error))
              }
            
         }
      dataTask.resume()
   }
    
    public func getAllIcons(){

      guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/55/?apikey=F33E4632-78C0-4769-8442-3570DB3DAE5A") else { return }

      let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in

        guard let data = data, error == nil else { return }

        do{

          self?.icons = try JSONDecoder().decode([Icon].self, from: data)

          if let completion = self?.whenReadyBlock{

            self?.getCriptoCoins(completion: completion)
          }

        } catch {
          print(error)
        }
      }
      task.resume()

    }
    
    
    
}
