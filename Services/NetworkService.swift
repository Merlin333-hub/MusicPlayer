//
//  NetworkService.swift
//  MusicPlayer
//
//  Created by Иван Мельников on 20/04/2021.
//  Copyright © 2021 Иван Мельников. All rights reserved.
//

import UIKit
import Alamofire

//MARK: - API
class NetworkService {
    func fetchTracks(searchText: String, competion: @escaping (SearchResponse?) -> Void)  {
        // Задаем параметры
        let url = "https://itunes.apple.com/search"
        let parameters = ["term":"\(searchText)",
            "limit":"10",
            "media":"music"]
        
        // Делаем вызов
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            //  Если во время выполнение есть ошика – выходим из метода
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                competion(nil)
                return
            }
            
            
            guard let data = dataResponse.data else { return }
            
            // Декодируем полученые данные в нашу модель
             //
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
//                print("objects: ", objects)
                competion(objects)
                
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                competion(nil)
            }
//            let someString = String(data: data, encoding: .utf8)
//            print(someString ?? "")
        }
    }
    
}
