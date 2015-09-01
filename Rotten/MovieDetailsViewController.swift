
//
//  MovieDetailsViewController.swift
//  Rotten
//
//  Created by NVT on 8/30/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var title = movie["title"] as? String
        println("Title: \(title)")
        titleLabel?.text = movie["title"] as? String
        synopsisLabel?.text = movie["synopsis"] as? String
        
        let url = NSURL(string: movie.valueForKeyPath("posters.thumbnail") as! String)!
        
        imageView.setImageWithURL(url)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        // Resize the UIView to fit the contents
        var frame = contentView.frame
        var height = max(frame.size.height, synopsisLabel.frame.origin.y + synopsisLabel.bounds.height + 20) + tabBarController!.tabBar.frame.height;
        frame.size.height = height + screenSize.height
        contentView.frame = frame
        
        // Set the content size of the UIScrolLView
        scrollView.contentSize = CGSizeMake(screenSize.width, frame.origin.y + height)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
