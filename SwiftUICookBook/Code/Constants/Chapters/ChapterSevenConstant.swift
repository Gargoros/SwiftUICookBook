//
//  ChapterSevenConstant.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

struct ChapterSevenConstant {
    
    
    static let simpleNavigationHowItWorks = """

We use the NavigationStack to present a stack of views over a root view. We can add views to the stack by adding NavigationLink controls inside the NavigationStack. NavigationLink is an interactive control, and when the user taps on it, a new view is pushed onto the navigation stack. The view pushed onto the stack can be dismissed with platform-appropriate controls, like the back button in the leading edge of a navigation bar provided by default in iOS. The root view is the one that contains the NavigationStack, and it cannot be dismissed. In our example app, ContentView is the root view, containing a List of four NavigationLink instances. Each of these navigation links pushes a different view onto the stack. If NavigationLink is outside a NavigationStack, the link is disabled, so it appears grayed out and not interactive.

When a view is inside a navigation stack and we apply the navigationTitle(_:) view modifier to the view, the title is displayed in the navigation bar. In the simplest form of this modifier, we pass a string to be the title, but we can pass a binding or a custom view too. If we pass a binding, the navigation bar will have a button to edit the title. Try for yourself and see how it works on ChildAView. Note that this view modifier needs to be applied to the views inside a navigation stack and not to the navigation stack.

We also use the navigationBarTitleDisplayMode modifier to configure the appearance of the title in the navigation bar: large, inline, or automatic.

FirstView and SecondView are practically identical with the difference that in FirstView we use a VStack to enclose the two NavigationLink instances to ChildAView and ChildBView, and in SecondView, we use a List. See how SwiftUI gives a different appearance to the navigation links. Choose the approach that works best for your user experience.

ThirdView and FourthView control the appearance of the navigation bar using the toolbarBackground modifier.

ThirdView hides the back button of the navigation bar, using the navigationBarBackButtonHidden modifier, and adds a dismiss button to the navigation bar, using the toolbar(content:) modifier and providing a ToolBarItem with the topBarTrailing placement. To add views to a toolbar, we can either enclose each view in a ToolBarItem, as we did with the Button with the dismiss() action, or use a ToolBarItemGroup to enclose one or more views.

FourthView displays a SheetView as a sheet. In order to understand the inner workings of the sheet, you can refer to the recipe Presenting new views using sheets and full-screen covers in Chapter 6.

"""
    static let simpleNavigationCode = """

struct SimpleNavigation: View {
    var body: some View {
        
//MARK: - Embed to NavigationStack
        List{
            NavigationLink("Show First View") {
                NavigationFirstView()
            }
            NavigationLink("Show Second View") {
                NavigationSecondView()
            }
            NavigationLink("Show Third View") {
                NavigationThirdView()
            }
            NavigationLink("Show Fourth View") {
                NavigationFourthView()
            }
        }
        .navigationTitle("Top Level")
        .tint(.teal)
        
        
    }
}

struct ChildAView: View {
    //MARK: - Variables
    @State private var title = "Child A"
    
    //MARK: - Views
    var body: some View {
        VStack {
            
            Image(systemName: "a.square")
                .font(.system(size: 80))
                .foregroundStyle(.yellow)
            
            Text("This is the Child A View")
                .foregroundStyle(.primary)
                .padding()
            
            
        }
        .navigationTitle($title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChildBView: View {
    var body: some View {
        VStack {
            Image(systemName: "b.square")
                .font(.system(size: 80))
                .foregroundStyle(.brown)
            Text("This is the Child B View")
                .foregroundStyle(.primary)
            .padding()
        }
        .navigationTitle("Child B")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NavigationSheetView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: UIColor(red: 0, green: 0.9, blue: 1, alpha: 1))
                    .ignoresSafeArea()
                
                Text("Sheet with navigation bar")
            }
            .navigationTitle("Sheet title")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.teal, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct NavigationFourthView: View {
    //MARK: - Variables
    @State private var isSheetPresented = false
    
    //MARK: - Views
    var body: some View {
        ScrollView {
                    Image(systemName: "capsule")
                        .font(.system(size: 80))
                        .foregroundStyle(.red)
                        .padding(.vertical, 50)
                    Text("This is the Fourth View")
                        .foregroundStyle(.primary)
                        .padding()
                    Button("Show sheet") {
                        isSheetPresented = true
                    }.sheet(isPresented: $isSheetPresented) {
                        NavigationSheetView()
                            .presentationDetents([.fraction(0.75)])
                            .presentationDragIndicator(.visible)
                    }
                }
                .navigationTitle("Fourth")
                .toolbarBackground(.quaternary, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct NavigationFirstView: View {
    var body: some View {
        VStack {
            Image(systemName: "circle")
                .font(.system(size: 80))
                .foregroundStyle(.cyan)
            Text("This is the First View")
                .foregroundStyle(.primary)
                .padding()
            VStack(spacing: 20) {
                NavigationLink("Show Child A") {
                    ChildAView()
                }
                NavigationLink("Show Child B") {
                    ChildBView()
                }
            }
        }
        .padding()
        .navigationTitle("First")
    }
}

struct NavigationSecondView: View {
    var body: some View {
        VStack {
            Image(systemName: "square")
                .font(.system(size: 80))
                .foregroundStyle(.blue)
            Text("This is the Second View")
                .foregroundStyle(.primary)
                .padding()
            List {
                NavigationLink("Show Child A") {
                    ChildAView()
                }
                NavigationLink("Show Child B") {
                    ChildBView()
                }
            }
            .listStyle(.inset)
            .frame(height: 160)
        }
        .padding()
        .navigationTitle("Second")
    }
}

struct NavigationThirdView: View {
    //MARK: - Variables
    @Environment(\\.dismiss) private var dismiss
    
    //MARK: - Views
    var body: some View {
        ScrollView {
            Image(systemName: "triangle")
                .font(.system(size: 80))
                .foregroundStyle(.teal)
                .padding(.vertical, 50)
            Text("This is the Third View")
                .foregroundStyle(.primary)
                .padding()
        }
        .padding()
        .navigationTitle("Third")
        .navigationBarBackButtonHidden()
        .toolbar {
            Button("Dismiss") {
                dismiss()
            }
        }
        .toolbarBackground(.quaternary, for: .navigationBar)
    }
}

"""
    
    static let modernNavigationHowItWorks = """

In order to implement data-driven navigation, we need three things:
    1) an instance of a NavigationStack, which takes a binding to a collection of data that will represent the path or state of the navigation stack,
    2) instances of NavigationLink, which will add values to the path, and 3) the use of the navigationDestination(for:destination:) modifier to associate a value with a specific view, used as the destination of the navigation value.

In our app, ContentView is the root view of our navigation stack, and we define two properties that will be shared across all our views:

    @StateObject private var navigation = Navigation()
    @StateObject private var storage = Storage(food: Food.samples)

The storage property of type Storage is used to store all our food types and our recently viewed food.

The navigation property of type Navigation is used to store the state of our navigation stack. Since our app shows different types of food, the state of the navigation stack is defined by the data used to model a food type. In our case, we created the Food struct to define a food type, so an array of Food instances is a good choice to model our navigation path because it is an ordered collection of elements.

In Navigation, we define the property path to hold an array of food types that represent the navigation path:
    @Published var path: [Food] = .init()

In the path array, the order of the Food instances represents the order in which we viewed the food types. Since the navigation stack is driven by the data stored in the path variable, to go back to the previously viewed food, we could just drop the last element of the array, and the navigation stack will react to the change and pop to the previous view in the stack. To navigate to the root view, we could simply drop all the elements of the array or initialize the array to an empty array, and the navigation stack will pop to the root view.

We initialized our NavigationStack with a binding to the navigation path $navigation.path and, as the root view, a List view of all our food types. Our list is organized by food category, so we use the Section container view to include all the food in each category. Within the section, we use a ForEach to iterate through all the different food types in a category, and for each food, we create a NavigationLink, which uses the food instance as a value to add to the navigation path and a FoodRowView as the view for the entry in the list.

Finally, we use the navigationDestination(for:destination:) modifier to navigate, for values of type Food, to views of type FoodView, supplying navigation and storage as shared objects -> .navigationDestination(for: )

Our FoodView object is the detail view for the selected food. The navigation object is used to pop to the root view by calling the popToRoot() method, triggered by the navigation bar button with the list icon. The storage object is used to obtain the recently viewed food array and to add the current food to the list of recent once the view disappears.

"""
    static let modernNavigationCode = ""
//
//    static let HowItWorks = ""
//    static let Code = ""
//    
//    static let HowItWorks = ""
//    static let Code = ""
//    
//    static let HowItWorks = ""
//    static let Code = ""
//    
//    static let HowItWorks = ""
//    static let Code = ""
//    
//    static let HowItWorks = ""
//    static let Code = ""
//    
//    static let HowItWorks = ""
//    static let Code = ""
}
