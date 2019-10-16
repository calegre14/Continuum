//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/16/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit
import CloudKit

protocol SearchRecord {
    func matches(searchTerm: String) -> Bool
}


