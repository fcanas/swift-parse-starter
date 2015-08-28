//
//  Status.swift
//  test
//
//  Created by Fabian Canas on 8/28/15.
//  Copyright (c) 2015 Fabián Cañas. All rights reserved.
//

import UIKit

class Status: PFObject, PFSubclassing {
    @NSManaged var content :String?
    static func parseClassName() -> String {
        return "Status"
    }
}
