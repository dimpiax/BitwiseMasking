//
//  MainModel.swift
//  BitwiseMasking
//
//  Created by Pilipenko Dima on 11/2/15.
//  Copyright © 2015 dimpiax. All rights reserved.
//

import Foundation

class Model {
    let music = [Music(id: 5120, genre: .EDM), Music(id: 2721, genre: .Rock), Music(id: 40614, genre: .Pop), Music(id: 12121, genre: .EDM), Music(id: 8017, genre: .Rap), Music(id: 11, genre: .EDM)]
    var filteredMusic: [Music]?
    
    var selectedValue = 0 {
        didSet {
            let filteredData = music.filter { value in
                1 << value.genre.rawValue & selectedValue != 0
            }
            filteredMusic = filteredData.isEmpty ? nil : filteredData
        }
    }
    
    func defineSelectedGenres(value: Genre, selected: Bool) {
        // represent id in binary format
        let bValue = 1 << value.rawValue
        let signedValue = selected ? bValue : ~bValue
        
        // sum value
        selectedValue &|= signedValue
    }
}

struct Music: CustomStringConvertible {
    let id: UInt16
    let genre: Genre
    
    var description: String {
        return "\(genre.name)-Music(\(id))"
    }
}

func ==(lhs: Music, rhs: Music) -> Bool {
    return lhs.id == rhs.id
}


enum Genre: Int {
    static let allValues = [Rap, Rock, Pop, EDM]
    
    case Rap, Rock, Pop, EDM
    
    var name: String {
        switch self {
            case Rap: return "Rap"
            case Rock: return "Rock"
            case Pop: return "Pop"
            case EDM: return "EDM"
        }
    }
}