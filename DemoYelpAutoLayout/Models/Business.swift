//
//  Business.swift
//  DemoYelpAutoLayout
//
//  Created by MinhNV on 5/20/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import Foundation
import UIKit

public class Business {
    var imageUrl: String
    var name: String
    var ratingImageUrl: String
    var numReviews: Int
    var address: String
    var categories: String
    var distance: Float
    var snippet: String

    init(imageUrl: String, name: String, ratingImageUrl: String, numReviews: Int, address: String, categories: String, distance: Float, snipet: String) {

        self.imageUrl = imageUrl
        self.name = name
        self.ratingImageUrl = ratingImageUrl
        self.numReviews = numReviews
        self.address = address
        self.categories = categories
        self.distance = distance
        self.snippet = snipet

    }

}



