//
//  RecipeTabView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import SwiftUI

struct RecipeTabView: View {
	//MARK: - Variables
	@EnvironmentObject var navigation: NavigationManager
	let recipe: SwiftUIRecipe
	//@State var selectedTab = 0
	
	//MARK: - Views
	var body: some View {
		ZStack(alignment: .bottom){
			TabView(/*selection: $selectedTab*/) {
				
				RecipeTextView(howItWorksText: recipe.recipeHowItWorks)
				.tabItem {
					Label("Doc", systemImage: "doc.plaintext")
				}
				//.tag(0)
				
				
				RecipeCodeView(codeText: recipe.recipeCode)
					.padding()
				.tabItem {
					Label("Code", systemImage: "text.alignright")
				}
				//.tag(1)
				
				NavigationLink{
					recipe.view
				} label: {
					RunLabelView()
				}
				.tabItem {
					Label("Preview", systemImage: "iphone.gen2")
				}
				//.tag(2)
			}
			.toolbar {
				Button {
					navigation.popToRoot()
				} label: {
					Image(systemName: "house")
				}

			}
			.tint(Color.red)
		}
	}
}

#Preview {
	RecipeTabView(recipe: SwiftUIRecipe.chapter1[0])
		.environmentObject(NavigationManager())
}
