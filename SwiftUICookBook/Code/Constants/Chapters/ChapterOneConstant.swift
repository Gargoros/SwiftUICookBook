//
//  ChapterOneConstant.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import Foundation

struct ChapterOneConstant {
    
    static let theStacksHowItWorks: String = """

In Xcode 15, a new iOS app project with SwiftUI selected as the interface option starts with a VStack that includes an Image view and a Text view located at the center of the screen. We replaced the content provided by the template with our own VStack, with three embedded Text views. SwiftUI container views like VStack determine how to display content by using the following steps:

    1. Figure out its internal spacing and subtract that from the size proposed by its parent view.
    2. Divide the remaining space into equal parts.
    3. Process the size of its least flexible view.
    4. Divide the remaining unclaimed space by the unallocated space, and then repeat Step 2.
    5. The stack then aligns its content and chooses its own size to exactly enclose its children.

Adding the Spacer() forces the view to use the maximum amount of vertical space. This is because the Spacer() is the most flexible view—it fills the remaining space after all other views have been displayed.

The Divider() component is used to draw a horizontal line across the width of its parent view. That is why adding a Divider() view stretched the VStack background from just around the Text views to the entire width of the VStack. By default, the divider line does not have a color. To set the divider color, we add the .background(.black) modifier. Modifiers are methods that can be applied to a view to return a new view. In other words, it applies changes to a view. Examples include .background(. black), .padding(), and .offset(...).

The HStack container is like the VStack but its contents are displayed horizontally from left to right. Adding a Spacer() in an HStack thus causes it to fill all available horizontal space, and a divider draws a vertical line between components in the HStack.

The ZStack is like HStack and VStack but overlays its content on top of existing items.

"""

    static let theStacksCode: String = """

struct TheStacks: View {
    var body: some View {
        VStack {
            Text("VStack, 1!")
            Text("VStack, 2!")
            Spacer()
            Divider()
                .background(.black)
            Text("VStack, 3!")
            HStack{
                Text("HStack Item 1")
                Divider()
                    .background(.black)
                Text("HStack Item 2")
                Divider()
                    .background(.black)
                Spacer()
                Text("HStack Item 3")
            }
            .background(.red)
            ZStack{
                Text("ZStack Item 3")
                    .padding()
                    .background(.green)
                    .opacity(0.8)
                Text("ZStack Item 3")
                    .padding()
                    .background(.green)
                    .opacity(0.8)
                    .offset(x: 80, y: -300)
            }
        }
        .background(.blue)
    }
}

"""
    static let formattedTextHowItWorks: String = """

Text views have several modifiers for font, spacing, and other formatting requirements. When in doubt, position the cursor on the line of code that includes the Text view, and press the Esc key to reveal a list of all available modifiers.

Unlike regular Text views, TextField and SecureField require state variables to store the value entered by the user. State variables are declared using the @State keyword. SwiftUI manages the storage of properties declared by using @State and refreshes the body each time the value of the state variable changes.

Values entered by the user are stored using the process of binding. In this recipe, we have state vari- ables bound to the SecureField and TextField input parameters. The $ symbol is used to bind a state variable to the field. Using the $ symbol ensures that the state variable’s value is changed to correspond to the value entered by the user.

Binding also notifies other views of state changes and causes the views to be redrawn on state change.

The wrapped value of bound state variables, which is the underlying value referenced by the state variable, is accessed without having to use the $ symbol. This is a convenience shortcut provided by Swift.

"""
    
    static let formattedTextCode: String = """

struct FormattedText: View {
    //MARK: - Variables
    @State private var password = "1234"
    @State private var someText = "initial text"
    
    //MARK: - Views
    var body: some View {
        
        VStack {
            
            SecureField("Enter a password", text: $password)
                .padding()
                .overlay{
                    Capsule().stroke()
                }
                .padding()
            Text("password entered: \\(password)")
                .italic()
                .fontWeight(.medium)
            TextField("Enter some text", text: $someText)
                .padding()
                .overlay{
                    Capsule().stroke()
                }
                .padding()
            Text(someText)
               .font(.largeTitle)
               .underline()
            
            Text("Changing text color and make it bold")
                .foregroundStyle(.blue)
                .fontWeight(.bold)
            Text("Use kerning to change space between characters in the text")
                .kerning(7)
            Text("Changing baseline offset")
                .baselineOffset(100)
            Text("Strikethrough")
                .strikethrough()
            Text("This is a multiline text implemented in SwiftUI. The trailing modifier was added to the text. This text also implements multiple modifiers")
                .background(.yellow)
                .multilineTextAlignment(.trailing)
                .lineSpacing(10.0)
        }
        
    }
}

"""
    
    static let usingImagesHowItWorks: String = """

Adding the Image view to SwiftUI displays the image in its original proportions. The image might be too small or too big for the device’s display.

To allow an image to shrink or enlarge to fit the device screen size, add the .resizable() modifier to the image. Adding the .resizable() modifier causes the image to fit within its view.

To address the issue, add the .aspectRatio(contentMode: .fit) modifier to the image.

To specify the width and height of an image, add the .frame(width, height) modifier to the view and set the width and height: .frame(width: 200, height: 200).
Images can be clipped to specific shapes. The .clipShape(Circle()) modifier changes the image shape to a circle.

The.overlay(Circle().stroke(Color.blue, lineWidth: 6))and.shadow(radius: 10)modifiers
were used to draw a blue line around the image circle and add a shadow to the circle.

The order in which the modifiers are added matters. Adding the .frame() modifier before the .resizable() or .aspectRatio() modifiers may lead to different results.

Note that if you set the project deployment target to iOS 14, the ImageResource struct works without issues since Apple made the struct available for older versions of iOS. This allows us to use the new APIs in older versions of iOS in case your app needs to support them.

"""
    
    static let usingImagesCode: String = """

struct UsingImages: View {
    var body: some View {
        ScrollView {
            VStack{
                Image("dogs1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("dog-and-nature")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300, height:200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 6))
                    .shadow(radius: 10)
                
                Image(uiImage: UIImage(resource: .dog2))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
        }
        .scrollIndicators(.hidden)
    }
}

"""
    
    static let buttonsHowItWorks: String = """

A NavigationLink must be placed in a NavigationStack or NavigationSplitView prior to being used.

In this recipe, we use a NavigationLink with two parameters—destination and label. The destination parameter represents the view that would be displayed when the label is clicked, while the label pa- rameter represents the text to be displayed within NavigationLink. Since our label is a simple Text view, we use the convenience initializer init(_:destination:) of NavigatioLink to keep our code more concise.

NavigationLink buttons can be used to move from one SwiftUI view to another—for example, moving from ContentView to EditButtonView. They can also be used to display text details without creating a SwiftUI view in a separate file, such as in the last NavigationLink, where a click just presents a long piece of text with more information. This is made possible because the Text struct conforms to the view protocol.

The .navigationTitle("Main View")) modifier adds a title to the ContentView screen.

The .navigationTitle() modifier is also added to EditButtonView and other views. Since these views do not contain NavigationStack structs, the titles would not be displayed when viewing the page directly from the preview, but would show up when running the code and navigating from ContentView.swift to the view provided in NavigationLink. To solve this, we use a NavigationStack in the PreviewProvider structs. To make the previews more useful, note how we have enclosed the view in a NavigationStack so we can see the title in the canvas preview window.

The EditButton view is used in conjunction with List views to make lists editable. We will go over List and Scroll views in Chapter 2, Displaying Scrollable Content with Lists and Scroll Views, but EditButtonView provides a peek into how to create an editable list.

The MenuButtonView uses the Menu struct, introduced in iOS 14, to display a floating menu of actions. Check out the Exploring more views and controls recipe at the end of this chapter for more information on Menu.

PasteButtons are only available on macOS. Refer to the See also section of this recipe for code on how the PasteButton is implemented.

In this recipe, we will learn how to implement pickers—namely, Picker, Toggle, Slider, Stepper, and DatePicker. Pickers are typically used to prompt the user to select from a set of mutually exclusive values. Toggle views are used to switch between on/off states. Slider views are used for selecting a value from a bounded linear range of values. As with Slider views, Stepper views also provide a UI for selecting from a range of values. However, steppers use the + and : signs to allow users to increment the desired value by a certain amount. Finally, DatePicker views are used for selecting dates.

"""
    
    static let buttonsCode: String = """

struct Buttons: View {
    var body: some View {
        NavigationStack {
            VStack{
                NavigationLink("Button"){
                    ButtonView()
                }
                NavigationLink("Edit Button"){
                    EditButton()
                }
                NavigationLink("Menu Button"){
                    MenuButton()
                }
                NavigationLink("Paste Button"){
                    PasteButton()
                }
                NavigationLink("Details about text"){
                    DetailsAboutTextView()
                        .navigationTitle(Text("Detail"))
                }
            }
            .navigationTitle(Text("Buttons"))
        }
    }
}

struct ButtonView: View {
    //MARK: - Variables
    @State var count: Int = 0
    
    //MARK: - Views
    var body: some View {
        VStack {
            Text("Welcome to your second view")
            Text("Current count value: \\(count)")
                .padding()
            Button(
                action: {
                    count += 1
                },
                label: {
                    Text("Tap to Increment count")
                        .padding()
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                })
        }
        .navigationTitle("Button View")
    }
}

struct EditButton: View {
    //MARK: - Variables
    @State private var animals: [String] = ["Cats", "Dogs", "Goats"]
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(animals, id: \\.self){ animal in
                Text(animal)
            }
            .onDelete(perform: removeAnimal)
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("EditButtonView")
    }
    func removeAnimal(at offsets: IndexSet){
        animals.remove(atOffsets: offsets)
    }
}

struct MenuButton: View {
    var body: some View {
        Menu(
            "Choose a country") {
                
                Button("Canada") {
                    print("Selected Canada")
                }
                Button("Mexico") {
                    print("Selected Mexico")
                }
                Button("USA") {
                    print("Selected USA")
                }
            }
            .navigationTitle("MenuButtons")
    }
}

struct PasteButton: View {
    //MARK: - Variables
    @State var text = String()
    
    //MARK: - Views
    var body: some View {
        
        VStack {
            Text("PasteButton controls how you paste in macOS but is not available in iOS. For more information, check the \"See also\" section of this recipe")
                .padding()
        }
        .navigationTitle("PasteButton")
            
    }
}

struct DetailsAboutTextView: View {
    var body: some View {
        
        Text("Very long text that should not be displayed in a single line because it is not good design")
            .padding()
    }
}

"""
    
    static let usingPickersHowItWorks: String = """

Form views group controls that are used for data entry, and Section views create hierarchical view content. Section views can be embedded inside a Form view to display information grouped together. The default presentation style for a Form with embedded Section views is to include a gray padding area between each section for visual grouping.

Picker views are used for selecting from a set of mutually exclusive values. In the following example, a segmented picker is used to select a transit mode from our transitModes state variable.

a Picker view takes two parameters, a string describing its function, and a state variable that holds the value selected. The state variable should be of the same type as the range of values to select from. In this case, the ForEach loop iterates through the transitModes array indices. The value selected would be an Int within the range of transitModes indices. The transit mode located in the selected index can then be displayed using Text("\\(transitModes[index])"). It is also worth noting that we need to apply a .segmented style to the picker using the .pickerStyle() modifier, to use the visual segmented style everyone is used to in iOS.

Toggle views are controls that switch between “on” and “off” states. The state variable for holding the toggle selection should be of the Bool type. The section with the Toggle view also contains some text. The @State property of the Toggle reflects the current state of the toggle.

Creating a slider requires three arguments:

    • value: The @State variable to bind the user input to
    • in: The range of the slider
    • step: By how much the slider should change when the user moves it

In the sample code, our slider moves can hold values between 0 and 10, with a step of 0.001. Steppers take three arguments too—a string for the label, value, and in. The value argument holds the
@State variable that binds the user input, and the in argument holds the range of values for the stepper.

In this recipe, we also demonstrate two applications of a date picker. The first from the top shows a date picker whose first argument is the label of DatePicker, and the second argument holds the state variable that binds the user input. Use it in situations where the user is allowed to pick any date without restriction. The other date picker contains a third parameter, in. This parameter represents the date range the user can select.

The @State variables need to be of the same type as the data to be stored. For example, the gameTime state variable is of the Date type.

Picker styles change based on its ancestor. The default appearance of a picker may be different when placed within a form or list instead of a VStack or some other container view. Styles can be overridden using the .pickerStyle() modifier.

"""
    
    static let usingPickersCode: String = """

struct UsingPickers: View {
    //MARK: - Variables
    @State private var choice = 0
    @State private var showText = false
    @State private var transitModes = ["Bike", "Car", "Bus"]
    @State private var sliderVal: Float = 0
    @State private var stepVal = 0
    @State private var gameTime = Date()
    
    //MARK: - Views
    var body: some View {
        Form{
            
            //MARK: - Picker
            Section{
                Picker("Transit Modes", selection: $choice){
                    ForEach(0..<transitModes.count, id: \\.self){ index in
                        Text(transitModes[index])
                    }
                }
                .pickerStyle(.segmented)
                Text("Current choice: \\(transitModes[choice])")
            }
            
            //MARK: - Toggle
            Section{
                Toggle(
                    isOn: $showText,
                    label: {
                        Text("Show Text")
                    })
                if showText {
                    Text("The Text toggle is on")
                }
            }
            
            //MARK: - Slider
            Section{
                Slider(value: $sliderVal, in: 0...10, step: 0.001)
                Text("Slider current value \\(sliderVal, specifier: "%.1f")")
            }
            
            //MARK: - Stepper
            Section{
                Stepper("Stepper", value: $stepVal, in: 0...5)
                Text("Stepper current value \\(stepVal)")
                
            }
            
            //MARK: - DatePicker
            Section{
                DatePicker("Please select a date", selection: $gameTime)
            }
            Section{
                DatePicker("Please select a date", selection: $gameTime, in: Date()...)
            }
        }
    }
}

"""
    
    static let usingViewModifiersHowItWorks: String = """

A view modifiercreatesanewviewbyalteringtheoriginalviewtowhichitisapplied.Wecreatea new view modifier by creating a struct that conforms to the ViewModifier protocol and apply our styles in the implementation of the required body function. You can make the ViewModifier customizable by requiring input parameters/properties that would be used when applying styles.

The bgColor property is used in our BackGroundStyle struct, which alters the background color of the content passed to the body function.

We have a functioning ViewModifier but decide to make it easier to use by creating a View extension and adding in a function that calls our struct.

We are thus able to use .backgroundStyle(color: Color) directly on our views instead of .modifie r(BackgroundStyle(bgColor:Color)).

"""
    
    static let usingViewModifiersCode: String = """

struct BackgroundStyle: ViewModifier {
    
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width * 0.3)
            .foregroundStyle(.black)
            .padding()
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

extension View {
    
    func backgroundStyle(color: Color) -> some View{
        self.modifier(BackgroundStyle(bgColor: color))
    }
}

struct UsingViewModifiers: View {
    var body: some View {
        VStack {
            Text("Perfect Text with modifier")
                .modifier(BackgroundStyle(bgColor: .blue))
            
            Text("Perfect text with extension")
                .backgroundStyle(color: .gray)
        }
        
        
    }
}

"""

    static let usingViewBuilderHowItWorks: String = """

We use the ViewBuilder struct to create a view template that can be used anywhere in the project without duplicating code. The ViewBuilder struct must contain a body property since it extends the View protocol.

Within the body property/view, we update the content property with the components we want to use in our custom view. In this case, we use a BlueCircle. Notice the location of the content property. This determines the location where the view passed to our ViewBuilder will be placed.

"""
    
    static let usingViewBuilderCode: String = """

struct BlueCircle<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
    
    var body: some View {
        HStack{
            content
            Spacer()
            Circle()
                .fill(.blue)
                .frame(width: 20, height: 20)
        }
        .padding()
        
    }
}

struct UsingViewBuilder: View {
    var body: some View {
        VStack{
            BlueCircle{
                Text("some text here")
                Rectangle()
                    .fill(.red)
                    .frame(width: 40, height: 40)
            }
            BlueCircle {
                Text("Another example")
            }
        }
    }
}

"""
    
    static let usingSFSymbolsHowItWorks: String = """

SF Symbols defines several design variants such as enclosed, fill, and slash. These different variants can be used to convey different information—for example, a slash variant on a Wi-Fi symbol lets the user know if the Wi-Fi is unavailable.

We also notice something new in our first HStack —the .foregroundStyle(...) modifier. The .foregroundStyle modifier can accept one, two, or three parameters corresponding to the primary, secondary, and tertiary colors. Some symbols may have all three levels of colors, or only primary and secondary, or primary and tertiary. For symbols without all three levels, only the ones that pertain to them are applied to the symbol. For example, a tertiary color applied to an SF Symbol with only primary and secondary levels will have no effect on the symbol.

The second HStack also uses the .symbolVariant modifier with one variant. It also introduces a new modifier, .symbolRenderingMode(). Rendering modes can be used to control how color is applied to symbols. The multicolor rendering mode renders symbols as multiple layers with their inherited styles. Adding the .multicolor rendering mode is enough to present a symbol with its default layer colors. Other rendering modes include hierarchical, monochrome, and palette.

Finally, we create another HStack with a segmented picker for a Wi-Fi system image where we change the appearance based on the status of the wifiSelection state variable. The picker reads the state variable and changes the wifi symbol appearance from a slashed symbol when “No Wifi” is selected to a variable color animated symbol when “Searching” is selected to a solid blue symbol when “Wifi On” is selected. Here, we used the new Symbols framework introduced in iOS 17, and the .symbolEffect view modifier to add an animation to a symbol. When we want to add animations to a symbol, the SF Symbols Mac app allows us to configure all the animations and preview the result. We can even export the animation configuration to add it in Xcode.

"""
    
    static let usingSFSymbolsCode: String = """

struct UsingSFSymbols: View {
    //MARK: - Variables
    @State var wifiSelection: Int = 0
    
    //MARK: - Views
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "c")
                Image(systemName: "o")
                Image(systemName: "o")
                Image(systemName: "k")
            }
            .symbolVariant(.fill.circle)
            .foregroundStyle(.yellow, .blue)
            .font(.title)
            
            HStack{
                Image(systemName: "b.circle.fill")
                Image(systemName: "o.circle.fill")
                    .foregroundStyle(.red)
                Image(systemName: "o.circle.fill")
                    .imageScale(.large)
                Image(systemName: "o.circle.fill")
                    .accessibility(identifier: "Letter K")
            }
            .foregroundStyle(.blue)
            .font(.title)
            .padding()
            
            HStack{
                Image(systemName: "allergens")
                Image(systemName: "ladybug")
            }
            .font(.largeTitle)
            .symbolVariant(.fill)
            .symbolRenderingMode(.multicolor)
            
            HStack{
                Picker("Pick One", selection: $wifiSelection){
                    Text("No Wifi").tag(0)
                    Text("Searching").tag(1)
                    Text("Wifi On").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 240)
                .padding(.horizontal)
                
                Group{
                    switch wifiSelection{
                    case 0:
                         Image(systemName: "wifi")
                            .symbolVariant(.slash)
                    case 1:
                        Image(systemName: "wifi")
                            .symbolEffect(.variableColor.iterative.reversing)
                    default:
                        Image(systemName: "wifi")
                            .foregroundStyle(.blue)
                    }
                }
                .foregroundStyle(.secondary)
                .font(.title)
            }
        }
        .padding()
    }
}

"""
    
    static let uIKitToSwiftUIHowItWorks: String = """

UIKit views can be implemented in SwiftUI by using the UIViewRepresentable protocol to wrap the UIKit views. In this recipe, we make use of a UIActivityIndicatorView by first wrapping it with a UIViewRepresentable.

In our ActivityIndicator.swift file, we implement a struct that conforms to the UIViewRepresentable protocol. This requires us to implement both the makeUIView and updateUIView functions. The makeUIView function creates and prepares the view, while the updateUIView function updates the UIView when the animation changes.

You can implement the preceding features in iOS 14+ apps by using SwiftUI’s ProgressView. The purpose of the recipe was to show how to integrate a UIKit view with SwiftUI.

"""
    
    static let uIKitToSwiftUICode: String = """

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

struct UIKitToSwiftUI: View {
    //MARK: - Variables
    @State private var animation: Bool = true
    
    //MARK: - Views
    var body: some View {
        VStack{
            ActivityIndicator(animation: animation)
            HStack{
                Toggle("Toggle Activity", isOn: $animation)
            }
            .padding()
        }
    }
}

"""
    
    static let addSwiftUIToUIKitHowItWorks: String = """

To host SwiftUI views in an existing app, you need to wrap the SwiftUI hierarchy in a ViewController or InterfaceController.

We start by performing core UIKit concepts, such as adding a Navigation View Controller to the sto- ryboard and adding a Hosting View Controller as a placeholder for our SwiftUI view.

Lastly, we create an IBSegueAction to present our SwiftUI view upon clicking the UIKit button.

"""
    
    static let addSwiftUIToUIKitCode: String = """

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func goToSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let greetings = "Hello From UIKit"
        let rootView = Greetings(textFromUIKit: greetings)
        return UIHostingController(coder: coder, rootView: rootView)
    }
}

struct Greetings: View {
    var textFromUIKit: String
    var body: some View {
        Text(textFromUIKit)
    }
}

"""
    
    static let moreViewsAndControlsHowItWorks: String = """

We’ve implemented multiple views in this recipe. Let’s look at each one and discuss how they work. Indeterminate ProgressView requires no parameters.

Determinate ProgressView components, on the other hand, require a value parameter that takes a state variable and displays the level of completion.

The total parameter in the ProgressView component is optional and defaults to 1.0 if not specified. Label views were mentioned earlier in the Simple graphics using SF Symbols recipe. Here, we introduce a second option for implementing labels where we customize the design of the label text and icon.

Let’s move on to the ColorPicker view. Color pickers let you display a palette for users to pick colors from. We create a two-way binding using the color state variable so that we can store the color selected by the user.

Link views are used to display clickable links.

Finally, the Menu view provides a convenient way of presenting a user with a list of actions to choose from and can also be nested.

You can add one or more buttons to a menu, each performing a specific action. Although menus can be nested, this should be done sparingly as too much nesting may decrease usability.
After learning the basics of SwiftUI, we concluded the chapter with this recipe, where we used several SwiftUI view components that we could incorporate into our apps.

"""
    
    static let moreViewsAndControlsCode: String = """

struct MoreViewsAndControls: View {
    //MARK: - Variables
    @State private var progress = 0.5
    @State private var color  = Color.red
    @State private var secondColor  = Color.yellow
    @State private var someText = "Initial value"
    
    //MARK: - Views
    var body: some View {
        List {
            Section("ProgressViews") {
                ProgressView("Indeterminate progress view")
                ProgressView("Downloading", value: progress, total: 2)
                
                Button("More") {
                    if(progress < 2){
                        progress += 0.5
                    }
                }
            }
            
            Section {
                Label("Slow ", systemImage: "tortoise.fill")
                Label(
                    title: {
                        Text("Fast")
                    },
                    icon: {
                        Circle()
                            .fill(.orange)
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay {
                                Text("F")
                            }
                        
                    }
                )
            } header: {
                Text("Labels")
            }
            
            Section {
                ColorPicker(selection: $color){
                    Text("Pick my background")
                        .padding()
                        .background(color)
                }
                ColorPicker("Picker", selection: $secondColor)
            } header: {
                Text("ColorPicker")
            }
            
            Section(header: Text("Link")) {
                Link("Packt Publishing", destination: URL(string:"https://www.packtpub.com/")!)}
            
            Section {
                TextEditor(text: $someText)
                
                Text("current editor text:\n\\(someText)")
            } header: {
                Text("Text Editor")
            }
            
            Section {
                Menu("Actions") {
                    Button("Set TextEditor text to 'magic'") {
                        someText = "magic"
                    }
                    Button("Turn first picker green") {
                        color = .green
                    }
                    Menu("Actions") {
                        Button("Set TextEditor text to 'real magic'") {
                            someText = "real magic"
                        }
                        Button("Turn first picker gray") {
                            color = .gray
                        }
                    }
                }
            } header: {
                Text("Menu")
            }

        }
        .listStyle(.grouped)
    }
}

"""
}
