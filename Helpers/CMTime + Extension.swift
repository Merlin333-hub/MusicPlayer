//
//  CMTime + Extension.swift
//  MusicPlayer
//
//  Created by Иван Мельников on 20/04/2021.
//  Copyright © 2021 Иван Мельников. All rights reserved.
//

import Foundation
import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return "" }
        let totalSecond = Int(CMTimeGetSeconds(self))
        let seconds = totalSecond % 60
        let minutes = totalSecond / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
    
}
