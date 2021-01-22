//
//  IPORolloverViewController.swift
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
import SDWebImage
protocol IPORolloverDisplayLogic: class
{
  func displaySomething(viewModel: IPORollover.Something.ViewModel)
}

class IPORolloverViewController: UIViewController, IPORolloverDisplayLogic
{
    @IBOutlet weak var tableView: UITableView!
    var interactor: IPORolloverBusinessLogic?
    var router: (NSObjectProtocol & IPORolloverRoutingLogic & IPORolloverDataPassing)?
    var fundsipoRollover: [IPORolloverModel] = []
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
    let interactor = IPORolloverInteractor()
    let presenter = IPORolloverPresenter()
    let router = IPORolloverRouter()
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
    self.doSomething()
    self.tableView.reloadData()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = IPORollover.Something.Request()
    interactor?.doSomething(request: request)
    
  }
  
  func displaySomething(viewModel: IPORollover.Something.ViewModel) {
 
    self.fundsipoRollover = viewModel.ipoRolloverData
    tableView.reloadData()
    
  }
}
extension IPORolloverViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fundsipoRollover.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IPORolloverViewCell") as! IPORolloverViewCell
        cell.lbfundcode.text = self.fundsipoRollover[indexPath.row].fundcode
        cell.lbchnfname.text = self.fundsipoRollover[indexPath.row].chnfname
        cell.lbipoRollOver.text = self.fundsipoRollover[indexPath.row].ipoRollOver
        cell.lbOfferExpire.text = "\(self.fundsipoRollover[indexPath.row].ipoOfferDate2 ?? "") - \(self.fundsipoRollover[indexPath.row].ipoExpireDate2 ?? "")"
        let imageURL = self.fundsipoRollover[indexPath.row].lgpic!
        let url = URL(string: imageURL)
        cell.imgLgpic.sd_setImage(with: url,  placeholderImage: UIImage(named: "Image"))
        return cell
    }
    
    
}