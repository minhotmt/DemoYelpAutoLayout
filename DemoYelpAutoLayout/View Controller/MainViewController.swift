//
//  MainViewController.swift
//  DemoYelpAutoLayout
//
//  Created by MinhNV on 5/20/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let productCellId = "BusinessCell"
    var lstBusiness : [Business] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell
        tableView.register(UINib.init(nibName: productCellId, bundle: nil), forCellReuseIdentifier: productCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        lstBusiness = createBusiness()
    }
    
    func createBusiness() -> [Business]{
        
        var listBusiness: [Business] = []
        let business1 = Business(imageUrl: "mon1.jpeg", name: "Basil Thai Restaurant & Bar", ratingImageUrl: "nil", numReviews: 1038, address: "1175 Folsom St, SoMa", categories: "Thai, Seafood, Salad", distance: 45.0, snipet: "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...")
          let business2 = Business(imageUrl: "mon2.jpeg", name: "Basil Thai Restaurant & Bar", ratingImageUrl: "nil", numReviews: 1038, address: "1175 Folsom St, SoMa", categories: "Thai, Seafood, Salad", distance: 45.0, snipet: "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...")
          let business3 = Business(imageUrl: "mon3.jpg", name: "Basil Thai Restaurant & Bar", ratingImageUrl: "nil", numReviews: 1038, address: "1175 Folsom St, SoMa", categories: "Thai, Seafood, Salad", distance: 45.0, snipet: "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...")
        let business4 = Business(imageUrl: "mon3.jpg", name: "Basil Thai Restaurant & Bar", ratingImageUrl: "nil", numReviews: 1038, address: "1175 Folsom St, SoMa", categories: "Thai, Seafood, Salad", distance: 45.0, snipet: "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...")
        let business5 = Business(imageUrl: "mon3.jpg", name: "Basil Thai Restaurant & Bar", ratingImageUrl: "nil", numReviews: 1038, address: "1175 Folsom St, SoMa", categories: "Thai, Seafood, Salad", distance: 45.0, snipet: "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...")
          let business6 = Business(imageUrl: "mon3.jpg", name: "Basil Thai Restaurant & Bar", ratingImageUrl: "nil", numReviews: 1038, address: "1175 Folsom St, SoMa", categories: "Thai, Seafood, Salad", distance: 45.0, snipet: "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...")
          let business7 = Business(imageUrl: "mon3.jpg", name: "Basil Thai Restaurant & Bar", ratingImageUrl: "nil", numReviews: 1038, address: "1175 Folsom St, SoMa", categories: "Thai, Seafood, Salad", distance: 45.0, snipet: "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...")
        listBusiness.append(business1)
        listBusiness.append(business2)
        listBusiness.append(business3)
        listBusiness.append(business4)
        listBusiness.append(business5)
        listBusiness.append(business6)
        listBusiness.append(business7)
        return listBusiness
        
    }
    
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lstBusiness.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = lstBusiness[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        cell.setBusiness(business: item)
        return cell
    }
    
}
