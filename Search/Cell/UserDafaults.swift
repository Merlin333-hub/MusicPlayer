//
//  UserDafaults.swift
//  MusicPlayer
//
//  Created by Иван Мельников on 20/04/2021.
//  Copyright © 2021 Иван Мельников. All rights reserved.
//
import Foundation


extension UserDefaults {
    
    static let favouriteTrackKey = "favouriteTrackKey"
    
    func savedTracks() -> [SearchViewModel.Cell] {
        let defaults = UserDefaults.standard
        
        guard let savedTracks = defaults.object(forKey: UserDefaults.favouriteTrackKey) as? Data else { return [] }
        guard let decodedTracks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedTracks) as? [SearchViewModel.Cell] else { return [] }
        return decodedTracks
    }
    
}
