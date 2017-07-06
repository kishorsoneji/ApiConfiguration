//
//  APIUtility.swift
//  SampleDemo
//
//  Created by Harry on 7/5/17.
//  Copyright © 2017 Harry. All rights reserved.
//

import UIKit
import AFNetworking

class APIUtility: NSObject {

    class var sharedInstace : APIUtility {
        
        struct Static {
            static let instace : APIUtility = APIUtility()
        }
        return Static.instace
    }
    
    
    let manager : AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
    let sessionManager : AFHTTPSessionManager = AFHTTPSessionManager()
    let jsonResponse : AFJSONResponseSerializer = AFJSONResponseSerializer()
    var responseData : NSMutableData!
    
    func makeGetApiCallWithEndURL(url: String, parameters : NSDictionary!, completionHandle: @escaping (NSDictionary?,NSError?)->()) {
    
        if(manager.reachabilityManager.isReachable) {
            self.manager.responseSerializer = jsonResponse
            manager.responseSerializer.setValue("application/json", forKey: "Content-Type")
            manager.get(url, parameters: parameters, success: {(operation : AFHTTPRequestOperation, _ responseData : Any) -> Void in
                
                var responseDict : NSDictionary!
                if((responseData as AnyObject).count > 0){
                    responseDict = responseData as! NSDictionary
                }

                completionHandle(responseDict,nil)
                
            }, failure:{(_ operation : AFHTTPRequestOperation?, _ error : Error) -> Void
                in
                print(error)
                 completionHandle(nil,error as NSError?)
            })
        } else {
            let alert = UIAlertView(title: "", message: "Please start the internet", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
           
            
        }
    
    }
    
    func makePostApiCallWithEndURL(url: String, parameters : NSDictionary!, completionHandle: @escaping (NSDictionary?,NSError?)->()) {
        
        if(manager.reachabilityManager.isReachable) {
            self.manager.responseSerializer = jsonResponse
            manager.responseSerializer.setValue("application/json", forKey: "Content-Type")
            
            manager.post(url, parameters: parameters, success: {(_operation : AFHTTPRequestOperation, responseData:  Any) -> Void
                in
                var responseDict : NSDictionary!
                if((responseData as AnyObject).count > 0){
                    responseDict = responseData as! NSDictionary
                }
                completionHandle(responseDict,nil)
                
                
            }, failure: {(_ operation : AFHTTPRequestOperation?, _ error : Error) -> Void
                in
                print(error)
                completionHandle(nil,error as NSError?)
            
            })
        } else {
            let alert = UIAlertView(title: "", message: "Please start the internet", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
            
        }
    
    }
    
    func makeImageUploadWithEndURL(url: String,image : UIImage, parameters : NSDictionary!, completionHandle: @escaping (NSDictionary?,NSError?) ->()) {
        
        if(manager.reachabilityManager.isReachable) {
            let imgData = UIImageJPEGRepresentation(image, 1.0)
            manager.post(url, parameters: parameters, constructingBodyWith:{ (formData: AFMultipartFormData!) -> Void in
                formData.appendPart(withForm: imgData!, name: "a1.jpg")
            }, success: {(operation : AFHTTPRequestOperation, responseData : Any) -> Void in
                
                var responseDict : NSDictionary!
                if((responseData as AnyObject).count > 0){
                    responseDict = responseData as! NSDictionary
                }
                completionHandle(responseDict,nil)
                
            }, failure: { (operation : AFHTTPRequestOperation?,error : Error) -> Void in
                completionHandle(nil,error as NSError?)
            })
        } else {
            let alert = UIAlertView(title: "", message: "Please start the internet", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
            
        }
        
    }
    
    
    
    
}
