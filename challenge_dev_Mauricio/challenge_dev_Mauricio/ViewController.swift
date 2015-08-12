//
//  ViewController.swift
//  challenge_dev_Mauricio
//
//  Created by mauriciopf on 8/12/15.
//  Copyright (c) 2015 mauriciopf. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mtableView: UITableView!
    var mtextField = UITextField()
    var randomArray = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.title = "Students"
        view.backgroundColor = UIColor.whiteColor()
        
        mtableView = UITableView(frame: self.view.frame)
        mtableView.delegate = self
        mtableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        mtableView.dataSource = self
        view.addSubview(mtableView)
        
       
        
        
        let addButton = UIBarButtonItem(title: "New", style: UIBarButtonItemStyle.Plain, target: self, action: "new")
        self.navigationItem.leftBarButtonItem = addButton
        
        let randomButton = UIBarButtonItem(title: "Randomize", style: UIBarButtonItemStyle.Plain, target: self, action: "random")
        self.navigationItem.rightBarButtonItem = randomButton
        
        
        // Do any additional setup after loading the view, typically from a nib.
}

    override func viewWillAppear(animated: Bool) {
        DataController.sharedInstance.loadStudents(self)
    }
    
    override func viewDidAppear(animated: Bool) {
        DataController.sharedInstance.loadStudents(self)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.sharedInstance.newStudents.count
      
    }
    

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
    cell.textLabel?.text = DataController.sharedInstance.newStudents[indexPath.row].valueForKey("name") as? String
        
       return cell
        
    }
    
  

    
    func new() {
    

    var alert = UIAlertController(title: "New Student", message: "Add a new Student", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textfield: UITextField!) -> Void in
        textfield.placeholder = "write"
        }
        
        var addAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as! UITextField
            
            DataController.sharedInstance.newStudent(textField.text)
            
            println("Text field: \(textField.text)")

            
        }
        
        alert.addAction(addAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func random() {
        
        var number = DataController.sharedInstance.newStudents.count
        
    var randomNumber = Int(arc4random_uniform(UInt32(number)))
        
        DataController.sharedInstance.newStudents = shuffle(DataController.sharedInstance.newStudents)
        
        
        println(DataController.sharedInstance.newStudents[0])
    
  let vc = RandomVC()
    
        vc.mArray = DataController.sharedInstance.newStudents


        
    self.navigationController?.pushViewController(vc, animated: true)
    
    
    }
    
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        let c = count(list)
      //  println(list)
        if c < 2 { return list }
        for i in 0..<(c - 1) {
            let j = Int(arc4random_uniform(UInt32(c - i))) + i
            swap(&list[i], &list[j])
       // println("second\(list)")
        
        }
        
        
        
        return list
    }
    
    
    
 
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

