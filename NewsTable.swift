//
//  NewsTable.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 04.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit
import CoreData


class NewsTable: UITableViewController,NSFetchedResultsControllerDelegate {
    
     var fetchedResultsController = Manager.instance.fetchedResultsController("MyNews", keyForSort: "title")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        
        
        
    }
    
    @IBAction func AddNews(_ sender: AnyObject) {
        performSegue(withIdentifier: "newsToNew", sender: nil)
    }
    
    @IBAction func cancel(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }

   

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = fetchedResultsController.object(at: indexPath) as! MyNews
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = news.title
        cell?.detailTextLabel?.text = news.newstext
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let managedObject = fetchedResultsController.object(at: indexPath) as! NSManagedObject
            Manager.instance.managedObjectContext.delete(managedObject)
            Manager.instance.saveContext()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = fetchedResultsController.object(at: indexPath) as? MyNews
        performSegue(withIdentifier: "newsToNew", sender: news)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsToNew" {
            let controller = segue.destination as! NewsView
            controller.news = sender as? MyNews
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
                let news = fetchedResultsController.object(at: indexPath) as! MyNews
                let cell = tableView.cellForRow(at: indexPath)
                cell!.textLabel?.text = news.title
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
