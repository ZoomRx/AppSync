//
//  HybridRelease.swift
//  app sync
//
//  Created by Swaminathan on 26/04/22.
//

import Foundation

/// The release node of hybrid
class HybridRelease: Codable {
    var version: String
    var zips: [ZipData]
    
    init(version: String, zips: [ZipData]) {
        self.version = version
        self.zips = zips
    }
}
