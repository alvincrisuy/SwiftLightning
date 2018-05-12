//
//  LNDDebugLevelPresenter.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-05-11.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LNDDebugLevelPresentationLogic
{
  func presentFetchSubsystems(response: LNDDebugLevel.FetchSubsystems.Response)
  func presentChangeDebugLevel(response: LNDDebugLevel.ChangeDebugLevel.Response)
}

class LNDDebugLevelPresenter: LNDDebugLevelPresentationLogic
{
  weak var viewController: LNDDebugLevelDisplayLogic?
  
  // MARK: Fetch Subsystems
  
  func presentFetchSubsystems(response: LNDDebugLevel.FetchSubsystems.Response)
  {
    switch response.result {
    case .success(let subsystems):
      let viewModel = LNDDebugLevel.FetchSubsystems.ViewModel(subsystems: subsystems)
      viewController?.updateFetchSubsystems(viewModel: viewModel)
      
    case .failure(let error):
      let viewModel = LNDDebugLevel.ErrorVM(errTitle: "Debug Error",
                                            errMsg: error.localizedDescription)
      viewController?.displayError(viewModel: viewModel)
    }
  }
  
  
  // MARK: Change Debug Level
  
  func presentChangeDebugLevel(response: LNDDebugLevel.ChangeDebugLevel.Response) {
    switch response.result {
    case .success(()):
      let viewModel = LNDDebugLevel.ChangeDebugLevel.ViewModel(title: "Debug Level Changed",
                                                               msg: "LND debug levels have changed & lnd.conf have been updated")
      viewController?.displayChangedDebugLevel(viewModel: viewModel)
    case .failure(let error):
      let viewModel = LNDDebugLevel.ErrorVM(errTitle: "Change Error",
                                            errMsg: error.localizedDescription)
      viewController?.displayError(viewModel: viewModel)
    }
  }
}
