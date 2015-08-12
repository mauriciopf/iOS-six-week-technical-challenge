//
//  DataController.swift
//  challenge_dev_Mauricio
//
//  Created by mauriciopf on 8/12/15.
//  Copyright (c) 2015 mauriciopf. All rights reserved.
//

import UIKit
import CoreData

class DataController: NSObject {
   
    var newStudents = [NSManagedObject]()
    static let sharedInstance = DataController()

    
    func newStudent(name: String)->Bool {
    
        var delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var managedContext = delegate.managedObjectContext!
        
        var newStudent: Student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: managedContext) as! Student
    
          newStudent.name = name

        
        var error: NSError?
        managedContext.save(&error)
        
        println(newStudents.count)
        
        if error !=  nil { println("error:\(error?.userInfo)")
            return false
        } else {
            
        
            
            return true

        
    
    }
    
    
    
    }

    func loadStudents(vc: ViewController) ->NSArray {
        
        var delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var managedContext = delegate.managedObjectContext!
        var error: NSError?

    
    let fetchRequest = NSFetchRequest(entityName: "Student")
        
    let result : [AnyObject] = managedContext.executeFetchRequest(fetchRequest, error: &error)!
        
        let objects = result as! [NSManagedObject]
        
        newStudents = objects
        vc.mtableView.reloadData()
      
    return newStudents
    
    
    
    }
    
    func eraseStudents(entry: NSManagedObject ) {
    
        var delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var managedContext = delegate.managedObjectContext!
        var error: NSError?

    managedContext.deleteObject(entry)
    
    managedContext.save(&error)
    
    }






}
