//
//  NativeRelease.swift
//  app sync
//
//  Created by Swaminathan on 26/04/22.
//

import Foundation

/// The release node of native
class NativeRelease: Codable {
    var version: String
    
    init(version: String) {
        self.version = version
    }
}
