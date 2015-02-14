//
//  AddInventoryViewController.swift
//  SimplyBarcode
//
//  Created by Shrikar Archak on 2/8/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit

class AddInventoryViewController: UIViewController {

    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var supplierName: UITextField!
    
    @IBOutlet weak var quantity: UITextField!
    
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var barcodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapped(sender: AnyObject) {
        self.productName.resignFirstResponder()
        self.supplierName.resignFirstResponder()
        self.quantity.resignFirstResponder()
    }
    @IBAction func previewBarcode(sender: AnyObject) {
        let data = RSUnifiedCodeGenerator().genCodeWithContents(productName.text, machineReadableCodeObjectType: AVMetadataObjectTypeCode128Code)
        self.barcodeImageView.image = data
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func savePressed(sender: AnyObject) {
        let data = UIImageJPEGRepresentation(self.barcodeImageView.image, 0.90)
        coreDataStack.insertInventory(self.productName.text!, supplierName: self.supplierName.text!, quantity: self.quantity.text.toInt()!, cost: (self.cost.text as NSString).doubleValue, barcodeString: self.productName.text!, barcode: data)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
