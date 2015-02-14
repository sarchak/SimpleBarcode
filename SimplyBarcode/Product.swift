//
//  Product.swift
//  SimplyBarcode
//
//  Created by Shrikar Archak on 2/8/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import Foundation
import CoreData

class Product: NSManagedObject {

    @NSManaged var productName: String
    @NSManaged var supplierName: String
    @NSManaged var barcodeString: String
    @NSManaged var quantity: NSNumber
    @NSManaged var cost: NSNumber
    @NSManaged var barcode: NSData

}
