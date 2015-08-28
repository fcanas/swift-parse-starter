//
//  ViewController.swift
//  test
//
//  Created by Fabian Canas on 8/27/15.
//  Copyright (c) 2015 Fabián Cañas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var statusTableView :UITableView?
    let cellID = "StatusCellID"
    var statuses :[Status] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? UITableViewCell ?? UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        
        cell.textLabel?.text = statuses[indexPath.row].content
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Statuses"
        
        weak var _self = self
        Status.query()?.orderByAscending("createdAt").findObjectsInBackgroundWithBlock({ (results, error) -> Void in
            _self?.statuses = results as? [Status] ?? []
            _self?.statusTableView?.reloadData()
        })
        
        /*
        var newStatus = Status()
        newStatus.content = "This is my status"
        newStatus.saveInBackground()
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

