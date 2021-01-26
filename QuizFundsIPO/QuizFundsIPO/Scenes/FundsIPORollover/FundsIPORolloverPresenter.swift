//
//  FundsIPORolloverPresenter.swift
//  QuizFundsIPO
//
//  Created by BUSSNQ TH on 25/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FundsIPORolloverPresentationLogic
{
    func presentFetchFundsIPO(response: FundsIPORolloverModels.FetchFromRemoteDataStore.Response )
}

class FundsIPORolloverPresenter: FundsIPORolloverPresentationLogic
{
  weak var viewController: FundsIPORolloverDisplayLogic?
  
  // MARK: Do something
  
    func presentFetchFundsIPO(response: FundsIPORolloverModels.FetchFromRemoteDataStore.Response) {
        let fundsIPOData = response.fundsIPO
        let error = response.error
//        print("fundsIPOData", fundsIPOData)
        let viewModel = FundsIPORolloverModels.FetchFromRemoteDataStore.ViewModel(fundsIPO: fundsIPOData, error: error)
        viewController?.displayfundIPO(viewModel: viewModel)
  }
}