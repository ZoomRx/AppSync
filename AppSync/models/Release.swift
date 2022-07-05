//
//  Release.swift
//  app sync
//
//  Created by Swaminathan on 26/04/22.
//

import Foundation

/// The Top level object that handles different release categories
public class Release: Codable {
    var maintenanceMode: Bool
    var hybrid : Node<HybridRelease>
    var native : Node<NativeRelease>
    
    init (maintenanceMode: Bool, hybrid: Node<HybridRelease>, native: Node<NativeRelease>) {
        self.maintenanceMode = maintenanceMode
        self.hybrid = hybrid
        self.native = native
    }
}
