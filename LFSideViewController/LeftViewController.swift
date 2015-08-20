//
//  LeftViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class LeftViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset.top = self.view.frame.height / 3
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.sideViewController().hideLeftViewController();
    }
}
