//
//  UserLoginRouter.swift
//  AppleIdLogin
//
//  Created by Emmanuvel Thamel on 3/23/20.
//  Copyright (c) 2020 Creative Software. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol UserLoginRoutingLogic
{
    func routeToUserDetail(segue: UIStoryboardSegue?)
}

protocol UserLoginDataPassing
{
    var dataStore: UserLoginDataStore? { get }
}

class UserLoginRouter: NSObject, UserLoginRoutingLogic, UserLoginDataPassing
{
    weak var viewController: UserLoginViewController?
    var dataStore: UserLoginDataStore?
    
    // MARK: Routing
    
    func routeToUserDetail(segue: UIStoryboardSegue?)
    {
      if let segue = segue {
        let destinationVC = segue.destination as! UserDetailViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToUserDetail(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToUserDetail(source: dataStore!, destination: &destinationDS)
        navigateToUserDetail(source: viewController!, destination: destinationVC)
      }
    }
    
    // MARK: Navigation
    
    func navigateToUserDetail(source: UserLoginViewController, destination: UserDetailViewController)
    {
      source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToUserDetail(source: UserLoginDataStore, destination: inout UserDetailDataStore)
    {
        guard let user =  source.loggedInUser else {
            return
        }
        destination.loggedInUser = UserDetail.AppleIdLogin.Response(loggedInUser: user)
    }
}
