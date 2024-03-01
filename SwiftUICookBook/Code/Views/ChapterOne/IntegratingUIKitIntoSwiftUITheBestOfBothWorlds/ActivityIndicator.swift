//
//  ActivityIndicator.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    
    var animation: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView{
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if animation{
            activityIndicator.startAnimating()
        }
        else{
            activityIndicator.stopAnimating()
        }
    }
}
