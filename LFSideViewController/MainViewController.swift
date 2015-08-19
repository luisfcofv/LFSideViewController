//
//  MainViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func openSideMenu(sender: AnyObject) {
        var sideViewController = self.parentViewController?.parentViewController as! LFSideViewController
        sideViewController.toogleLeftViewController()
    }
}
