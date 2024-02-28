//
//  Model.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 27/2/24.
//

import Foundation

//MARK: This is the main Inspection Model
struct Inspaction: Codable{
    let title: String
    let subTitle: String
    let items: [InspactionItem]
}

//MARK: This is the main Inspection's list data
struct InspactionItem: Codable{
    let title: String
    let subItems: [InspactionSubItem]
    
}

//MARK: This is the main InspactionItem's subItem listdata
struct InspactionSubItem: Codable{
    let items: [String]
}
