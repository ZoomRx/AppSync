//
//  AppSyncManager.swift
//  app sync
//
//  Created by Swaminathan on 26/04/22.
//

import Foundation
import Alamofire

public class AppSyncManager {
    public static let shared = AppSyncManager()
    public var delegate: AppSyncDelegate?
    var session = AF
    
    /// Starts the syncing process
    public func appSync() {
        let hybridVersion = UserDefaults.standard.string(forKey: Constants.Keys.hybridVersion) ?? "1.0.0"
        let parameters: [String:Any] = [
            Constants.Keys.hybridVersion : hybridVersion,
            Constants.Keys.nativeVersion : Constants.nativeVersion,
            Constants.Keys.platform : Constants.ios,
            Constants.Keys.platformVersion : UIDevice.current.systemVersion,
            Constants.Keys.deviceID : UIDevice.current.identifierForVendor!.uuidString
        ]
        
        let headers: HTTPHeaders = [
            Constants.Keys.projectIdentifier : Constants.projectID
        ]
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        session.request("\(Constants.kServerURL)\(Constants.Apis.checkForUpdate)",method: .post, parameters:parameters, headers: headers)
            .validate()
            .responseDecodable(of: Release.self, decoder: decoder, completionHandler: { [self] response in
                switch response.result {
                case .success:
                    let responseData = response.value!
                    if responseData.maintenanceMode {
                        delegate?.didFinishSync(with: .maintenance, syncData: [:])
                        return
                    }
                    
                    let (hasNativeRelease, nativeReleaseType) = checkForRelease(node: responseData.native)
                        
                    if hasNativeRelease {
                        delegate?.didFinishSync(with: .native, syncData: [Constants.nativeReleaseType : nativeReleaseType, Constants.zipFiles : responseData.hybrid.release?.zips ?? [ZipData]()])
                    } else {
                        let (hasHybridRelease, hybridReleaseType) = checkForRelease(node: responseData.hybrid)
                        if hasHybridRelease {
                            UserDefaults.standard.set(responseData.hybrid.release?.version, forKey: Constants.Keys.hybridVersion)
                            UserDefaults.standard.synchronize()
                            delegate?.didFinishSync(with: .hybrid, syncData: [Constants.hybridReleaseType : hybridReleaseType, Constants.zipFiles : responseData.hybrid.release?.zips ?? [ZipData]()])
                        } else {
                            delegate?.didFinishSync(with: .none, syncData: [:])
                        }
                    }
                    
                case let .failure(error):
                    delegate?.didCancelWith(error: error)
                }
            })
    }
    
    /// Checks if there are any release for the release Node provided (Can be either native node or hybrid node)
    /// - Returns: Bool saying if there are any release and release type
    func checkForRelease<T>(node: Node<T>) -> (Bool, ReleaseType) {
        var releaseType: ReleaseType = .none
        switch (node.unsupportedVersion, node.release) {
        // if current version is unsupported, then its a force upgrade
        case (true, _):
            releaseType = .force
            
        // check if there are any release
        case (false, .some(_)):
            releaseType = .optional

        default:
            return (false, .none)
        }
        return (true, releaseType)
    }
}
