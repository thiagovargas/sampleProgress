//
//  TableViewController.swift
//  sampleProgress
//
//  Created by Thiago on 28/01/15.
//  Copyright (c) 2015 sampe. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var array:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.array.addObject("Sample 1")
        self.array.addObject("Sample 2")
        self.array.addObject("Sample 3")
        self.array.addObject("Sample 4")
        self.array.addObject("Sample 5")
        self.array.addObject("Sample 6")
        self.array.addObject("Sample 7")
        self.array.addObject("Sample 8")
        self.array.addObject("Sample 9")
        self.array.addObject("Sample 10")
        self.array.addObject("Sample 11")
        self.array.addObject("Sample 12")
        self.array.addObject("Sample 13")
        self.array.addObject("Sample 14")
        self.array.addObject("Sample 15")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.array.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        let cell = UITableViewCell()
        
        // Configure the cell...

        cell.textLabel?.text = self.array[indexPath.row].description
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.mode = MBProgressHUDModeIndeterminate
        hud.labelText = "Aguarde..."
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), { () -> Void in*/
            self.Test({ (vc) -> () in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let ret = MBProgressHUD.hideHUDForView(self.view, animated: true)
                })
                
                self.ChangeViewController(vc)
            })
        //})
    }
    
    func Test(completion:(UIViewController) -> ()){
        //sleep(3)
        
        let destViewController: ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as ViewController
        
        var vc:UIViewController = destViewController
        completion(vc)
    }
    
    func ChangeViewController(vc:UIViewController){
        self.navigationController!.pushViewController(vc, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
