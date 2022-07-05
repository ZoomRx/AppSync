//
//  ZipData.swift
//  app sync
//
//  Created by Swaminathan on 26/04/22.
//

import Foundation

public class ZipData: Codable {
    public var name: String
    public var contentHash: String
    public var url: String
    
    init(name: String, contentHash: String, url: String) {
        self.name = name
        self.contentHash = contentHash
        self.url = url
    }
}
