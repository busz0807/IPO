//
//  MorePresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 28/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MorePresentationLogic {
  func presentSomething(response: More.FetchAnalystReportDataStore.Response)
    
}

class MorePresenter: MorePresentationLogic {
  weak var viewController: MoreDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: More.FetchAnalystReportDataStore.Response) {
    let viewModel = More.FetchAnalystReportDataStore.ViewModel(analystReportData: response.analystReportData, error: response.error)
    viewController?.displayAnalystReport(viewModel: viewModel)
  }
}