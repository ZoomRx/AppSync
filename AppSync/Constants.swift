//
//  Constants.swift
//  AppSync
//
//  Created by Swaminathan on 29/04/22.
//

import Foundation

internal struct Constants {
    static let ios = "ios"
    static let zipFiles = "zips"
    static let nativeReleaseType = "nativeReleaseType"
    static let hybridReleaseType = "hybridReleaseType"
    static let kServerURL = Bundle.main.infoDictionary?["hamServerURL"] as? String ?? ""
    static let projectID = Bundle.main.infoDictionary?["projectID"] as? String ?? ""
    static let nativeVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    static let defaultHybridVersion = Bundle.main.infoDictionary?[Constants.Keys.hybridVersion] as? String ?? "1.0.0"
    static let hybridVersion = UserDefaults.standard.string(forKey: Constants.Keys.hybridVersion) ?? defaultHybridVersion
    static let deviceToken = UserDefaults.standard.string(forKey: "device_token") ?? "123456789"
    struct Keys {
        static let hybridVersion = "hybrid_version"
        static let nativeVersion = "native_version"
        static let platform = "platform"
        static let projectIdentifier = "project-identifier"
        static let deviceID = "device_identifier"
        static let platformVersion = "platform_version"
        static let notificationToken = "notification_token"
    }
    
    struct Apis {
        static let appSync = "app_sync"
        static let checkForUpdate = "\(appSync)/check_for_update"
    }
}
