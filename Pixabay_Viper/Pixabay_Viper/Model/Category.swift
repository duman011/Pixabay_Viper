//
//  Category.swift
//  Pixabay_Viper
//
//  Created by Erislam Nurluyol on 4.12.2023.
//

import UIKit

enum Category: String, CaseIterable {
    case all = "All"
    case backgrounds = "Backgrounds"
    case fashion = "Fashion"
    case nature = "Nature"
    case science = "Science"
    case education = "Education"
    case feelings = "Feelings"
    case health = "Health"
    case people = "People"
    case religion = "Religion"
    case places = "Places"
    case animals = "Animals"
    case industry = "Industry"
    case computer = "Computer"
    case food = "Food"
    case sports = "Sports"
    case transportation = "Transportation"
    case travel = "Travel"
    case buildings = "Buildings"
    case business = "Business"
    case music = "Music"
    
    var title: String { self.rawValue }
    
    var icon: UIImage? {
        switch self {
        case.all:
            UIImage(systemName: "line.3.horizontal.decrease.circle")
        case .backgrounds:
            UIImage(systemName: "photo.artframe")
        case .fashion:
            UIImage(systemName: "hanger")
        case .nature:
            UIImage(systemName: "mountain.2")
        case .science:
            UIImage(systemName: "testtube.2")
        case .education:
            UIImage(systemName: "book")
        case .feelings:
            UIImage(systemName: "heart")
        case .health:
            UIImage(systemName: "cross.circle")
        case .people:
            UIImage(systemName: "person.2")
        case .religion:
            UIImage(systemName: "character.book.closed.ar")
        case .places:
            UIImage(systemName: "pin")
        case .animals:
            UIImage(systemName: "pawprint")
        case .industry:
            UIImage(systemName: "gear")
        case .computer:
            UIImage(systemName: "desktopcomputer")
        case .food:
            UIImage(systemName: "fork.knife")
        case .sports:
            UIImage(systemName: "tennis.racket")
        case .transportation:
            UIImage(systemName: "bus")
        case .travel:
            UIImage(systemName: "airplane")
        case .buildings:
            UIImage(systemName: "building.2")
        case .business:
            UIImage(systemName: "dollarsign")
        case .music:
            UIImage(systemName: "music.note")
        }
    }
}
