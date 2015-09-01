//
//  ContainerViewController.swift
//  Rotten
//
//  Created by NVT on 9/1/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let moviesViewController = segue.destinationViewController as! MoviesViewController
        
        switch restorationIdentifier! {
            case "topDVDs":
                moviesViewController.mode = .TopDVDs
            default:
                moviesViewController.mode = .BoxOffice
        }
    
    }
}
