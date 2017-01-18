//
//  EmployeeTable.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 30.12.16.
//  Copyright © 2016 Vlad Samoilov. All rights reserved.
//

import UIKit
import CoreData

class EmployeeTable: UITableViewController,NSFetchedResultsControllerDelegate {
    
    
     var fetchedResultsController = Manager.instance.fetchedResultsController("MyEmployees", keyForSort: "name")
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        }catch {
            print(error)
            
        }
        
    }

    @IBAction func AddService(_ sender: AnyObject) {
        performSegue(withIdentifier: "EmployeesToEmployee", sender: nil)
    }
    
    @IBAction func cancel(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
        
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employee = fetchedResultsController.object(at: indexPath) as! MyEmployees
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = employee.lastname
        cell?.detailTextLabel?.text = employee.post
        
        
        

        return cell!
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let managedObject = fetchedResultsController.object(at: indexPath) as! NSManagedObject
            Manager.instance.managedObjectContext.delete(managedObject)
            Manager.instance.saveContext()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = fetchedResultsController.object(at: indexPath) as? MyEmployees
        performSegue(withIdentifier: "EmployeesToEmployee", sender: employee)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmployeesToEmployee" {
            let controller = segue.destination as! EmployeeView
            controller.employee = sender as? MyEmployees
        }
    }

    // MARK: - Fetched Results Controller Delegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                let employee = fetchedResultsController.object(at: indexPath) as! MyEmployees
                let cell = tableView.cellForRow(at: indexPath)
                cell!.textLabel?.text = employee.name
            }
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    
}
