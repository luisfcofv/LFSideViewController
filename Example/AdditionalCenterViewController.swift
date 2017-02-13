//
//  AdditionalCenterViewController.swift
//  Example
//
//  Created by Luis Francisco Flores Vazquez on 27/11/15.
//  Copyright © 2015 Luis Francisco Flores Vazquez. All rights reserved.
//

import UIKit

class AdditionalCenterViewController: UIViewController {

    @IBAction func originalViewControllerPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.sideViewController()!.contentViewController = storyboard.instantiateViewController(withIdentifier: "NavigationViewController")
    }
    
    @IBAction func leftMenuPressed(sender: AnyObject) {
        self.sideViewController()!.toogleLeftViewController()
    }
    
    @IBAction func rightMenuPressed(sender: AnyObject) {
        self.sideViewController()!.toogleRightViewController()
    }
}
