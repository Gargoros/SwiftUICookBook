//
//  ChapterFourConstant.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

struct ChapterFourConstant {
    
    static let canvasPreviewHowItWorks = """
This recipe is all about using the canvas preview in Xcode to increase our productivity, as already explained in the previous section. However, a couple of code snippets are worth mentioning.

To make our UI react to color scheme changes, we added a deviceColorScheme variable, which is tied to the colorScheme environment value managed by SwiftUI. We can use a conditional statement to display a different view, depending on the color scheme of the device. In our case, we used two different PostView instances, created by passing different parameters to the initialize.

Like the colorScheme environment variable, we have the dynamicTypeSize environment variable, which allows us to know which size was selected by the user, giving us the ability to modify our UI programmatically, as we did for the color scheme.

To detect the orientation of the device and use a conditional statement to display different views, we used a GeometryReader in PostView. The initializer of the GeometryReader uses a closure with a GeometryProxy as an input parameter. The GeometryProxy allows us to access the size and coordinate space of the PostView view. If the height of the view is greater than the width, we can infer that the view is showing in portrait orientation. Our PostView is basically a custom view with three embedded views, two Text instances, and one Image instance. We use a VStack to group the two Text instances. In portrait orientation, we use another VStack to arrange the image vertically on top of the VStack with the two Text instances. In landscape orientation, we use an HStack to group the Image view on the side of the VStack with the two Text instances.

"""
    static let canvasPreviewCode = """

struct PostView: View {
    //MARK: - Variables
    var title: String
    var text: String
    var imageName: String
    
    //MARK: - Views
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                // View for portrait orientation
                if geometry.size.height > geometry.size.width {
                    VStack{
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.75)
                        VStack (alignment: .leading){
                            Text(text)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                        
                    }
                    .padding()
                }
                else {
                    HStack (alignment: .top, spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.55)
                        VStack (alignment: .leading){
                            Text(text)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}



"""
    
    static let previewingInNavigationStackHowItWorks = """

Views containing a .navigationTitle() modifier but no NavigationStack are meant to be displayed as part of a navigation stack. Enclosing the preview of such views in a NavigationStack component provides a quick way of accurately previewing the intended UI.

Using a NavigationStack in the #Preview macro allows us to visualize updates to views that are part of a navigation stack, without first running the app. This approach can be generalized to other types of container views. For example, if we have an app that displays a list of custom views representing elements in a collection, we might want to embed the preview for the custom view in a list to reflect our use case more accurately.

"""
    static let previewingInNavigationStackCode = """

struct SecondView: View {
    //MARK: - Variables
    var someText: String
    
    //MARK: - Views
    var body: some View {
        Text(someText)
                    .navigationTitle("Second View")
                    .navigationBarTitleDisplayMode(.inline)
    }
}

struct PreviewingInNavigationStack: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                SecondView(someText: "Text passed from ContentView")
            } label: {
                Text("Go to second view")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(25, corners: .allCorners)
            }
            .navigationTitle("Previews")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

"""
    
    static let previewingWithTraitsHowItWorks = """

The preview macro accepts an optional string, used as a title for the preview, an optional traits parameter, and a content closure with the view we want to preview. The traits parameter accepts several values to choose the orientation of the device, or even a custom frame to preview our content. The .sizeThatFitsLayout is useful to see the minimum frame that contains our view.

"""
    static let previewingWithTraitsCode = """

struct PreviewingWithTraits: View {
    //MARK: - Variables
    
    //MARK: - Views
    var body: some View {
        ZStack {
            Color.teal
                .frame(width:200, height: 150)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hello, world!")
                    .font(.title2)
            }
            .foregroundStyle(.primary)
            .padding(.all, 20)
            .background()
            .border(.tertiary, width: 10)
        }
    }
}

#Preview("Portrait") {
    PreviewingWithTraits()
}
#Preview("Landscape", traits: .landscapeLeft) {
    PreviewingWithTraits()
}
#Preview("Upside down", traits: .portraitUpsideDown) {
    PreviewingWithTraits()
}
#Preview("Size that fits", traits: .sizeThatFitsLayout) {
    PreviewingWithTraits()
}
#Preview("Fixed size", traits: .fixedLayout(width: 500, height: 200)) {
    PreviewingWithTraits()
}

"""

    static let previewOnDifferentDevicesHowItWorks = """

Xcode 15 takes preview functionality to a different level. Before, we had to use different modifiers to preview on different devices, but now, we can do it with just a click on the Preview Device Selector,

"""
    static let previewOnDifferentDevicesCode = """

struct PreviewOnDifferentDevices: View {
    var body: some View {
        VStack {
            Image(.friendship)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Importance of Friendship")
                .font(.title)
            Text("Friends helps us deal with stress and make better life choices")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

"""

    static let uiKitPreviewHowItWorks = """

The preview macros in Xcode 15 are straightforward to use. Just instantiate a UIViewcontroller or a UIView, configure it, and return it in the preview closure. Xcode will preview what you return in the closure.

In our first preview macro, we instantiate the initial view controller of the app using the Main storyboard, and we return the view controller in the last statement of the closure. Using the initial view controller in a UIKit app allows us to use the live preview to interact with the app on the canvas.

Our second preview macro instantiates a UILabel, configures some properties on the label, and then returns the label at the end of the closure. The preview shows the label as configured.

"""
    static let uiKitPreviewCode = "Go to Next View"
    
    static let usingMockDataForPreviewsHowItWorks = """

In this recipe, we modeled our Insect struct based on our sample JSON data. The Insect struct implements the decodable protocol to decode JSON objects into the struct. Implementing the Identifiable protocol requires each item to have a unique ID and, thus, can be used in a ForEach structure without explicitly passing in an id parameter.

In the preview macro, we perform several steps to fetch and convert our data into an array of Insect instances. We first fetch the data from the file.

Then, using a JSONDecoder instance, we decode the data into an array of Insect structs and return the results.

The return statement sends back a decoded array if not nil. Otherwise, it sends back an array of one object, the testInsect that we created in our Insect.swift file.

The app could be modularized by breaking down some components in the UsingMockDataForPreviews.swift file.

Try breaking down the code into InsectView and InsectListView SwiftUI views. The InsectView should focus on displaying data regarding one insect. The InsectListView takes an array of insects and displays them in a list, using our InsectView SwiftUI view.

Finally, our UsingMockDataForPreviews.swift file should do nothing else but call our InsectListView, while passing an array of Insect structs.

"""
    static let usingMockDataForPreviewsCode = """

struct InsectInfo: Decodable, Identifiable {
    var id: Int
    var imageName: String
    var name: String
    var habitat: String
    var description: String
}

struct UsingMockDataForPreviews: View {
    //MARK: - Variables
    var insects: [InsectInfo] = []
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(insects) {insect in
                Image(insect.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Rectangle())
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading){
                    Text(insect.name).font(.title)
                    Text(insect.habitat)
                }
                .navigationTitle("Insects")
            }
        }
    }
}

#Preview {
    let testInsect = InsectInfo(id: 1, imageName: "grasshopper", name: "grass", habitat: "rocks", description: "none")
    let testInsects: [InsectInfo] = {
        guard let url = Bundle.main.url(forResource: "insectData", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            return []
        }
        let decoder  = JSONDecoder()
        let array = try?decoder.decode([InsectInfo].self, from: data)
        return array ??  [testInsect]
    }()
    return UsingMockDataForPreviews(insects: testInsects)
}

// Mock JSON DATA
[
  {
      "id": 1,
    "imageName": "honeybee",
    "name": "Honey bee",
    "habitat": "Tropical climates",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id volutpat lacus laoreet non curabitur gravida arcu ac. Felis imperdiet proin fermentum leo vel. Et netus et malesuada fames. Amet nisl suscipit adipiscing bibendum est ultricies integer."
  },
  {
      "id": 2,
    "imageName": "greenbrownfly",
    "name": "Green Fly",
    "habitat": "warm and moist climates",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id volutpat lacus laoreet non curabitur gravida arcu ac. Felis imperdiet proin fermentum leo vel. Et netus et malesuada fames. Amet nisl suscipit adipiscing bibendum est ultricies integer."
  }, ...
]

"""
}
