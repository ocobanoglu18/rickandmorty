//
//  Extension.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.11.2022.
//

import Foundation
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    func getEpisodeNumber() -> String {
        let start = self.index(self.startIndex, offsetBy: 40)
        let end = self.index(self.startIndex, offsetBy: self.count-1)
        let range = start...end

        return String(self[range])
    }
}

extension Int {
    func toString() -> String {
        return "\(self)"
    }
}
