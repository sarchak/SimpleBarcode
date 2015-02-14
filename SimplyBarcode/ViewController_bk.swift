//
//  ViewController.swift
//  SimplyBarcode
//
//  Created by Shrikar Archak on 1/24/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var barcodeText: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startScan(sender: AnyObject) {
        let scanner = RSScannerViewController(cornerView: true, controlView: true) { (data) -> Void in
            println(data)
        }
        self.presentViewController(scanner, animated: true, completion: nil)
    }

    @IBAction func generateBarCode(sender: AnyObject) {
        self.barcodeText.resignFirstResponder()
        let data = RSUnifiedCodeGenerator().genCodeWithContents(barcodeText.text, machineReadableCodeObjectType: AVMetadataObjectTypeCode128Code)
        self.imageView.image = data
    }
}

