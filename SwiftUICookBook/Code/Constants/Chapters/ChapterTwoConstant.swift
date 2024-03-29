//
//  ChapterTwoConstant.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

struct ChapterTwoConstant {
    
    static let weScrollHowItWorks = """

By default, scroll views display items vertically. Therefore, our first scroll view displays its content along the vertical axis without requiring us to specify the axis.

In this recipe, we also introduce the ForEach structure, which computes views on-demand based on an underlying collection of identified data. In this case, the ForEach structure iterates over a static array of alphabet characters and displays the SF Symbols of said characters.

We provided two arguments to the ForEach structure: the collection we want to iterate over and an ID. This ID helps us distinguish between the items in the collection and should be unique. Using \\.self as id, we indicated that the alphabet characters we are using are unique and will not be repeated in this lisr. We used unique items because SwiftUI expects each row to be uniquely identifiable and will not run as expected otherwise.

You can use the ForEach structure without specifying the id argument if your collection conforms to the Identifiable protocol.

Moving on to the second scroll view, we used the scrollIndicatorsFlash(trigger:) modifier to flash the scroll view indicators when the button with the label Flash Indicators is tapped. The button’s action changes the value of the flashIndicators Boolean state variable, which triggers the scroll indicators to show up momentarily. This is a way to programmatically trigger the visibility of the scroll indicators to give the user feedback on the scrolling capabilities of the view.

Finally, we applied the scrollIndicators(_:axes:).

This modifier gets two parameters: the first one indicates the visibility of the scroll indicators and the axes parameter specifies which indicators are affected. With this particular use of the modifier, we instructed SwiftUI to hide the vertical scroll indicator for all the scrollable views inside the VStack. This modifier makes our vertical scroll view hide the scroll indicator, while the horizontal scroll view is not affected and does display the scroll indicator.

A final remark about the two view modifiers we mentioned is that they affect any type of scrollable view, not only ScrollView instances but also List instances.

"""
    static let weScrollCode = """

struct WeScroll: View {
    //MARK: - Variables
    let letters: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
    @State private var flashIndicators: Bool = false
    
    //MARK: - Views
    var body: some View {
        VStack {
            ScrollView{
                ForEach(letters, id: \\.self) {letter in
                    Image(systemName: letter)
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                        .frame(width: 50, height: 50)
                        .background(.blue)
                        .symbolVariant(.circle.fill)
                }
            }
            .frame(width: 50, height: 200)
            ScrollView(.horizontal){
                HStack{
                    ForEach(letters, id: \\.self){letter in
                        Image(systemName: letter)
                            .font(.largeTitle)
                            .foregroundStyle(.yellow)
                            .frame(width: 50, height: 50)
                            .background(.blue)
                            .symbolVariant(.circle.fill)
                    }
                }
            }
            .scrollIndicatorsFlash(trigger: flashIndicators)
            .padding()
            Button("Flash") {
                flashIndicators.toggle()
            }
            .padding()
            
        }
        .scrollIndicators(.hidden, axes: .vertical)
    }
}

"""
    
    static let staticListHowItWorks = """

First, we created the WeatherInfo struct, which contains properties we’d like to use, such as image name (image), temperature (temp), and city. Notice that the WeatherInfo struct implements the Identifiable protocol. Making the struct conform to the Identifiable protocol allows us to use the data in a ForEach structure without specifying an id parameter. To conform to the Identifiable protocol, we added a unique property to our struct called id, a property whose value is generated by the UUID() function.

The basic form of a static list is composed of a List view and some other views.

In this recipe, we went a step further and used the ForEach struct to iterate through an array of identifiable elements stored in the weatherData variable. We wanted to display the data in each list item horizontally, so we displayed the contents in an HStack. Our image, temperature, and city are displayed using image and text views.

The weather image names are SF Symbol variants, so using them with an Image view systemName parameter displays the corresponding SF Symbol. You can read more about SF Symbols in Chapter 1, Using the Basic SwiftUI Views and Controls.

"""
    static let staticListCode = """

struct WeatherInfo: Identifiable {
    let id = UUID()
    var image: String
    var temp: Int
    var city: String
    

    static let weatherData: [WeatherInfo] = [
        WeatherInfo(image: "snow", temp: 5, city:"New York"),
        WeatherInfo(image: "cloud", temp:5, city:"Kansas City"),
        WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
        WeatherInfo(image: "snow", temp: 5, city:"Chicago"),
        WeatherInfo(image: "cloud.rain", temp: 49, city:"Washington DC"),
        WeatherInfo(image: "cloud.heavyrain", temp: 60, city:"Seattle"),
        WeatherInfo(image: "sun.min", temp: 75, city:"Baltimore"),
        WeatherInfo(image: "sun.dust", temp: 65, city:"Austin"),
        WeatherInfo(image: "sunset", temp: 78, city:"Houston"),
        WeatherInfo(image: "moon", temp: 80, city:"Boston"),
        WeatherInfo(image: "moon.circle", temp: 45, city:"Denver"),
        WeatherInfo(image: "cloud.snow", temp: 8, city:"Philadelphia"),
        WeatherInfo(image: "cloud.hail", temp: 5, city:"Memphis"),
        WeatherInfo(image: "cloud.sleet", temp:5, city:"Nashville"),
        WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
        WeatherInfo(image: "cloud.sun", temp: 5, city:"Atlanta"),
        WeatherInfo(image: "wind", temp: 88, city:"Las Vegas"),
        WeatherInfo(image: "cloud.rain", temp: 60, city:"Phoenix"),
    ]
}

struct StaticList: View {
    //MARK: - Variables
    let weatherData = WeatherInfo.weatherData
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(weatherData) {data in
                HStack{
                    Image(systemName: data.image)
                        .frame(width: 50, alignment: .leading)
                    Text("\\(data.temp)°F")
                        .frame(width: 80, alignment: .leading)
                    Text(data.city)
                }
                .font(.system(size: 25))
                .padding()
            }
        }
    }
}

"""

    static let customRowsHowItWorks = """

WeatherInfo.swift is the model file containing a blueprint of what we want each instance of our WeatherInfo struct to contain. We also created an array of the WeatherInfo instances, weatherData, which can be used in other parts of the project previewing and testing areas as we build. We used a static property of WeatherInfo so it is available to any type of app without the need to instantiate. We use static properties when we want values available globally to our app. In order to call the static property we need to prepend it with the type name.

The WeatherRow SwiftUI file is our focus for this recipe. By using this file, we can extract the design of a list row into a separate file and reuse the design in other sections of our project. We added a weather property to our WeatherRow that will hold the WeatherInfo arguments that are passed to our WeatherRow view.

As in the previous recipe, we want the content of each row to be displayed horizontally next to each other, so we enclosed the components related to our weather variable in an HStack.

The static WeatherData array has been created for preview purposes only. In a production application, your data will likely be obtained at runtime through API calls.

"""
    static let customRowsCode = """

struct WeatherInfo: Identifiable {
    let id = UUID()
    var image: String
    var temp: Int
    var city: String
}

extension WeatherInfo{
    static let weatherDataEx = [
            WeatherInfo(image: "snow", temp: 5, city:"New York"),
            WeatherInfo(image: "cloud", temp:5, city:"Kansas City"),
            WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
            WeatherInfo(image: "snow", temp: 5, city:"Chicago"),
            WeatherInfo(image: "cloud.rain", temp: 49, city:"Washington DC"),
            WeatherInfo(image: "cloud.heavyrain", temp: 60, city:"Seattle"),
            WeatherInfo(image: "sun.min", temp: 75, city:"Baltimore"),
            WeatherInfo(image: "sun.dust", temp: 65, city:"Austin"),
            WeatherInfo(image: "sunset", temp: 78, city:"Houston"),
            WeatherInfo(image: "moon", temp: 80, city:"Boston"),
            WeatherInfo(image: "moon.circle", temp: 45, city:"Denver"),
            WeatherInfo(image: "cloud.snow", temp: 8, city:"Philadelphia"),
            WeatherInfo(image: "cloud.hail", temp: 5, city:"Memphis"),
            WeatherInfo(image: "cloud.sleet", temp:5, city:"Nashville"),
            WeatherInfo(image: "sun.max", temp: 80, city:"San Francisco"),
            WeatherInfo(image: "cloud.sun", temp: 5, city:"Atlanta"),
            WeatherInfo(image: "wind", temp: 88, city:"Las Vegas"),
            WeatherInfo(image: "cloud.rain", temp: 60, city:"Phoenix"),
    ]
}

struct WeatherRow: View {
    //MARK: - Variables
    var weatherInfo: WeatherInfo
    
    //MARK: - Views
    var body: some View {
        HStack{
            Image(systemName: weatherInfo.image)
                .frame(width: 50, alignment: .leading)
            Text("\\(weatherInfo.temp)°F")
                .frame(width: 80, alignment: .leading)
            Text(weatherInfo.city)
            
        }
        .font(.system(size: 25))
        .padding()
    }
}

struct CustomRows: View {
    //MARK: - Variables
    var weatherData: [WeatherInfo]
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(weatherData){data in
                WeatherRow(weatherInfo: data)
            }
        }
    }
}

"""

    static let listRowAddHowItWorks = """

Our state variable, numbers, holds an array of numbers. We made it a state variable so that the view that’s created by our ForEach struct gets updated each time a new number is added to the array.

The .navigationTitle ("Number List") modifier adds a title to the top of the list, and with the .navigationBarTitleDisplayMode(.inline), we confine the title within the standard bounds of the navigation bar. The display mode is optional, so you could remove it to display the title more prominently. Other display modes include automatic, to inherit from the previous navigation item, and large, to display the title within an expanded navigation bar.

The .toolbar(...) modifier adds a button to the trailing end of the navigation section. The button calls the addItemToRow function when clicked.

The toolbar modifier defaults to the NavigationBar on iOS and within this, we can place toolbar items, normally using ToolbarItem(). However, since there is only one button, this defaults to the .topBarTrailing position. We could have used the following.

Finally, the addItemToRow function generates a random number between 5 and 99 and appends it to the numbers array. The view gets automatically updated since the numbers variable is a state variable and a change in its state triggers a view refresh.

In our list’s ForEach struct, we used \\.self as our id parameter. However, we may end up with duplicate numbers in our list as we generate more items. Identifiers should be unique, so using values that could be duplicated may lead to unexpected behaviors. Remember to ONLY use unique identifiers for apps meant to be deployed to users.

"""
    static let listRowAddCode = """

struct ListRowAdd: View {
    //MARK: - Variables
    @State var numbers = [1,2,3,4]
    
    private func addItemToRow(){
        self.numbers.append(Int.random(in: 5..<100))
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(self.numbers, id: \\.self) {number in
                    Text("\\(number)")
            }
            
        }
        .navigationTitle("Number List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            Button("Add") {
                addItemToRow()
            }
        }
    }
    
    
}

"""

    static let listRowDeleteHowItWorks = """

In this recipe, we introduced the .onDelete modifier, whose perform parameter takes a function that will be executed when clicked. In this case, deleting an item triggers the execution of our deleteItem function.

The deleteItem function takes a single parameter, indexSet, which is the indexes of the rows to be deleted. The onDelete modifier automatically passes the indexes of the items to be deleted.

Deleting an item from a List view can also be performed by embedding the list navigation stack and adding an EditButton control.

"""
    static let listRowDeleteCode = """

struct ListRowDelete: View {
    //MARK: - Variables
    @State private var countries = ["USA", "Canada", "Mexico", "England",
    "Spain", "Cameroon", "South Africa", "Japan", "South Korea"]
    
    private func deleteItem(at offsets: IndexSet){
        countries.remove(atOffsets: offsets)
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(countries, id: \\.self) {country in
                    Text(country)
            }
            .onDelete(perform: deleteItem)
        }
        .navigationTitle("Countries List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

"""

    static let listRowEditHowItWorks = """

The .toolbar { EditButton() } modifier adds an Edit button to the top-right corner of the display. Once tapped, it triggers the appearance of a minus sign to the left of each item in the modified List. Tapping on the minus sign reveals the Delete button, which, when tapped, will execute the function in our .onDelete modifier and delete the related item from the row.

To display the Edit button on the left-hand side of the navigation bar will require the use of a ToolbarItem since the toolbar button will no longer be in the default topBarTrailing position.

Thus, we will need to introduce a ToolbarItem with a specific placement.

"""
    static let listRowEditCode = """

struct ListRowEdit: View {
    //MARK: - Variables
    @Environment(\\.editMode) private var editMode
    
    @State private var countries = ["USA", "Canada", "Mexico", "England", "Spain", "Cameroon", "South Africa", "Japan", "South Korea"]
    
    private func deleteItem(at indexSet: IndexSet) {
        countries.remove(atOffsets: indexSet)
    }
    //MARK: - Views
    var body: some View {
        List{
            ForEach(countries, id: \\.self) {country in
                Text(country)
            }
            .onDelete(perform: deleteItem)
        }
        .navigationTitle("Countries List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if self.editMode?.wrappedValue == .active {
                Button("Done") {
                    self.editMode?.wrappedValue = .inactive
                }
            } else {
                Button("Edit") {
                    self.editMode?.wrappedValue = .active
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

"""

    static let movingListRowsHowItWorks = """

To move list rows, you need to wrap the list in a NavigationStack, add the .onMove(perform:) mod- ifier to the ForEach struct, and add a .toolbar modifier with an EditButton to the list. The onMove modifier calls the moveRow function when the user drags the row, while .toolbar displays the button that triggers the “move mode,” where list row items become movable.

The moveRow(source: IndexSet, destination: Int) function takes two parameters, source and destination, which represent the current index of the item to be moved and its destination index, respectively.


"""
    static let movingListRowsCode = """

struct MovingListRows: View {
    //MARK: - Variables
    @Environment(\\.editMode) private var editMode
    
    @State private var countries = ["USA", "Canada", "Mexico", "England", "Spain", "Cameroon", "South Africa" , "Japan", "South Korea"]
    
    private func moveRow(source: IndexSet, destination: Int){
        countries.move(fromOffsets: source, toOffset: destination)
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(countries, id: \\.self){country in
                Text(country)
            }
            .onMove(perform: moveRow)
        }
        .navigationTitle("Countries Move List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if self.editMode?.wrappedValue == .active {
                Button("Done") {
                    self.editMode?.wrappedValue = .inactive
                }
            } else {
                Button("Edit") {
                    self.editMode?.wrappedValue = .active
                }
            }
        }
    }
}

"""

    static let listWithSectionsHowItWorks = """

SwiftUI’s Section views are used to separate items into groups. In this recipe, we used Section views to visually group countries by their continents. A Section view can be used with a header, as shown in this recipe, or without a header.

You can change section styles by using the listStyle() modifier with the .grouped style.

"""
    static let listWithSectionsCode = """

struct ListWithSections: View {

    var body: some View {
        List{
            Section {
                Text("USA")
                Text("Canada")
                Text("Mexico")
                Text("Panama")
                Text("Anguilla")
            } header: {
                Text("North America")
            }
            Section {
                Text("Nigeria")
                Text("Ghana")
                Text("Kenya")
                Text("Senegal")
            } header: {
                Text("Africa")
            }
            Section {
                Text("Spain")
                Text("France")
                Text("Sweden")
                Text("Finland")
                Text("UK")
            } header: {
                Text("Europe")
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Continents and Countries")
        .navigationBarTitleDisplayMode(.inline)
    }
}

"""

    static let editableListsFieldsHowItWorks = """

Let’s start by looking at how editable lists were handled before SwiftUI 3. Before SwiftUI 3, the code for an editable list of items would use list indices to create bindings to a collection.

Not only was such code slow, but editing a single item caused SwiftUI to re-render the entire List of elements, leading to flickering and slow UI updates.

Ever since the introduction of SwiftUI 3, we can pass a binding to a collection of elements, and SwiftUI will internally handle binding to the current element specified in the closure. Since the whole of our collection conforms to the Identifiable protocol, each of our list items can be uniquely identified by its id parameter; therefore, adding or removing items from the list does not change list item indices and does not cause the entire list to be re-rendered.

"""
    static let editableListsFieldsCode = """

struct ToDoItem: Identifiable {
    let id = UUID()
    var title: String
}

struct EditableListsFields: View {
    //MARK: - Variables
    @State private var todos: [ToDoItem] = [
        ToDoItem(title: "Eat"),
        ToDoItem(title: "Sleep"),
        ToDoItem(title: "Code")
    ]
    
    //MARK: - Views
    var body: some View {
        List ($todos){ $todo in
            TextField("ToDo Item", text: $todo.title)
        }
    }
}

"""

    static let searchableListsHowItWorks = """

We use a List view to display a list of foods. The searchable modifier applied to the List view, adds a search field where the user can enter text to search through the list of foods. The searchable modifier takes two parameters, a binding to a string, which represents the text entered in the search field, and a prompt string, which will be displayed as a placeholder when the search field is empty.

We use the searchText state variable to hold the value that is being searched for. Each time the user interacts with the search field, the value of searchText changes thanks to the binding, which triggers SwiftUI to update the List view, because it depends on the computed property, searchResults, which depends on searchText.

The value of searchResults is used by the List view in the ForEach struct to display a filtered list of items based on the searched text.

For each item in the list, we use the LabeledContent container view to display the name and the category of the food.

The scope modifier could be useful to further reduce the scope of our search and reduce the time it takes to find an item. In our case, we have a list of food items, belonging to three different categories: meat, fruit, and vegetables. Selecting a specific scope narrows the search and gives the user a quicker way of finding the desired item.

This new modifier was introduced in iOS 16.4 and it is a nice mid-cycle addition, introduced with a minor version update of iOS. Most of the updates to iOS are usually announced in June, during the WWDC conference, and then introduced in September when the new version of iOS is released to users. However, Apple also releases new features during the year as is the case for the one we are using in this recipe.

The searchScopes(_:activation:_:) modifier takes three parameters, a binding to a scope variable, which defines the scope of the search, an activation style to decide when the scope selection control will be displayed, and a viewBuilder that represents the scoping options SwiftUI uses to populate a picker.

To define the scope of the search, we use an enum, FruitSearchScope, with the cases .all and .food(Food.Category). The first case is used to search the entire list of foods, while the second case has an associated value representing the food category used to narrow the search. The current scope is stored in the @State property scope. We want to populate a picker that will contain the four possible search scopes: all the foods, only the fruits, only the meats, or only the vegetables.

We provide a simple Text view for each scope and we associate a tag of type FruitSearchScope to each of them. These views will be used by SwiftUI to populate a picker.

As our last step, we need to modify the search to consider the search scope selected by the user. This only applies if the search scope is the second case, .food(Food.Category). We use an if-case-let statement to filter the foods by the category chosen, before searching for the text entered in the search field.

"""
    static let searchableListsCode = """

struct SearchableLists: View {
    //MARK: - Variables
    @State var searchText: String = ""
    @State var scope: FruitSearchScope = .all
    
    var food: [Food] = Food.sampleFood
    
    var searchResults: [Food] {
        var food: [Food] = self.food
        if case let .food(category) = scope {
            food = food.filter { $0.category == category }
        }
        if !searchText.isEmpty {
            food = food.filter { $0.name.lowercased().contains(searchText.lowercased())}
        }
        return food
    }
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach(searchResults, id: \\.self){food in
                LabeledContent(food.name) {
                    Text("\\(food.category.rawValue)")
                }
            }
            .searchable(text: $searchText, prompt: "Search for a food")
            .searchScopes($scope, activation: .onSearchPresentation) {
                Text("All").tag(FruitSearchScope.all)
                Text("Fruit").tag(FruitSearchScope.food(.fruit))
                Text("Meat").tag(FruitSearchScope.food(.meat))
                Text("Vegetable").tag(FruitSearchScope.food(.vegetable))
            }
            .navigationTitle("Food")
        }
    }
}

"""

}
