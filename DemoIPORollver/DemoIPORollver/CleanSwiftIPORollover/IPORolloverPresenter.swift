//
//  IPORolloverPresenter.swift
//  DemoIPORollver
//
//  Created by BUSSNQ TH on 22/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol IPORolloverPresentationLogic
{
  func presentSomething(response: IPORollover.Something.Response)
}

class IPORolloverPresenter: IPORolloverPresentationLogic
{
  weak var viewController: IPORolloverDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: IPORollover.Something.Response)
  {
    let data = response.ipoRolloverData
    let viewModel = IPORollover.Something.ViewModel(ipoRolloverData: data)
    viewController?.displaySomething(viewModel: viewModel)
  }
}
