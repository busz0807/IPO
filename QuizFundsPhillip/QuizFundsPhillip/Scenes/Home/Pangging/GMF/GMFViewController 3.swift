//
//  GMFViewController.swift
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

protocol GMFDisplayLogic: class
{
  func displaySomething(viewModel: GMF.Something.ViewModel)
}

class GMFViewController: UIViewController, GMFDisplayLogic
{
    var name = [["Name": "1AMSET50-RA"],["Name": "K-CASH"],["Name": "SCBSET50"]]
    var number = [["Number": "57.2081"],["Number": "13.2158"],["Number": "18.8806"]]
    var double = [["Double": "-0.35%"],["Double": "+0.02%"],["Double": "+1.30%"]]
    var funds = [["Fund": "กองทุนเปิด วรรณเอเอ็มเซ็ท 50 ชนิดไม่จ่ายเงินปันผลสำหรับผู้ลงทุน"],["Fund": "กองทุนเปิดเค บริหารเงิน"],["Fund": "กองทุนเปิดไทยพาณิชย์ SET50 INDEX"]],
      datesss =  [["Dates": "12/01/2564"],["Dates": "12/01/2564"],["Dates": "12/01/2564"]]
    var months =  [["Month": "1เดือน"],["Month": "1เดือน"],["Month": "1เดือน"]]

  var interactor: GMFBusinessLogic?
  var router: (NSObjectProtocol & GMFRoutingLogic & GMFDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = GMFInteractor()
    let presenter = GMFPresenter()
    let router = GMFRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = GMF.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: GMF.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
extension GMFViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GMFViewCell") as! GMFViewCell
        cell.data = name[indexPath.row]
        cell.dates = datesss[indexPath.row]
        cell.doubles = double[indexPath.row]
        cell.funds = funds[indexPath.row]
        cell.numbers = number[indexPath.row]
        cell.months = months[indexPath.row]
        return cell
    }
    
    
}

