//
//  AsyncLoadingState.swift
//  AsyncView
//
//  Created by Jack Cummings on 7/11/22.
//

import Foundation

public enum AsyncLoadingState<Output> {
    case initial
    case empty
    case failure(Error)
    case success(Output)
}
