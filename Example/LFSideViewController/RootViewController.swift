//
//  RootViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class RootViewController: LFSideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.contentViewController = storyboard.instantiateViewControllerWithIdentifier("NavigationViewController") as? UIViewController
        self.rightViewController = storyboard.instantiateViewControllerWithIdentifier("RightViewController") as? UIViewController
        self.leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController") as? UIViewController
    }
}
