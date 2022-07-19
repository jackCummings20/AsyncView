//
//  AsyncResultView.swift
//  AsyncView
//
//  Created by Jack Cummings on 6/29/22.
//

import SwiftUI

public struct AsyncResultView<Source: AsyncLoadableObject, EmptyView: View, ErrorView: View, ContentView: View>: View {    
    
    @ObservedObject public var source: Source
    
    public var emptyView: () -> EmptyView
    public var errorView: (Error) -> ErrorView
    public var contentView: (Source.Output) -> ContentView
    
    public init(source: Source, emptyView: @escaping () -> EmptyView, errorView: @escaping (Error) -> ErrorView, contentView: @escaping (Source.Output) -> ContentView) {
        self.source = source
        self.emptyView = emptyView
        self.errorView = errorView
        self.contentView = contentView
    }
    
    public var body: some View {
        switch source.state {
        case .initial:
            ProgressView()
                .task {
                    self.load()
                }
        case .empty:
            emptyView()
        case .failure(let error):
            errorView(error)
        case .success(let success):
            contentView(success)
            #if os(iOS)
                .refreshable {
                    self.load()
                }
            #endif
        }
    }
    
    // MARK: Functions
    private func load() {
        Task {
            await source.load()
        }
    }
}
