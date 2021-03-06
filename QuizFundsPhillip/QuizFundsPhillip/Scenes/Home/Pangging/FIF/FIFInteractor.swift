//
//  FIFInteractor.swift
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

protocol FIFBusinessLogic
{
  func doSomething(request: FIF.Something.Request)
}

protocol FIFDataStore
{
  //var name: String { get set }
}

class FIFInteractor: FIFBusinessLogic, FIFDataStore
{
  var presenter: FIFPresentationLogic?
  var worker: FIFWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: FIF.Something.Request)
  {
    worker = FIFWorker()
    worker?.doSomeWork()
    
    let response = FIF.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
