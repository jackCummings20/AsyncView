//
//  AsyncLoadableObject.swift
//  AsyncView
//
//  Created by Jack Cummings on 7/11/22.
//

import Combine

public protocol AsyncLoadableObject: ObservableObject {
    
    associatedtype Output
    
    var state: AsyncLoadingState<Output> { get }
    func load() async
}
