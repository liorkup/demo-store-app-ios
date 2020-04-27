//
//  GoogleAdsACService.swift
//  iosadsdemo
//
//  Created by Lior Kupfer on 26/04/2020.
//  Copyright © 2020 wentaoli. All rights reserved.
//
import AdSupport;
import FirebaseFunctions

class GoogleAdsACService {
    
    let VOID_IDFA = "00000000-0000-0000-0000-000000000000";
    
    public static var app: GoogleAdsACService = {
        return GoogleAdsACService()
    }()
    
    public func adToAction (processAction: @escaping (_ action: String) -> Void) {
        
        let idfaOpt = identifierForAdvertising()
        guard let idfa = idfaOpt, idfa != VOID_IDFA else {
            print("IDFA not available")
            return
        }
        
        getAdInfoCloudFunction(idfa: idfa, processAction: processAction)
        
    }
    
    private func getAdInfoCloudFunction(idfa: String, processAction: @escaping (_ action: String) -> Void) {
        let functions = Functions.functions()
        
        functions.httpsCallable("googleAdsConversionResult").call(["advertisingId": idfa, "lat" : 0]) { (result, error) in
          if let error = error as NSError? {
            if error.domain == FunctionsErrorDomain {
              let message = error.localizedDescription
                NSLog("Firebsase Function Error: %@", message)
            }
          }
            
          if let action = (result?.data as? [String: Any])?["action"] as? String {
            processAction(action)
          }
        }
    }
    
    private func identifierForAdvertising() -> String? {
        // Check whether advertising tracking is enabled
        guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
            return nil
        }

        // Get and return IDFA
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}
