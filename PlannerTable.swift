//
//  PlannerTable.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 04.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit
import CoreData

class PlannerTable: UITableViewController,NSFetchedResultsControllerDelegate {
    
    
    var fetchedResultsController = Manager.instance.fetchedResultsController("MyPlanners", keyForSort: "task")
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        }catch {
            print(error)
            
        }

     
    }

   
    @IBAction func AddTask(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "tasksToTask", sender: nil)
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
       
        let task = fetchedResultsController.object(at: indexPath) as! MyPlanners
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = task.task
        cell?.detailTextLabel?.text = task.aboutTask
        
        
        
        
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
        let employee = fetchedResultsController.object(at: indexPath) as? MyPlanners
        performSegue(withIdentifier: "tasksToTask", sender: employee)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tasksToTask" {
            let controller = segue.destination as! PlannerView
            controller.task = sender as? MyPlanners
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
                let employee = fetchedResultsController.object(at: indexPath) as! MyPlanners
                let cell = tableView.cellForRow(at: indexPath)
                cell!.textLabel?.text = employee.task
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
