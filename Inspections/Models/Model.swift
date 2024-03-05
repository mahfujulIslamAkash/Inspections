//
//  Model.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 27/2/24.
//

import Foundation
import UIKit

//MARK: This is the main Inspection Model
struct Inspaction: Codable{
    let title: String
    let subTitle: String
    let items: [InspactionItem]
    let createdDate: String
    init(title: String, subTitle: String, items: [InspactionItem], createdDate: String = "18, Dec") {
        self.title = title
        self.subTitle = subTitle
        self.items = items
        self.createdDate = createdDate
    }
}

//MARK: This is the main Inspection's list data
struct InspactionItem: Codable{
    let title: String
    var subItems: [SubItem]
    
}

struct SubItem: Codable{
    let title: String
    var tag: Int
}

class CustomGesture: UITapGestureRecognizer{
    lazy var section: Int = 0
}
