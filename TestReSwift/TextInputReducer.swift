//
//  Reducers.swift
//  TestReSwift
//
//  Created by Raoul Rodriguez on 6/28/17.
//  Copyright © 2017 Raoul Rodriguez. All rights reserved.
//

import ReSwift

class TextInputReducer {
    
    static func handleAction(action: Action, state: TextInputState?) -> TextInputState {
        
        let state = state ?? TextInputState(text: "")
        
        // Don't do anything if the action is inappropriate
        guard let action = action as? TextInputAction else {
            return state
        }
        
        switch action {
        case .clear:
            return TextInputState(text: "")
        case .update(str: let str):
            return TextInputState(text: str)
        }
    }
}
