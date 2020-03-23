//
//  UserDetailPresenter.swift
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

protocol UserDetailPresentationLogic
{
    func presentLoggedInUser(response: UserDetail.AppleIdLogin.Response)
}

class UserDetailPresenter: UserDetailPresentationLogic
{
    weak var viewController: UserDetailDisplayLogic?
    
    // MARK: Do something
    
    func presentLoggedInUser(response: UserDetail.AppleIdLogin.Response)
    {
        let id = "User Id: \(response.id)"
        let firstName = "First Name: \(response.firstName)"
        let lastName = "Last Name: \(response.lastName)"
        let userEmail = "Email: \(response.email)"
        let viewModel = UserDetail.AppleIdLogin.ViewModel(id: id, firstName: firstName, lastName: lastName, email: userEmail)
        viewController?.displayLoggedInUser(viewModel: viewModel)
    }
}