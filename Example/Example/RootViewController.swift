//
//  RootViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import LFSideViewController

class RootViewController: LFSideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.contentViewController = storyboard.instantiateViewControllerWithIdentifier("NavigationViewController")
        self.rightViewController = storyboard.instantiateViewControllerWithIdentifier("RightViewController")
        self.leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController")
    }
}
