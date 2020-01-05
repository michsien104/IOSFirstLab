//
//  ViewController.swift
//  MS1Lab
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.icndb.com/jokes/random")!;

        Alamofire.request(url).responseJSON {
            response in
            let json = try? JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers);
            let jsonData = json as! NSDictionary;
            let value = jsonData["value"] as? [String: Any];
            let joke = value!["joke"] as? String;
            DispatchQueue.main.async {
                self.textView.text = joke! as String;
            };
        }
    }


}

