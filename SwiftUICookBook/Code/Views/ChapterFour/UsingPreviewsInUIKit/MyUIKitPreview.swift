//
//  MyUIKitPreview.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import SwiftUI

struct MyUIKitPreview: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("If you love the ease with which you can preview UI changes, but you are still working on UIKit projects, rest easy, as you can also use the canvas preview feature while building UIKit apps. With Xcode 15, the preview macros work with UIKit out of the box. Under the hood, Xcode adds the boilerplate code to wrap UIKit views and view controllers in SwiftUI views, so they can be previewed in the canvas. In this recipe, we will learn how to preview a UIViewController and a UIView on the Xcode canvas.")
                
                Text(StringConstants.gettingReady)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Since this book is about SwiftUI and we are going to add previews to a UIKit app, we have already provided the UIKit app as a starter project, so you can focus on the preview functionality. It is very important that you clone or download the code for this chapter from GitHub, as explained in the Technical requirements section.")
                
                Text(StringConstants.howToDoIt)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("""
We will use the UIkit app provided and then add a couple of preview macros. The steps are as follows:
    1. Go to this chapter’s code in GitHub. For this recipe, open the Xcode project located in the Starter folder.
    2. Click on the UIKitPreviews project file in the Xcode navigation pane, select Build Settings, scroll down to the Deployment section, and make sure iOS Deployment Target has a value of iOS 17 or higher.
    3. Run the app on your simulator of choice to get familiarized with it. You’ll see it is a simple app with a main view and a button, which, when tapped, pushes another view on a navigation stack. Clicking on the back button on the navigation bar of the detail view takes us back to the main view.
    4. Open the Main storyboard to see the UI for the whole app.
    5. Open the ViewController.swift file. You’ll see that there is not much code there because all the UI elements are defined in the storyboard.
    6. Now, let’s take steps that will allow us to preview the app using the preview macros and the Xcode canvas. Let’s add this code at the end of the ViewController file:
    
    #Preview {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        return vc
    }

    7. You’ll see that as soon as you add the #Preview macro, the Xcode canvas appears. If everything went well.
    8. Let’s add this other code to the end of the ViewController file, showing you how to preview a UILabel:
    
    #Preview("UILabel") {
        let label = UILabel()
        label.text = "Previewing a UILabel"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }

    9. Go to the canvas preview and click on the UILabel button at the top.

    To see the power of the live previews for UIKit, change the title of the label to a different text or change the font, and then you’ll see how the preview updates with the changes. The preview code can be found in the ViewController.swift file located in the Complete folder of this recipe.

""")
            }
            .padding()
        }
    }
}

#Preview {
    MyUIKitPreview()
}
