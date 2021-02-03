//
//  HomepageViewController.swift
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
import FSPagerView
import Parchment
protocol HomepageDisplayLogic: class {
  func displaySomething(viewModel: Homepage.Something.ViewModel)
}

class HomepageViewController: UIViewController, HomepageDisplayLogic {

    let imageNames = ["1.jpg","2.jpg","4.jpg","5.jpg"]
    let transformerTypes: [FSPagerViewTransformerType] = [.crossFading,
                                                                      .zoomOut,
                                                                      .depth,
                                                                      .linear,
                                                                      .overlap,
                                                                      .ferrisWheel,
                                                                      .invertedFerrisWheel,
                                                                      .coverFlow,
                                                                      .cubic]
    var typeIndex = 0 {
        didSet {
            let type = self.transformerTypes[typeIndex]
            self.pagerView.transformer = FSPagerViewTransformer(type:type)
            switch type {
            case .crossFading, .zoomOut, .depth:
                self.pagerView.itemSize = FSPagerView.automaticSize
                self.pagerView.decelerationDistance = 1
            case .linear, .overlap:
                let transform = CGAffineTransform(scaleX: 0.6, y: 0.75)
                self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
                self.pagerView.decelerationDistance = FSPagerView.automaticDistance
            case .ferrisWheel, .invertedFerrisWheel:
                self.pagerView.itemSize = CGSize(width: 180, height: 140)
                self.pagerView.decelerationDistance = FSPagerView.automaticDistance
            case .coverFlow:
                self.pagerView.itemSize = CGSize(width: 220, height: 170)
                self.pagerView.decelerationDistance = FSPagerView.automaticDistance
            case .cubic:
                let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
                self.pagerView.decelerationDistance = 1
            }
        }
    }
    
    @IBOutlet weak var setViewSim: UIView!
    @IBOutlet weak var setViewTax: UIView!
    @IBOutlet weak var setViewRank: UIView!
    @IBOutlet weak var setViewProposal: UIView!
    @IBOutlet weak var setViewStatus: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.typeIndex = 0
        }
    }
    @IBOutlet weak var setViewPig: UIView!
    @IBOutlet weak var pageViewPanging: UIView!
    
    var dataimage = [UIImage(named: "011"),UIImage(named: "02"),UIImage(named: "03"),UIImage(named: "04")]
    var interactor: HomepageBusinessLogic?
  var router: (NSObjectProtocol & HomepageRoutingLogic & HomepageDataPassing)?

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
    let interactor = HomepageInteractor()
    let presenter = HomepagePresenter()
    let router = HomepageRouter()
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.pagerView.transformer = FSPagerViewTransformer(type: .linear)
    doSomething()
    self.setViewSim.clipsToBounds = true
    self.setViewSim.layer.cornerRadius = 20
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewSim.layer.shadowRadius = 70
    self.setViewSim.layer.masksToBounds = false
    
    self.setViewTax.clipsToBounds = true
    self.setViewTax.layer.cornerRadius = 20
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewTax.layer.shadowRadius = 70
    self.setViewTax.layer.masksToBounds = false
    
    self.setViewPig.clipsToBounds = true
    self.setViewPig.layer.cornerRadius = 20
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewPig.layer.shadowRadius = 70
    self.setViewPig.layer.masksToBounds = false
    
    self.setViewRank.clipsToBounds = true
    self.setViewRank.layer.cornerRadius = 20
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewRank.layer.shadowRadius = 70
    self.setViewRank.layer.masksToBounds = false

    self.setViewProposal.clipsToBounds = true
    self.setViewProposal.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewProposal.layer.shadowRadius = 10
    self.setViewProposal.layer.masksToBounds = false
    
    self.setViewStatus.clipsToBounds = true
    self.setViewStatus.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewStatus.layer.shadowRadius = 10
    self.setViewStatus.layer.masksToBounds = false
    //Pagging
  
    let rmf = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RMFViewController") as! RMFViewController
    let ssf  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SSFViewController") as! SSFViewController
    let gmf  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GMFViewController") as! GMFViewController
    let fif  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FIFViewController") as! FIFViewController
    
            let viewControllers = [
    
                rmf,
                ssf,
                gmf,
                fif
            ]
            
            let pagingViewController = PagingViewController(viewControllers: viewControllers)
            
            // Make sure you add the PagingViewController as a child view
            // controller and constrain it to the edges of the view.
            addChild(pagingViewController)
        self.pageViewPanging.addSubview(pagingViewController.view)
   
      //      view.constrainToEdges(pagingViewController.view)
             pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            pagingViewController.view.topAnchor.constraint(equalTo: self.pageViewPanging.topAnchor),
              pagingViewController.view.bottomAnchor.constraint(equalTo: self.pageViewPanging.bottomAnchor),
              pagingViewController.view.leadingAnchor.constraint(equalTo: self.pageViewPanging.leadingAnchor),
              pagingViewController.view.trailingAnchor.constraint(equalTo: self.pageViewPanging.trailingAnchor),
        ])
        
    }

  
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Homepage.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Homepage.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
extension HomepageViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
            return cell
    }
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
    pagerView.deselectItem(at: index, animated: true)
    pagerView.scrollToItem(at: index, animated: true)
    }

}
extension HomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortViewCell", for: indexPath) as! PortViewCell
        cell.imgView.image = self.dataimage[indexPath.row]
        return cell
    }
    
    
}
