//
//  LoginViewController.swift
//  Twitter
//
//  Created by Grigori on 10/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func onButtonLogin(_ sender: Any) {
        let twitterUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: twitterUrl, success: {
            self.performSegue(withIdentifier: "toLoginHome", sender: self)
        }, failure: { (Error) in
            print("Not logged in")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
