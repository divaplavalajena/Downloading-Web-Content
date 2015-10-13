//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Jena Grafton on 10/13/15.
//  Copyright © 2015 Bella Voce Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            //Will happen when task completes
            //Known as a completion handler or a closure
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.webView.loadHTMLString(String(webContent), baseURL: nil)
                })
                
                
                
            } else {
                //Show error message
            }
            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

