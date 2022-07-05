//
//  Node.swift
//  app sync
//
//  Created by Swaminathan on 26/04/22.
//

import Foundation

/// Release node generic that can be both native release node or hybrid.
class Node <Element: Codable>: Codable {
    var release: Element?
    var unsupportedVersion: Bool?
}
