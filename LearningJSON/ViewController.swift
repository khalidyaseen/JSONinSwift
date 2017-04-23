//
//  ViewController.swift
//  LearningJSON
//
//  Created by Yaseen Majeed on 23/04/17.
//  Copyright © 2017 Yamin Hameed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var datalabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://api.adorable.io/avatars/list")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print("Error occcured")
            }
            else{
                if let mydata = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: mydata, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            //print(myJson)
                        if let face = myJson["face"] as AnyObject?{
                            //print(face)
                            if let nose = face["nose"] as! NSArray? {
                                print(nose)
                            }
//                      self.datalabel.text = (face as! String)
                        }
                    }
                    catch{
                        //error handling here
                    }
                    
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

