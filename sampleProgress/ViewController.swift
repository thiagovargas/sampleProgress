//
//  ViewController.swift
//  sampleProgress
//
//  Created by Thiago on 28/01/15.
//  Copyright (c) 2015 sampe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var asdWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.asdWebView.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.mode = MBProgressHUDModeIndeterminate
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), { () -> Void in
            
            let nsurl: NSURL = NSURL(string: "http://www.google.com")!
            let request: NSURLRequest = NSURLRequest(URL: nsurl)
            self.asdWebView.loadRequest(request)
            
            self.asdWebView.scrollView.bounces = true
            self.asdWebView.scrollView.alwaysBounceHorizontal = true
            self.asdWebView.scrollView.alwaysBounceVertical = true
        })
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let ret = MBProgressHUD.hideHUDForView(self.view, animated: true)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

