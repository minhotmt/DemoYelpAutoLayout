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
        loadData2()
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
    
    func loadData2(){
        let headers = [
            "Authorization": "Bearer wpXNVIXNF39AhV8Qha-W2N8B-sKzHFmz5d9aRL6rXMb836jMZOvSOnfvYpW5Vzy6TAcuLbmKGU7DnwF1I8MPG_P7SRxQzTuD8LacU2IwGPcsjkL0ztlFXEzIAkXeXHYx",
            "User-Agent": "PostmanRuntime/7.13.0",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "d469e39b-1f11-40dc-bee7-69f23c9580e7,bdf6b9f4-c6c8-439c-9b15-5b69e7636342",
            "Host": "api.yelp.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.yelp.com/v3/businesses/search?temp=Thai&latitude=37.774866&longitude=-122.394556")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
           
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            guard let blog = try? JSONDecoder().decode(Busines.self, from: data) else {
                print("Error: Couldn't decode data into business")
                return
            }
            
            for item in blog.businesses {
                print(item.location.address1!)
            }
            
        })
        
        dataTask.resume()
    }
    
}

struct Busines: Decodable {
    var businesses: [Busi]
}

struct Busi: Decodable {
    let id: String
    let alias: String
    let name: String
    let image_url: String
    let review_count: Int
    let rating: Float
    let price: String
    let location: Location
}

struct Location: Decodable {
    let address1: String?
    let address2: String?
}

