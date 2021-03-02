//
//  Schmecklist_model.swift
//  New_to_do_app
//
//  Created by Жанадил on 2/25/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import Foundation

struct Item{
    var text:String?
    var checked = false
    
    mutating func aaa(){
        checked = !checked
    }
}
