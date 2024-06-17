//
//  Preview+SwiftIU.swift
//  Rick-Morty
//
//  Created by July Belova on 16.06.2024.
//


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct PreviewViewController: UIViewControllerRepresentable {
    private var viewController: UIViewController
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    func makeUIViewController(context: Context) -> UIViewController { viewController }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct PreviewView: UIViewRepresentable {
    private let view: UIView
    init(_ view: UIView) {
        self.view = view
    }
    func makeUIView(context: Context) -> UIView { view }
    func updateUIView(_ uiView: UIView, context: Context) {}
}
#endif