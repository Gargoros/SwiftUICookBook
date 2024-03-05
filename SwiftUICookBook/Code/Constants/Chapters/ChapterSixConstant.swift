//
//  ChapterSixConstant.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

struct ChapterSixConstant {
    

    static let presentingAlertsHowItWorks = """

iOS 15 and later
We used the alert(_:isPresented:actions:message:) view modifier, which has four parameters: a title parameter for the title of the alert; an isPresented parameter that is a binding to a Boolean value that determines whether the alert is shown or hidden; and finally, two closures, action and message. The action parameter is a ViewBuilder that returns the alert’s actions, while the message parameter is a ViewBuilder for displaying the message in the alert.

iOS 13 and 14
Displaying alerts is a three-step process. First, we create a @State variable whose value is used to trigger the showing or hiding of the alert. Then, we add an .alert() modifier to the view we are modifying. And finally, we embed an Alert view inside the .alert() modifier.

In this recipe, the showSubmitAlert state variable is passed to the modifier’s isPresented argument. The alert gets displayed when showSubmitAlert is set to true. When the user clicks on the OK button in the Alert view, its value changes back to false, and the alert gets hidden once more.

We used an Alert view with three parameters: the alert title, a message, and a Button that dismissed the alert when clicked.

"""
    static let presentingAlertsCode = """

struct PresentingAlerts: View {
    //MARK: - Variables
    @State private var showSubmitAlert = false
    
    //MARK: - Views
    var body: some View {
        HStack(alignment: .top){
            Spacer()
            VStack{
                Text("iOS 15")
                Spacer()
                
                Button("Show Alert") {
                    showSubmitAlert = true
                }
                .alert("Confirm Actions", isPresented: $showSubmitAlert) {
                    Button("Ok") {}
                } message: {
                    Text("Are you sure you want to proceed?")
                }
                Spacer()
            }
            Spacer()
            Divider()
            Spacer()
            VStack{
                Text("iOS 13 or 14")
                Spacer()
                OldAlerts()
                Spacer()
            }
            Spacer()
        }
    }
}

struct OldAlerts: View {
    //MARK: - Variables
    @State private var showSubmitAlert = false
    
    //MARK: - Views
    var body: some View {
        Button (action: {
            self.showSubmitAlert = true
        }) {
            Text("Submit")
                .padding()
                .background(Color.blue)
                .foregroundStyle(Color.white)
                .clipShape(Capsule())
        }
        .alert(isPresented: $showSubmitAlert)  {
            Alert(
                title: Text("Confirm Action"),
                message: Text("Are you sure you want to submit the form"),
                dismissButton: .default(Text("Ok")))
        }
    }
}

"""
    
    static let alertsWithActionsHowItWorks = """

We explained how to use .alert() in the previous recipe. In this recipe, we introduced alerts with multiple buttons. A click on the Tap to Change Text button changes the value of the changeText variable to true, thereby triggering the display of the alert.

We defined an alert with two buttons, Yes and Do Nothing. Note that we assigned roles to the buttons and iOS takes care of displaying the button in the correct position and foreground color according to the role.

If we didn’t provide a button with the cancel role, SwiftUI would add a button with the Cancel title to the alert. Try for yourself; comment out or delete the line of code for the Do Nothing button, and you’ll get a standard Cancel button automatically.

"""
    static let alertsWithActionsCode = """

struct AlertsWithActions: View {
    //MARK: - Variables
    @State private var changeText = false
    @State private var displayedText = "Tap to Change Text"
    
    //MARK: - Views
    var body: some View {
        Button(displayedText) {
            changeText = true
        }
        .alert("Changing Text", isPresented: $changeText) {
            Button("Yes", role: .destructive){
                displayedText = if(displayedText == "Stay Foolish"){
                    "Stay Hungry"
                }
                else{
                    "Stay Foolish"
                }
            }
            
            Button("Do Nothing", role: .cancel) {}
        } message: {
            Text("Do you want to change the text?")
        }
    }
}

"""

    static let presentingConfirmationDialogsHowItWorks = """

In this recipe, we used a confirmation dialog with four parameters. The title parameter is a string that describes the title of the dialog. The isPresented parameter is a binding to a Boolean that determines whether to display or hide the dialog. The action parameter is a ViewBuilder that returns the dialog’s actions. Finally, the message parameter is also a ViewBuilder that returns the message to be displayed in the dialog.

We implement all the buttons for our dialog within the action parameter. Each button should have a title and an action. Since these are regular SwiftUI buttons, you can also add roles such as .destructive to have the system style them appropriately. If there is no button with the role .cancel, like in our code, SwiftUI adds a Cancel button automatically.

"""
    static let presentingConfirmationDialogsCode = """

struct PresentingConfirmationDialogs: View {
    //MARK: - Variables
    @State private var showDialog = false
    private var title  = "Confirmation Dialog"
    
    //MARK: - Views
    var body: some View {
        Button("Present Confirmation Dialog") {
            showDialog = true
        }
        .confirmationDialog(title, isPresented: $showDialog) {
            Button("Save") {
                print("Save action")
            }
            Button("Print") {
                print("Print action")
            }
            Button("Update", role: .destructive) {
                print("Update action")
            }
        } message: {
            Text("Use Confirmation Dialogs to present several actions")
        }
    }
}

"""

    static let presentingSheetsHowItWorks = """

Our ContentView is basically a VStack that includes four different buttons. The Try me! button, which prints text to the console, is used to show how a view can still be interactive when it is partially covered by another modal view like a sheet. Each of the other buttons is used to display a sheet in different ways, using the .sheet(isPresented:onDismiss:content:) view modifier, which displays a sheet modally. The content of the sheet is passed as a parameter in the trailing content closure, and the sheet is displayed depending on whether the value of the isPresented parameter is true or false. We can also use the optional onDismiss closure to trigger an action when the sheet is dismissed.

Our first modal view, SheetView, is simple; it includes a Color view and a Text view inside a ZStack.

The Color view is used to set the background color and extends to the whole screen thanks to the .ignoresSafeArea() modifier.

The second view, SheetWithNavBar, is presented modally as a sheet and as a full-screen cover. This view has a NavigationStack that includes a navigation bar with a title and a button on the trailing edge. The view has a property of type String with a default value, which is used in a Text view at the center of the content. This allows us to pass a String parameter when the view is instantiated. The button is used to dismiss the view using the dismiss environment variable of the DismissAction struct introduced in iOS 15. By calling the variable as a function with dismiss(), SwiftUI dismisses the view when presented modally.

Back to ContentView, the Show sheet with drag button displays SheetView modally and using the .presentationDragIndicator(_:) modifier displays a drag indicator at the top of the sheet.

The Show sheet with navigation bar button displays SheetWithNavBar modally with the optional onDismiss closure to print a message to the console once the sheet is dismissed. We apply two modifiers to the sheet. The .presentationDetents(_:) modifier sets two detents, medium and large, which allows the user to choose the height of the sheet by dragging the top of the sheet or touching the drag indicator. The drag indicator is automatically displayed when the sheet uses more than one detent. The second modifier, .presentationBackgroundInteraction(_:), controls whether the user can interact with a view behind the modal sheet. We set the interaction to enabled so that when the sheet is displayed, the user can interact with the Try me! button in the parent view.

Finally, the Show full screen cover button displays a SheetWithNavBar modally using the .fullScreenCover(isPresented:onDismiss:content:) modifier, which displays the sheet covering as much of the screen as possible.

"""
    static let presentingSheetsCode = """

struct SheetView: View {
    //MARK: - Variables
    
    //MARK: - Views
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            Text("This is the sheet we want to display")
        }
    }
}

struct SheetWithNavBar: View {
    //MARK: - Variables
    @Environment(\\.dismiss) private var dismiss
    var text: String = "Sheet with navigation bar"
    
    //MARK: - Views
    var body: some View {
        NavigationStack{
            ZStack {
                Color(uiColor: UIColor(white: 0.9, alpha: 1.0))
                    .ignoresSafeArea()
                Text(text)
            }
            .navigationTitle(Text("Sheet title"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Dismiss") {
                    dismiss()
                }
            }
            .toolbarBackground(.gray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        .tint(.white)
    }
}

struct PresentingSheets: View {
    //MARK: - Variables
    @State private var isSheetPresented = false
    @State private var isSheetWithNavPresented = false
    @State private var isFullScreenCoverPresented = false
    
    //MARK: - Views
    var body: some View {
        VStack(spacing: 20){
            
            Button("Try me!") {
                print("Try me!")
            }.padding(.bottom, 200)
            
            Button("Show sheet with drag") {
                isSheetPresented = true
            }
            .sheet(isPresented: $isSheetPresented)  {
                SheetView()
                    .presentationDragIndicator(.visible)
            }
            
            Button("Show sheet with navigation bar") {
                isSheetWithNavPresented = true
            }
            .sheet(isPresented: $isSheetWithNavPresented) {
                print("Sheet dismissed")
            } content: {
                SheetWithNavBar(text: "Sheet with navigation bar and presentation detents")
                    .presentationDetents([.medium, .large])
                    .presentationBackgroundInteraction(.enabled)
            }
            
            Button("Show full screen cover"){
                isFullScreenCoverPresented = true
            }
            .fullScreenCover(isPresented: $isFullScreenCoverPresented) {
                SheetWithNavBar(text: "Full screen cover with navigation bar")
                
            }
        }
    }
}

"""

    static let displayingPopoversHowItWorks = """

A popover is very similar to a sheet and full-screen cover because it presents a view modally. The .popover() modifier takes four possible arguments, although only two were used here. Possible arguments are isPresented, attachmentAnchor, arrowEdge, and content.

The isPresented argument takes a binding to the showPopover variable that is used to trigger the display of the popover.

We did not use an attachmentAnchor in this recipe. An attachedAnchor is a positioning anchor that defines where the popover is attached.

The arrowEdge argument represents where the popover arrow should be displayed. It takes four possible values: .bottom, .top, .leading, and .trailing. This argument is only used in macOS, and if used in iOS, it gets ignored and has no effect.

The content argument is a closure that returns the content of the popover. In this recipe, a Text view was used as content, but we could also use a separate SwiftUI view in the content closure, such as an image or a view from another SwiftUI view file, as we did for the recipe about sheets.

Popovers are only displayed in a regular-size class, such as the iPad in full-screen mode. In a compact view, such as the iPhone or the iPad in slide over or split view modes, SwiftUI displays the content as a sheet.

"""
    static let displayingPopoversCode = """

struct DisplayingPopovers: View {
    //MARK: - Variables
    @State private var showPopover = false
    
    //MARK: - Views
    var body: some View {
        Button("Show popover"){
            showPopover = true
        }
        .font(.system(size: 40))
        .popover(isPresented: $showPopover) {
            Text("Popover content displayed here")
                .font(.system(size: 20))
                .padding()
        }
    }
}

"""

    static let displayingContextMenusHowItWorks = """

The .contextMenu(menuItems:) modifier can be attached to any view. In this recipe, we attached it to an Image view such that a touch-and-hold gesture on the image view displays the context menu. The .contextMenu() modifier contains buttons whose action closures perform a particular function. In our case, each Button changes our @State bulbColor variable to a new color, thereby updating our image view.

"""
    static let displayingContextMenusCode = """

struct DisplayingContextMenus: View {
    //MARK: - Variables
    @State private var bulbColor = Color.red
    
    //MARK: - Views
    var body: some View {
        Image(systemName: "lightbulb.fill")
            .font(.system(size: 60))
            .foregroundStyle(bulbColor)
            .contextMenu{
                
                Button("Yellow Bulb") {
                    bulbColor = .yellow
                }
                
                Button("Blue Bulb") {
                    bulbColor = .blue
                }
                
                Button("Green Bulb") {
                    bulbColor = .green
                }
            }
    }
}

"""
    
    
}
