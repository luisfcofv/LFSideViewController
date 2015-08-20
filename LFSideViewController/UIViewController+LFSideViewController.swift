//
//  UIViewController+LFSideViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/20/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func sideViewController() -> LFSideViewController {
        var viewController = self.parentViewController
        while viewController != nil && !(viewController!.isKindOfClass(LFSideViewController)) {
            viewController = viewController!.parentViewController
        }
        
        return viewController as! LFSideViewController
    }
}