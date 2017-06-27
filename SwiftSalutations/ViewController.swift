//
//  ViewController.swift
//  SwiftSalutations
//
//  Created by BishopHill on 6/26/17.
//  Copyright © 2017 Dumb Unicorn. All rights reserved.
//

import UIKit

let salutationEndpoint = "http://10.10.1.21:8090/salutation"

// MARK: = ViewController: UIViewController

class ViewController: UIViewController {
    
    @IBAction func getSalutation(_ sender: Any) {
        
       
            // create the task
            
            let task = URLSession.shared.dataTask(with: URL(string: salutationEndpoint)!) { (data, response, error) in
                
                // check for error
                
                if let error = error {
                    print(error)
                    return
                }
                
                // extract salutation and display in UI
                if let data = data {
                    var salutation: [String:String]! = nil
                    do {
                        salutation = try JSONSerialization.jsonObject(with: data) as? [String:String]
                    } catch {
                        print("could not serialize \(data)")
                        return
                    }
                    DispatchQueue.main.async {
                        self.salutationLabel.text = salutation["text"]
                    }
                } else {
                    print("no data was returned")
                }
        }
        
    }
    
    @IBOutlet weak var salutationLabel: UILabel!
    
    
    
    
//    @IBAction func getSalutation(_ sender: Any) {
//        
//        // create the task
//        
//        let task = URLSession.shared.dataTask(with: URL(string: salutationEndpoint)!) { (data, response, error) in
//            
//            // check for error
//            
//            if let error = error {
//                print(error)
//                return
//            }
//            
//            // extract salutation and display in UI
//            if let data = data {
//                var salutation: [String:String]! = nil
//                do {
//                    salutation = try JSONSerialization.jsonObject(with: data) as? [String:String]
//                } catch {
//                    print("could not serialize \(data)")
//                    return
//                }
//                DispatchQueue.main.async {
//                    self.salutationLabel.text = salutation["text"]
//                }
//            } else {
//                print("no data was returned")
//            }
//            
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

