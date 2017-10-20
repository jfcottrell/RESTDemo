//
//  ViewController.swift
//  RESTDemo
//
//  Created by John Cottrell on 8/19/17.
//  Copyright © 2017 John Cottrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var personArray = [Person]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let url = URL(string: "http://localhost:8080/") else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
         
            // print out error and response
            print(error ?? "no error.")
            print(response ?? "response error.")
            
            do {
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("datastring = \(dataString!)")
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]]
                    print("json = \(json)")
                    print("json type = \(type(of: json))")
                    
                    for item in json! {
                        //print("item = \(item)")
                        let id: Int = item["id"] as! Int
                        let firstName: String = item["first_name"] as! String
                        let lastName: String = item["last_name"] as! String
                        let person = Person(id: id, firstName: firstName, lastName: lastName)
                        self.personArray.append(person)
                    }
                    DispatchQueue.main.async() {
                        self.tableView.reloadData()
                    }
                } catch let myJSONError {
                    
                    print(myJSONError)
                }

            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        })
        task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("array count = \(personArray.count)")
        
        return personArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "TableCell")!
        cell.textLabel?.text = self.personArray[indexPath.row].firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected ROW: \(indexPath.row)")
        self.performSegue(withIdentifier: "mainToDetail", sender: self)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // reference to second view controller
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.receivedData = personArray[(tableView.indexPathForSelectedRow?.row)!]
    }
}
