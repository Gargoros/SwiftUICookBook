//
//  ChapterExtension.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 27.02.24.
//

import Foundation

extension Chapter {
    static let bookChapters: [Chapter] = [
        Chapter(
            chapterNumber: 1,
            chapterName: "Using the Basic SwiftUI Views and Controls",
            recipe: SwiftUIRecipe.chapter1
        ),
        Chapter(
            chapterNumber: 2,
            chapterName: "Displaying Scrollable Content with Lists and Scroll Views",
            recipe: SwiftUIRecipe.chapter2),
        Chapter(
            chapterNumber: 3,
            chapterName: "Exploring Advanced Components",
            recipe: SwiftUIRecipe.chapter3),
        Chapter(
            chapterNumber: 4,
            chapterName: "Viewing while Building with SwiftUI Preview in Xcode 15",
            recipe: SwiftUIRecipe.chapter4),
        Chapter(
            chapterNumber: 5,
            chapterName: "Creating New Components and Grouping Views with Container Views",
            recipe: SwiftUIRecipe.chapter5),
        Chapter(
            chapterNumber: 6,
            chapterName: "Presenting Views Modally",
            recipe: SwiftUIRecipe.chapter6),
        Chapter(
            chapterNumber: 7,
            chapterName: "Navigation Containers",
            recipe: SwiftUIRecipe.chapter7),
//        Chapter(
//            chapterNumber: 8,
//            chapterName: "Drawing with SwiftUI",
//            recipe: [
//                "Using SwiftUI’s built-in shapes",
//                "Drawing a custom shape",
//                "Drawing a curved custom shape",
//                "Drawing using the Canvas API",
//                "Implementing a progress ring",
//                "Implementing a Tic-Tac-Toe game in SwiftUI",
//                "Rendering a gradient view in SwiftUI"
//            ]),
//        Chapter(
//            chapterNumber: 9,
//            chapterName: "Animating with SwiftUI",
//            recipe: [
//                "Creating basic animations",
//                "Transforming shapes",
//                "Creating a banner with a spring animation",
//                "Applying a delay to an animation view modifier to create a sequence of animations",
//                "Applying a delay to a withAnimation function to create a sequence of animations",
//                "Applying multiple animations to a view",
//                "Chained animations with PhaseAnimator",
//                "Custom animations with KeyframeAnimator",
//                "Creating custom view transitions",
//                "Creating a hero view transition with .matchedGeometryEffect",
//                "Implementing a stretchable header in SwiftUI",
//                "Implementing a swipeable stack of cards in SwiftUI"
//            ]),
//        Chapter(
//            chapterNumber: 10,
//            chapterName: "Driving SwiftUI with Data",
//            recipe: [
//                "Using @State to drive a view’s behavior",
//                "Using @Binding to pass a state variable to child views",
//                "Implementing a CoreLocation wrapper as@ObservedObject",
//                "Using @StateObject to preserve the model’s life cycle",
//                "Sharing state objects with multiple Views using@EnvironmentObject",
//                "Using Observation to manage model data"
//            ]),
//        Chapter(
//            chapterNumber: 11,
//            chapterName: "Driving SwiftUI with Combine",
//            recipe: [
//                "Introducing Combine in a SwiftUI project",
//                "Managing the memory in Combine to build a timer app",
//                "Validating a form using Combine",
//                "Fetching remote data using Combine and visualizing it in SwiftUI",
//                "Debugging an app based on Combine",
//                "Unit testing an app based on Combine"
//            ]),
//        Chapter(
//            chapterNumber: 12,
//            chapterName: "SwiftUI Concurrency with async await",
//            recipe: [
//                "Integrating SwiftUI and an async function",
//                "Fetching remote data in SwiftUI",
//                "Pulling and refreshing data asynchronously in SwiftUI",
//                "Converting a completion block function to async await",
//                "Implementing infinite scrolling with async await"
//            ]),
//        Chapter(
//            chapterNumber: 13,
//            chapterName: "Handling Authentication and Firebase with SwiftUI",
//            recipe: [
//                "Implementing Sign in with Apple in a SwiftUI app",
//                "Integrating Firebase into a SwiftUI project",
//                "Using Firebase to sign in users with Google Sign-In",
//                "Implementing a Notes app with Firebase and SwiftUI"
//            ]),
//        Chapter(
//            chapterNumber: 14,
//            chapterName: "Persistence in SwiftUI with Core Data and SwiftData",
//            recipe: [
//                "Integrating Core Data with SwiftUI",
//                "Showing Core Data objects with @FetchRequest",
//                "Adding Core Data objects from a SwiftUI view",
//                "Filtering Core Data requests using a Predicate",
//                "Deleting Core Data objects from a SwiftUI view",
//                "Presenting data in a sectioned list with@SectionedFetchRequest",
//                "Getting started with SwiftData"
//            ]),
//        Chapter(
//            chapterNumber: 15,
//            chapterName: "Data Visualization with Swift Charts",
//            recipe: [
//                "Understanding the basics of Swift Charts",
//                "Customizing charts: axes, annotations, and rules",
//                "Different types of charts: marks and mark configuration",
//                "Histograms with data bins",
//                "Pie charts and donut charts",
//                "Interactive charts: selection",
//                "Interactive charts: scrollable content"
//                
//            ]),
//        Chapter(
//            chapterNumber: 16,
//            chapterName: "Creating Multiplatform Apps with SwiftUI",
//            recipe: [
//                "Creating an iOS app in SwiftUI",
//                "Creating the macOS version of the app with a new target",
//                "Creating a multiplatform version of the app sharing the same target",
//                "Creating the watchOS version of the iOS app"
//            ]),
//        Chapter(
//            chapterNumber: 17,
//            chapterName: "SwiftUI Tips and Tricks",
//            recipe: [
//                "Using XCTest to test SwiftUI apps",
//                "Using custom fonts in SwiftUI",
//                "Showing a PDF in SwiftUI",
//                "Implementing a Markdown editor with preview functionality"
//            ])
        
    ]
}
