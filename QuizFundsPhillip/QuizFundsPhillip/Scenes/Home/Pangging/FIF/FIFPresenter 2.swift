//
//  FIFPresenter.swift
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

protocol FIFPresentationLogic
{
  func presentSomething(response: FIF.Something.Response)
}

class FIFPresenter: FIFPresentationLogic
{
  weak var viewController: FIFDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: FIF.Something.Response)
  {
    let viewModel = FIF.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
