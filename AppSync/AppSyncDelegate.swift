//
//  AppSyncDelegate.swift
//  AppSync
//
//  Created by Swaminathan on 03/05/22.
//

import Foundation

/// Delegate of AppSyncManager
public protocol AppSyncDelegate {
    
    /// Called when the sync is finished successfully without any errors
    /// - Parameters:
    ///   - category: Has the release category
    ///   - syncData: Contains any additional data about the release like the release type and zipfiles list.
    func didFinishSync(with category:ReleaseCategory, syncData: [String: Any])
    
    /// Called when there is an error during the syncing process
    /// - Parameter error: The error occured during the sync process
    func didCancelWith(error: Error)
}
