//
//  Constants.swift
//  AppSync
//
//  Created by Swaminathan on 29/04/22.
//

import Foundation

internal struct Constants {
    static let ios = "ios"
    static let zipFiles = "zipFiles"
    static let nativeReleaseType = "nativeReleaseType"
    static let hybridReleaseType = "hybridReleaseType"
    static let kServerURL = Bundle.main.infoDictionary?["hamServerURL"] as? String ?? ""
    static let projectID = Bundle.main.infoDictionary?["projectID"] as? String ?? ""
    static let nativeVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    struct Keys {
        static let hybridVersion = "hybrid_version"
        static let nativeVersion = "native_version"
        static let platform = "platform"
        static let projectIdentifier = "project-identifier"
        static let deviceID = "device_identifier"
        static let platformVersion = "platform_version"
    }
    
    struct Apis {
        static let appSync = "app_sync"
        static let checkForUpdate = "\(appSync)/check_for_update"
    }
}
