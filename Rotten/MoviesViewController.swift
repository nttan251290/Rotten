//
//  MoviesViewController.swift
//  Rotten
//
//  Created by NVT on 8/29/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    var movies: [NSDictionary]?
    var mode: MoviesViewMode = .BoxOffice
    
    enum MoviesViewMode {
        case BoxOffice, TopDVDs
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        // Do any additional setup after loading the view.
        
        tableView.backgroundColor = .blackColor()
        tableView.tintColor = .whiteColor()
        
        loadMovies()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.addPullToRefreshWithActionHandler(loadMovies)
        tableView.pullToRefreshView.activityIndicatorViewStyle = .White
    }
    
    func loadMovies() {
        
        let request = NSMutableURLRequest(URL: getEndpointURL())

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()){(response: NSURLResponse!, data: NSData!, error: NSError!)
            ->
            Void in
            SVProgressHUD.dismiss()
            
            if (self.tableView.pullToRefreshView != nil) {
                self.tableView.pullToRefreshView.stopAnimating()
            }
            
            let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary
            
            if let json = json {
                self.movies = json["movies"] as? [NSDictionary]
                self.tableView.reloadData()
            }
            
            self.tableView.dataSource = self
            self.tableView.delegate = self
            
        }
        
    }
    
    func getEndpointURL() -> NSURL {
        switch mode {
        case .TopDVDs:
            return NSURL(string: "https://gist.githubusercontent.com/timothy1ee/e41513a57049e21bc6cf/raw/b490e79be2d21818f28614ec933d5d8f467f0a66/gistfile1.json")!
            
        default:
            return NSURL(string: "https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json")!
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        
        let movie = movies![indexPath.row]
        
        cell.titleLabel?.text = movie["title"] as? String
        cell.synopsisLabel?.text = movie["synopsis"] as? String
        
        let url = NSURL(string: movie.valueForKeyPath("posters.thumbnail") as! String)!
        cell.posterView.setImageWithURL(url)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        
        let movie = movies![indexPath!.row]
        
        let movieDetailViewController = segue.destinationViewController as!MovieDetailsViewController
        
        movieDetailViewController.movie = movie
        
        println("I'm about to sequence")
    }
    

}
