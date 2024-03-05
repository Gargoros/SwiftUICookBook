//
//  ChapterFiveConstant.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

struct ChapterFiveConstant {
    
    static let signUpHowItWorks = """

A basic Form view with a TextField view is created by wrapping the TextField view with a Form view, then wrapping the Form view with a NavigationStack view.

We create a @State variable to hold the user’s input and a TextField to request the input. We can add more variables and more fields, but the overall structure of the code is like the code of the simple code block above.

Furthermore, Section views are used to provide a visible separation between related fields. Additionally, we can add headers to Section views, such as the NAMES section, or provide no header, such as the section with fields for username and password.

Finally, we use an if conditional statement to show or hide sections or fields from our form. For example, the Previous Address section of the form gets displayed only when the value of the lessThanTwo variable is set to false.

If you use the live preview on the canvas with ContentView and click the Submit button, you may notice that no print statement gets displayed. If that’s the case, it means that the debug area of Xcode is hidden. To see print statements, you need to make sure the Debug Area is visible (View | Debug Area | Show Debug Area).

If the Debug Area is visible, you will see print statements being displayed in the Debug Area each time the Submit button is clicked. In the Debug Area, make sure to select the Previews or Executable tab, depending on whether you are using the live preview or running the app in a simulator or device.

"""
    static let signUpCode = """

struct Address {
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
}

struct SignUpView: View {
    //MARK: - Variables
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var address2 = Address()
    @State private var lessThanTwo = false
    @State private var username = ""
    @State private var password = ""
    
    //MARK: - Views
    var body: some View {
        Form{
            
            Section("Names"){
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
            }
            Section("Current Address"){
                TextField("Street Address", text: $address.street)
                TextField("City", text: $address.city)
                TextField("Postal Code", text: $address.postalCode)
                
                Toggle(isOn: $lessThanTwo) {
                    Text("Have you lived here for 2+ years")
                }
            }
            
            if !lessThanTwo {
                Section("Previous Address"){
                    TextField("Street Address", text: $address2.street)
                    TextField("City", text: $address2.city)
                    TextField("Postal Code", text: $address2.postalCode)
                }
            }
            Section{
                TextField("Create Username", text: $username)
                SecureField("Create Password", text: $password)
            }
            
            Button("Submit") {
                print("Form submit action here")
            }
            
        }
        .navigationTitle("Sign Up")
    }
}

"""
    
    static let formFieldDisableHowItWorks = """

The .disable() modifier can be used to deactivate a button and prevent the user from submitting a form until certain conditions have been met. This modifier takes a boolean parameter and disables the button when the boolean parameter’s value is set to true.

In this recipe, we checked whether our @State variables for the username and password fields were not empty. The Login button stayed disabled as long as one or both fields were empty.

We also applied a modifier to multiple items at once by using a Group view. Our Group view applies the same modifiers to the Username and Password fields. Before Swift 5.9, Group was also used to overcome a limitation on the ViewBuilder in HStack, VStack, and ZStack, which could only hold up to 10 embedded views.

This limitation no longer exists thanks to the introduction of Parameter Packs in Swift 5.9.

"""
    static let formFieldDisableCode = """

struct LoginView: View {
    //MARK: - Variables
    @State private var username: String = ""
    @State private var password: String = ""
    
    //MARK: - Views
    var body: some View {
        VStack {
            Text("Dungeons and Wagons")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.blue)
                .padding(.bottom, 30)
            
            Image(systemName: "person.circle")
                .font(.system(size: 150))
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
            
            Group{
                TextField("User Name", text: $username)
                SecureField("Password", text: $password)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            }
            
            Button(action: {
                print("Login tapped")
            }, label: {
                Text("Login")
            })
            .padding()
            .background(
                (username.isEmpty || password.isEmpty) ? .gray : .blue
            )
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .disabled(username.isEmpty || password.isEmpty)
        }
        .padding()
    }
}

struct LoginView: View {
    //MARK: - Variables
    @State private var username: String = ""
    @State private var password: String = ""
    
    //MARK: - Views
    var body: some View {
        VStack {
            Text("Dungeons and Wagons")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.blue)
                .padding(.bottom, 30)
            
            Image(systemName: "person.circle")
                .font(.system(size: 150))
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
            
            Group{
                TextField("User Name", text: $username)
                SecureField("Password", text: $password)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            }
            
            Button(action: {
                print("Login tapped")
            }, label: {
                Text("Login")
            })
            .padding()
            .background(
                (username.isEmpty || password.isEmpty) ? .gray : .blue
            )
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .disabled(username.isEmpty || password.isEmpty)
        }
        .padding()
    }
}

"""

    static let focusAndSubmitHowItWorks = """

The Apple documentation defines @FocusState as a property wrapper that can read and write a value that SwiftUI updates, as the placement of focus within a scene change. We use the @FocusState property and the .focused(_ : equals:) modifier to describe which item on the scene we are currently updating. @FocusState is initialized as an optional argument to handle the situation where none of the items on the scene has been selected. Dismissing the keyboard also releases all items from focus, thereby setting its value to nil.

To go from one field to another without touching the screen, we add a .submitLabel() modifier to each of our TextView views such that when the user clicks Next, we switch the focus to the next item in the list. We are thus able to navigate from the address field to the City, State, and Zip code fields without ever leaving the keyboard. We are even able to submit the form at the end directly from the keyboard.

You can also use the @FocusState boolean to show and dismiss the keyboard. For example, the following code displays some text and a button:

struct ContentView: View {
    @State private var description = ""
    @FocusState private var isFocused: Bool
    var body: some View {
        TextField("Enter the description", text: $description)
            .focused($isFocused)
        Button("Hide keyboard") {
            isFocused = false
} 
}
}

Here, isFocused is set to true when the user clicks on the TextField, causing the keyboard to be displayed. When the user clicks on Hide keyboard, isFocused is set to false, thereby hiding the keyboard. In our recipe, we used an enum instead of a boolean for our @FocusState variable. In that case, to remove the focus, we should set the variable to nil.

"""
    static let focusAndSubmitCode = """

enum AddressField{
    case streetName
    case city
    case state
    case zipCode
}

struct FocusAndSubmit: View {
    //MARK: - Variables
    @State private var streetName = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zipCode = ""
    
    @FocusState private var currentFocus: AddressField?
    
    //MARK: - Views
    var body: some View {
        VStack{
            
            TextField("Address", text: $streetName)
                .focused($currentFocus, equals: .streetName)
                .submitLabel(.next)
                .modifier(TextFieldModifier())
            
            
            TextField("City", text: $city)
                .focused($currentFocus, equals: .city)
                .submitLabel(.next)
                .modifier(TextFieldModifier())
            
            TextField("State", text: $state)
                .focused($currentFocus, equals: .state)
                .submitLabel(.next)
                .modifier(TextFieldModifier())
            
            TextField("Zip Code", text: $zipCode)
                .focused($currentFocus, equals: .zipCode)
                .submitLabel(.done)
                .modifier(TextFieldModifier())
        }
        .padding()
        .onSubmit {
            switch currentFocus {
            case .streetName:
                currentFocus = .city
            case .city:
                currentFocus = .state
            case .state:
                currentFocus = .zipCode
            default:
                print("Thanks for providing your address")
            }
        }
    }
}

"""

    static let multiColumnTableHowItWorks = """

The Table struct is a container view used to display selectable and sortable data arranged in rows and columns. When we create a table, we provide a collection of elements and then configure the rows and columns with the data we want. Usually, the data would be retrieved from a remote server via a network call or maybe retrieved from a local database like Core Data, Swift Data, or SQLite. In our case, and for simplicity, the data is hardcoded.

In our example app, we defined a City struct to model the data representing a city in the US. Although it is a simple struct, it reflects a real-world scenario because the properties have different types: the name and state properties are of the type String, the population property is of the type Int, and the area property is of the type Measurement<UnitArea>. Any type needs to be transformed to String to be displayed in a view such as Text, and this is why we created two computed properties: formattedArea, which returns the string representation of the area property, and formattedPopulation, which returns the string representation of the population property. We used the NumberFormatter and MeasurementFormatter classes from the Foundation framework to transform numeric values and measurement values into a String representation. Using these classes ensures we will have the correct formatting for different localization settings. To learn more about these classes of the Foundation framework, refer to the links provided at the end of this section.

Our app’s main view, ContentView, defined a Table from an array of City instances, which displayed data for the top 20 cities in the US by population, ordered from the most populated city to the least populated city. We had to conform City to the Identifiable protocol to use this type to populate the table. The table was embedded in a NavigationStack to display a title above the column titles of the table.

In the table, we defined the four columns using the TableColumn struct, which takes a label, a content view, and an optional keypath. For columns displaying plain text with standard style, such as the state column, we used the TableColumn convenience initializer.

For more complex columns displaying numeric values with style and formatting, we used the full- fledged initializer.

Notice how we provided the keypath \\.population, which is different than \\.formattedPopulation. The reason behind this choice is that we needed to sort by population, which is a numeric value, but display the formattedPopulation value, which is the string representation of the numeric value. Inside the trailing closure, we provide a full-fledged Text view with style, but we could have used a more complex view if needed.

The next task we performed was implementing the sorting functionality to allow the user to sort the table by any of the columns, in ascending or descending order. We passed a binding to an array of KeyPathComparator instances to the Table, one for each sortable column, then declared a keypath for each column to define which property should be used for sorting, and then finally, applied the
.onChange(of:) modifier to the table to react to the change of sort order and effectively sorted the array of City instances with the new sort order.

We implemented row selection by passing a binding to a set of City.ID instances to the Table and then applied the .onChange(of:) modifier to react to selection changes. For simplicity, we printed the cities selected to the console, but in a real-world example, we would perform some action with the cities selected.

Our final step was to run the app on a compact horizontal size class, such as on an iPhone or an iPad in Split View or Slide Over modes. We saw how, when the screen size was constrained, the Table hid all the columns and titles and just displayed the first column. Taking this behavior into account, we created a custom view to display the four properties of our City instances in one column.

Table can also support static rows or a mix of static and dynamic rows. In this case, we would use the TableRow struct and, using the Table init(of:columns:rows:) initializer, pass a trailing closure with the rows.

"""
    static let multiColumnTableCode = """

struct CityInfo: Identifiable {
    
    var name: String
    var state: String
    var population: Int
    var area: Measurement<UnitArea>
    
    var id: String{ "\\(name), \\(state)" }
    
    var formattedArea: String {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.minimumFractionDigits = 1
        return formatter.string(from: area)
    }
    
    var formattedPopulation: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(integerLiteral: population)) ?? "n/a"
    }
}

extension CityInfo {
    
    static var top20USCities: [CityInfo] = [
        CityInfo(name: "Austin", state: "Texas", population: 964177, area: Measurement(value: 828.5, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Charlotte", state: "North Carolina", population: 879709, area: Measurement(value: 798.5, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Chicago", state: "Illinois", population: 2696555, area: Measurement(value: 589.7, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Columbus", state: "Ohio", population: 906528, area: Measurement(value: 569.8, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Dallas", state: "Texas", population: 1288457, area: Measurement(value: 879.6, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Denver", state: "Colorado", population: 711463, area: Measurement(value: 396.5, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Fort Worth", state: "Texas", population: 935508, area: Measurement(value: 899.5, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Houston", state: "Texas", population: 2288250, area: Measurement(value: 1658.6, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Indianapolis", state: "Indiana", population: 882039, area: Measurement(value: 936.5, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Jacksonville", state: "Florida", population: 954614, area: Measurement(value: 1935.5, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Los Angeles", state: "California", population: 3849297, area: Measurement(value: 1216, unit: UnitArea.squareKilometers)),
        CityInfo(name: "New York", state: "New York", population: 8467513, area: Measurement(value: 778.3, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Oklahoma City", state: "Oklahoma", population: 687725, area: Measurement(value: 1570.1, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Philadelphia", state: "Pennsylvania", population: 1576251, area: Measurement(value: 348.1, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Phoenix", state: "Arizona", population: 1624569, area: Measurement(value: 1341.6, unit: UnitArea.squareKilometers)),
        CityInfo(name: "San Antonio", state: "Texas", population: 1451853, area: Measurement(value: 1291.9, unit: UnitArea.squareKilometers)),
        CityInfo(name: "San Diego", state: "California", population: 1381611, area: Measurement(value: 844.1, unit: UnitArea.squareKilometers)),
        CityInfo(name: "San Francisco", state: "California", population: 815201, area: Measurement(value: 121.5, unit: UnitArea.squareKilometers)),
        CityInfo(name: "San Jose", state: "California", population: 983489, area: Measurement(value: 461.8, unit: UnitArea.squareKilometers)),
        CityInfo(name: "Seattle", state: "Washington", population: 733919, area: Measurement(value: 217, unit: UnitArea.squareKilometers))
       ]
}

struct CityRowView: View {
    //MARK: - Variables
    let city: CityInfo
    
    //MARK: - Views
    var body: some View {
        VStack(alignment: .leading) {
            LabeledContent {
                Text(city.state)
            } label: {
                Text(city.name)
                    .font(.title)
            }
            LabeledContent("Population"){
                Text(city.formattedPopulation)
                    .font(.body.monospacedDigit())
            }
            LabeledContent("Area") {
                Text(city.formattedArea)
                    .font(.body.monospacedDigit())
            }
            
        }
    }
}

struct MultiColumnTable: View {
    //MARK: - Variables
    static let populationComparator = KeyPathComparator(\\CityInfo.population, order: .reverse)
    @State private var cities: [CityInfo] = CityInfo.top20USCities.sorted(using: populationComparator)
    @State private var sortOrder = [
        populationComparator,
        KeyPathComparator(\\CityInfo.state),
        KeyPathComparator(\\CityInfo.name),
        KeyPathComparator(\\CityInfo.area)
    ]
    
    @State private var selection = Set<CityInfo.ID>()
    
    @Environment(\\.horizontalSizeClass) var horizontalSizeClass
    private var isCompact: Bool {
        return horizontalSizeClass == .compact
    }
    
    
    //MARK: - Views
    var body: some View {
        Table(cities, selection: $selection, sortOrder: $sortOrder) {
            TableColumn("Name", value: \\.name) {city in
                if isCompact {
                    CityRowView(city: city)
                }
                else{
                    Text(city.name)
                }
            }
            TableColumn("State", value: \\.state)
            
            TableColumn("Population", value: \\.population){ city in
                Text(city.formattedPopulation)
                    .font(.body.monospacedDigit())
                    .frame(minWidth: 100, alignment: .trailing)
            }
            .width(max: 150)
            TableColumn("Area", value: \\.area){ city in
                Text(city.formattedArea)
                    .font(.body.monospacedDigit())
                    .frame(minWidth: 100, alignment: .trailing)
            }
            .width(max: 150)
        }
        .navigationTitle("Top 20 US cities")
        .onChange(of: sortOrder) { _, newOrder in
            cities.sort(using: newOrder)
        }
        .onChange(of: selection) {
            print("Selected = { \\(Array(selection).sorted().joined(separator: " | ")) }")
        }
    }
}

"""

    static let twoDimensionalLayoutHowItWorks = """

The Grid struct is a container view that arranges other views in a two-dimensional layout. It is common to call the arranged views, cells. We create this two-dimensional layout by initializing a Grid with a collection of GridRow instances, each of which represents a row in the grid. The views embedded in a GridRow define the columns in the grid. The first view in each row will be placed in the first column, the second view in the second column, and so on.

In our example app, in the ContentView, we defined a grid with five rows. The first row is for the title of the grid, the second row is for the column titles, and the last three rows are for placing square views. Each row has a variable number of cells, and the Grid view calculates the columns by looking at the row with the largest number of views. In our case, the row with the column titles and the row labeled R2 both have seven views, and this is why the grid has seven columns. The grid adds empty cells to the trailing edge of the rows with fewer columns.

The grid sizes its columns using the widest of its cells and sizes the rows using the tallest of its cells. For example, the height of row R1 is determined by the height of the tallest cell, which is the red cell. The width of column C3 is the widest in the grid due to the red cell too.

But what happens to the title row that has a Text view? It is clearly the widest view, but why is the column with the row titles not as wide as the Text view? Because we used the modifier .gridCellColumns(_:) to indicate that the Text view spans several columns, in our case, the seven columns.

For the title row, we could have achieved the same layout by placing the Text view outside a GridRow and not using the modifier. Views in a grid but outside a GridRow struct get placed in between rows, span the maximum width available, and use the grid’s alignment property for horizontal alignment, which, by default, is centered. This example illustrates the power of SwiftUI’s declarative syntax, where a layout can be achieved in multiple different ways.

Following our explanation of views in a grid but outside the rows, we used a Divider between the first row and the second row. Because the divider takes the maximum width available, we used the gridCellUnsizedAxes(_:) modifier of the divider to limit its width to the grid’s width.

When we declared our Grid, we defined the vertical and horizontal spacing between cells. But the Grid initializer also allows for an alignment parameter, which we didn’t specify, and the Grid used the default .center alignment. This alignment lays out each view in the center of a cell. A good example is cell C1R1 with a small square view with a gray border. We can override the grid’s vertical alignment for the cells in a row by passing a VerticalAlignment parameter to the GridRow initializer. Examples of this vertical alignment override are rows R2 and R3.

In a similar way, we can override the the horizontal alignment for the cells in a column by adding the view modifier gridColumnAlignment(_:) to exactly one of the cells in the column, and specifying a value of type HorizontalAlignment for the unnamed parameter. A good example of this is column C2. For total control over the alignment of a single cell, we can specify a custom alignment anchor by using the gridCellAnchor(_:) modifier on the cell’s view. Examples of this are cells C4R1, C6R2, and C1R3.

The last thing to mention about grids is how to introduce a blank cell in a row. We did this in the row for the column titles. We introduced a blank cell before the six column titles using a Color.clear view. For a blank cell, we could use different options, but I would recommend a Color.clear view with a zero frame or with a gridCellUnsizedAxes(_:) modifier.

"""
    static let twoDimensionalLayoutCode = """

struct TwoDimensionalLayout: View {
    var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5){
            GridRow{
                Text("My Awesome Grid")
                    .font(.largeTitle)
                    .gridCellColumns(8)
            }
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            
            GridRow {
                Color.clear.frame(width: 0, height: 0)
                ForEach(1..<7) { index in
                    Text("C\\(index)")
                }
            }
            //.frame(width: 40)
            
            GridRow {
                Text("R1")
                Color.clear.frame(width: 7.5, height: 7.5)
                    .border(.gray)
                Color.black.frame(width: 15, height: 15)
                    .gridColumnAlignment(.leading)
                Color.red.frame(width: 90, height: 90)
                Color.yellow.frame(width: 30, height: 30)
                    .gridCellAnchor(.bottomTrailing)
            }
            
            GridRow(alignment: .top) {
                Text("R2")
                ForEach(0..<5) { _ in
                    Color.green.frame(width: 45, height: 45)
                }
                Color.green.frame(width: 15, height: 15)
                    .gridCellAnchor(.bottomLeading)
            }
            
            GridRow(alignment: .bottom) {
                Text("R3")
                Color.gray.frame(width: 15, height: 15)
                    .gridCellAnchor(.topLeading)
                ForEach(0..<2){_ in
                    Color.blue.frame(width: 30, height: 30)
                }
                Color.brown.frame(width: 45, height: 45)
                    .gridCellColumns(2)
                Color.gray.frame(width: 15, height: 15)
            }
        }
        .padding(4)
        .border(.gray)
    }
}

"""
}
