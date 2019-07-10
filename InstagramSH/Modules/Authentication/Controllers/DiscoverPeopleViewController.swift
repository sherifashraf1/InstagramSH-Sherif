//
//  DiscoverPeopleViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/4/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class DiscoverPeopleViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacebookCell") as! FacebookCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    


}
