//
//  Datas.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 27/2/24.
//

import Foundation

//MARK: All inspection list
let inspectionsData: [Inspaction] = [
    Inspaction(title: "Weekly Inspection", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Above-Property Assesment", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Audit Shit checklist", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Do Not Disturb", subTitle: "Holiday Inn Express Franklin", items: inspectionItem),
    Inspaction(title: "Annual Inspection Annual Inspection Annual Inspection", subTitle: "Holiday Inn Express Franklin Holiday Inn Express Franklin", items: inspectionItem),
    
]

//dummy items for inspection
let inspectionItem: [InspactionItem] = [
    InspactionItem(title: "Cleanliness Inspection", subItems: inspectionSubItems),
    InspactionItem(title: "Bathroom", subItems: inspectionSubItems),
    InspactionItem(title: "Washroom", subItems: inspectionSubItems),
    InspactionItem(title: "Dressingroom", subItems: inspectionSubItems),
    InspactionItem(title: "Balcony", subItems: inspectionSubItems)
]

//dummy items for inspectionItem
//tag == 1 means noSign
let inspectionSubItems: [SubItem] = [SubItem(title: "Ench inch of the room has been ssanitized", tag: 1),
                                     SubItem(title: "Ench inch of the room has been ssanitized", tag: 1),
                                     SubItem(title: "Ench inch of the room has been ssanitized", tag: 1),
                                     SubItem(title: "Ench inch of the room has been ssanitized", tag: 1)]
