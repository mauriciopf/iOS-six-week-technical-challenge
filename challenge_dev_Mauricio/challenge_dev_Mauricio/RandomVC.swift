//
//  RandomVC.swift
//  challenge_dev_Mauricio
//
//  Created by mauriciopf on 8/12/15.
//  Copyright (c) 2015 mauriciopf. All rights reserved.
//

import UIKit
import CoreData

class RandomVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mtableView: UITableView!
    var mArray = [NSManagedObject]()
    var pairArray =  [NSManagedObject]()
    var oddArray =  [NSManagedObject]()



    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for element in mArray {
        
           let index = find(mArray, element)
            
            if index! % 2 == 0  {
                
                pairArray.append(element)
            
            
                
            } else {
            
            
            oddArray.append(element)
            
            
            }
        
        
        
        }

               println(DataController.sharedInstance.newStudents)
        
        view.backgroundColor = UIColor.whiteColor()
        
        mtableView = UITableView(frame: self.view.frame)
        mtableView.delegate = self
        mtableView.registerClass(randomTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        mtableView.dataSource = self
        view.addSubview(mtableView)
        

        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oddArray.count
        
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! randomTableViewCell
        
        
        cell.studentLabel1.text = pairArray[indexPath.row].valueForKey("name") as? String
        cell.studentLabel2.text = oddArray[indexPath.row].valueForKey("name") as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80;
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
