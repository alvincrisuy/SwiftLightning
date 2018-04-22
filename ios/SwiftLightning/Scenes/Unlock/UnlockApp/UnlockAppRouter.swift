//
//  UnlockAppRouter.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-04-20.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol UnlockAppRoutingLogic
{
  func routeToWalletMain()
}

protocol UnlockAppDataPassing
{
  var dataStore: UnlockAppDataStore? { get }
}

class UnlockAppRouter: NSObject, UnlockAppRoutingLogic, UnlockAppDataPassing
{
  weak var viewController: UnlockAppViewController?
  var dataStore: UnlockAppDataStore?
  
  
  // MARK: Routing
  
  func routeToWalletMain() {
    let storyboard = UIStoryboard(name: "WalletMain", bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: "WalletMainViewController") as! WalletMainViewController
    var destinationDS = destinationVC.router!.dataStore!
    passDataToWalletMain(source: dataStore!, destination: &destinationDS)
    navigateToWalletMain(source: viewController!, destination: destinationVC)
  }
  
  
  // MARK: Navigation
  
  func navigateToWalletMain(source: UnlockAppViewController, destination: WalletMainViewController) {
    source.present(destination, animated: true, completion: nil)
  }
  
  
  // MARK: Passing data
  
  func passDataToWalletMain(source: UnlockAppDataStore, destination: inout WalletMainDataStore) {
    // destination.name = source.name
  }
}
