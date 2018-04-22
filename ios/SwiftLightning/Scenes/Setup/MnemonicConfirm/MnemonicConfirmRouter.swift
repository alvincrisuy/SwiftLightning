//
//  MnemonicConfirmRouter.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-04-19.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol MnemonicConfirmRoutingLogic {
  func routeToWalletMain()
  func routeToMnemonicDisplay()
}

protocol MnemonicConfirmDataPassing {
  var dataStore: MnemonicConfirmDataStore? { get }
}

class MnemonicConfirmRouter: NSObject, MnemonicConfirmRoutingLogic, MnemonicConfirmDataPassing {
  weak var viewController: MnemonicConfirmViewController?
  var dataStore: MnemonicConfirmDataStore?
  
  // MARK: Routing
  
  func routeToWalletMain() {
    let storyboard = UIStoryboard(name: "WalletMain", bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: "WalletMainViewController") as! WalletMainViewController
    var destinationDS = destinationVC.router!.dataStore!
    passDataToWalletMain(source: dataStore!, destination: &destinationDS)
    navigateToWalletMain(source: viewController!, destination: destinationVC)
  }
  
  func routeToMnemonicDisplay() {
    let storyboard = UIStoryboard(name: "MnemonicDisplay", bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: "MnemonicDisplayViewController") as! MnemonicDisplayViewController
    var destinationDS = destinationVC.router!.dataStore!
    passDataToMnemonicDisplay(source: dataStore!, destination: &destinationDS)
    navigateToMnemonicDisplay(source: viewController!, destination: destinationVC)
  }

  
  // MARK: Navigation
  
  func navigateToWalletMain(source: MnemonicConfirmViewController, destination: WalletMainViewController) {
    source.present(destination, animated: true, completion: nil)
  }
  
  func navigateToMnemonicDisplay(source: MnemonicConfirmViewController, destination: MnemonicDisplayViewController) {
    source.dismiss(animated: true, completion: nil)
  }
  
  
  // MARK: Passing data
  
  func passDataToWalletMain(source: MnemonicConfirmDataStore, destination: inout WalletMainDataStore) {
    // destination.name = source.name
  }
  
  func passDataToMnemonicDisplay(source: MnemonicConfirmDataStore, destination: inout MnemonicDisplayDataStore) {
    
  }
}
