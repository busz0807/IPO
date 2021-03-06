//
//  GMFPresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 29/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol GMFPresentationLogic
{
  func presentSomething(response: GMF.Something.Response)
}

class GMFPresenter: GMFPresentationLogic
{
  weak var viewController: GMFDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: GMF.Something.Response)
  {
    let viewModel = GMF.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
