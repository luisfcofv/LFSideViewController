//
//  RootViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import LFSideViewController

class RootViewController: LFSideViewController, LFSideViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.contentViewController = storyboard.instantiateViewController(withIdentifier: "NavigationViewController")
        self.rightViewController = storyboard.instantiateViewController(withIdentifier: "RightViewController")
        self.leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController")
        
        if let sideViewController = self.sideViewController() {
            sideViewController.delegate = self
        }
    }
    
    func willPresentViewController(_ viewController: UIViewController?) {
        print("willPresentViewController \(viewController)")
    }
    
    func didPresentViewController(_ viewController: UIViewController?) {
        print("didPresentViewController \(viewController)")
    }
    
    func willHideViewController(_ viewController: UIViewController?) {
        print("willHideViewController \(viewController)")
    }
    
    func didHideViewController(_ viewController: UIViewController?) {
        print("didHideViewController \(viewController)")
    }
}
