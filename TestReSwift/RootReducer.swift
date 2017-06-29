//
//  RootReducer.swift
//  TestReSwift
//
//  Created by Raoul Rodriguez on 6/28/17.
//  Copyright © 2017 Raoul Rodriguez. All rights reserved.
//

import Foundation
import ReSwift

struct RootReducer {
    static func handleAction(action: Action, state: AppState?) -> AppState {
        // Reduce the state tree
        return AppState(
            textInputState: TextInputReducer.handleAction(action: action, state: state?.textInputState)
        )
    }
}

//protocol Reducible {
//    static func handleAction(action: Action, state: AppState?) -> AppState
//}

