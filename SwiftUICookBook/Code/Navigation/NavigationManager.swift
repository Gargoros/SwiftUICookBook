//
//  NavigationManager.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 5.03.24.
//


import SwiftUI

final class NavigationManager: ObservableObject{
    
    @Published var path = NavigationPath()
    
    func popToRoot(){
        path = .init()
    }
}
