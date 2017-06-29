//
//  LoggingMiddleware.swift
//  TestReSwift
//
//  Created by Raoul Rodriguez on 6/28/17.
//  Copyright © 2017 Raoul Rodriguez. All rights reserved.
//

import Foundation
import ReSwift

let loggingMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            print("> \(action)")
            return next(action)
        }
    }
}
