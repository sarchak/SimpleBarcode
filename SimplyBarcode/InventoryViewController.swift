//
//  InventoryViewController.swift
//  SimplyBarcode
//
//  Created by Shrikar Archak on 2/8/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit
import CoreData

let coreDataStack = CoreDataStack()

class InventoryViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    
    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        
        let fRequest = fetchRequest()
        
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fRequest, managedObjectContext: coreDataStack.managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        var error: NSError? = nil
        if !_fetchedResultsController!.performFetch(&error) {
        }
        
        return _fetchedResultsController!
    }
    
    var _fetchedResultsController: NSFetchedResultsController? = nil
    
    func fetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Product")
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "supplierName", ascending: false)
        
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultsController.performFetch(nil)
        
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let products = self.fetchedResultsController.fetchedObjects as [Product]
        return products.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as TableViewCell
        let product = self.fetchedResultsController.objectAtIndexPath(indexPath) as Product
        cell.productName.text = product.productName
        cell.supplierName.text = product.supplierName
        cell.cost.text = "$ \(product.cost)"
        cell.quantity.text = "\(product.quantity)"
        println(product.cost)
        return cell
    }
    
}
