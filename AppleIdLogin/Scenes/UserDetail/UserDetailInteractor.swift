//
//  UserDetailInteractor.swift
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

protocol UserDetailBusinessLogic
{
    func viewUserDetailView()
}

protocol UserDetailDataStore
{
    var loggedInUser: UserDetail.AppleIdLogin.Response? { get set }
}

class UserDetailInteractor: UserDetailBusinessLogic, UserDetailDataStore
{
    var presenter: UserDetailPresentationLogic?
    var loggedInUser: UserDetail.AppleIdLogin.Response?
    
    // MARK: Do something
    
    func viewUserDetailView()
    {
        if let loggedInUser = loggedInUser {
            presenter?.presentLoggedInUser(response: loggedInUser)
        }
    }
}
