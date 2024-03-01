//
//  ChapterThreeConstant.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import Foundation

struct ChapterThreeConstant {
    
    static let lazyStacksHowItWorks = """

As we mentioned in the introduction to this recipe, the main advantage of the LazyHStack and LazyVStack views over the regular HStack and VStack views is that the former load items before displaying them, while the latter load all items at once during runtime.

We created a ListRow view whose init function prints the initialized item to observe lazy loading in action. The ListRow view’s body property is a view that displays a Text view containing the type row and the id property of the initialized struct.

In the ContentView struct, we replaced the entire body content with a VStack. This way, we can vertically display multiple views. Then, we added two ScrollView. In the first, we implemented LazyHStack, while in the second, we implemented LazyVStack.

If you try the app in the interactive canvas preview, or you launch the app on a device or a simulator, scroll through the numbers while watching the debug area print statements. Make sure to select between Executable or Previews to see the print statements. You’ll notice that only a subset of the ListRow views is initialized as you scroll: that’s lazy loading at work. Only the loading of the items that will soon be displayed on the screen will be initialized. That way, the app never spends excessive time loading all the data while the user interface stays empty.

Try implementing this recipe with a regular List view and observe the performance difference. You’ll notice significantly slower loading times because the app initializes all the rows before displaying the list.

"""
    static let lazyStacksCode = """

struct ListRow: View {
    //MARK: - Variables
    let id: Int
    let type: String
    
    init(id: Int, type: String) {
        self.id = id
        self.type = type
    }
    
    //MARK: - Views
    var body: some View {
        Text("\\(type) \\(id)")
            .padding()
    }
}

struct LazyStacks: View {
    //MARK: - Variables
    
    //MARK: - Views
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0...10000, id: \\.self){ item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }
            .frame(height: 100, alignment: .center)
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(0...10000, id: \\.self){ item in
                        ListRow(id: item, type: "Vertical")
                    }
                }
            }
        }
    }
}

"""
    
    static let lazyGridsHowItWorks = """

In its basic form, a lazy grid can be implemented by embedding a LazyVGrid or LazyHGrid in a ScrollView.

One of the fundamental concepts about using lazy grids involves understanding how to define the columns or rows of the grid. For example, the LazyVGrid column variable defines an array containing a single GridItem component but causes four columns to be displayed. How is that possible? The answer lies in how GridItem was defined. Using GridItem(.adaptive(minimum: 100)), we told SwiftUI to use at least 100 units of width for each item and place as many items as possible along the same column. Thus, the number of columns changes based on whether the device is in portrait or landscape mode, or if a device with a larger screen size is being used.

If you would rather specify the number of columns in a LazyVStack view or rows in a LazyHStack view, you can use GridItem(.flexible()).

Adding an array of three flexible grid items divides the available space into three equal rows for data to be displayed, with the rest of the space empty. While previewing the app in canvas preview mode, you can delete one of the grid items from rowSpec and observe that the number of rows in the preview also decreases.

"""
    static let lazyGridsCode = """

struct LazyGrids: View {
    //MARK: - Variables
    let columnSpec = [
          GridItem(.adaptive(minimum: 100))
    ]
    
    let rowSpec = [
          GridItem(.flexible()),
          GridItem(.flexible()),
          GridItem(.flexible())
    ]
    
    let colors: [Color] = [.green, .red, .yellow, .blue]
    
    //MARK: - Views
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columnSpec, spacing: 20) {
                    ForEach(0...999, id: \\.self) { index in
                            Text("Item: \\(index)")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
            ScrollView(.horizontal){
                LazyHGrid(rows: rowSpec, spacing: 20){
                    ForEach(0...999, id: \\.self) { index in
                            Text("Item: \\(index)")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

"""

    static let scrollViewReadersHowItWorks = """

The CharacterInfo struct conforms to the Identifiable protocol and has two properties: a name and an id. The id parameter will be used to assign an ID to each of the views inside the scroll view so we can scroll programmatically to any such views.

In the ForEach struct, we generate ImageView instances from the CharacterInfo elements in the charArray variable. We use the name property to instantiate an ImageView with the corresponding SF symbol. We have added 16 images to the scroll view, each one with a different ID.

With the modern approach, we add the scrollPosition(id:) modifier to the scroll view and pass a binding to the scrolledID variable. As the scroll view scrolls, the value of the variable will change to contain the ID of the topmost image view shown in the scroll view. To scroll programmatically, we will just assign to the scrolledID variable the value of the ID of the image view to which we want to scroll. For the button at the top, we assign the value 16, which is associated with the image view representing the letter Q, and for the button at the end, we assign the value 6, which represents the letter G.

With the legacy approach, we need to use ScrollViewReader. We embedded ScrollViewReader in the ScrollView so that we have access to an instance of ScrollViewProxy, which provides the method scrollTo(). This method can be used to programmatically scroll to the child view whose ID has been specified. The scrollTo() method also has an optional anchor parameter that is used to specify the position of the item we are scrolling to. For example, scrollTo(6, anchor: .top) causes the scroll view to scroll until the image view with ID 6, representing the letter G, is shown at the top of the scroll view. Change the anchor to .bottom and use the canvas to see how, when we scroll to the letter G, it shows at the bottom of the screen instead of the top.

"""
    static let scrollViewReadersCode = """

struct CharacterInfo: Identifiable {
    var name: String
    var id: Int
}

extension CharacterInfo {
    
    static let charArray = [
        CharacterInfo (name:"a.circle.fill",id:0),
        CharacterInfo (name:"b.circle.fill",id:1),
        CharacterInfo (name:"c.circle.fill",id:2),
        CharacterInfo (name:"d.circle.fill",id:3),
        CharacterInfo (name:"e.circle.fill",id:4),
        CharacterInfo (name:"f.circle.fill",id:5),
        CharacterInfo (name:"g.circle.fill",id:6),
        CharacterInfo (name:"h.circle.fill",id:7),
        CharacterInfo (name:"i.circle.fill",id:8),
        CharacterInfo (name:"j.circle.fill",id:9),
        CharacterInfo (name:"k.circle.fill",id:10),
        CharacterInfo (name:"l.circle.fill",id:11),
        CharacterInfo (name:"m.circle.fill",id:12),
        CharacterInfo (name:"n.circle.fill",id:13),
        CharacterInfo (name:"o.circle.fill",id:14),
        CharacterInfo (name:"p.circle.fill",id:15),
        CharacterInfo (name:"q.circle.fill",id:16),
    ]
}

struct ScrollViewReaders: View {
    //MARK: - Variables
    @State private var scrolledID: CharacterInfo.ID?
    
    //MARK: - Views
    var body: some View {
        HStack{
            VStack{
                Text("iOS 17")
                    .modifier(TitleBookModifier())
                
                ScrollView{
                    // scrolling content will go here
                    Button("Go to letter Q") {
                        withAnimation(){
                            scrolledID = 16
                        }
                    }
                    .padding()
                    .background(.blue)
                    .tint(.black)
                    
                    LazyVStack{
                        ForEach(CharacterInfo.charArray) { image in
                            Image(systemName: image.name)
                                .font(.largeTitle)
                                .foregroundStyle(.blue)
                                .frame(width: 90, height: 90)
                                .background(.yellow)
                                .padding()
                        }
                    }
                    
                    Button("Go to letter G") {
                        withAnimation(){
                            scrolledID = 6
                        }
                    }
                    .padding()
                    .background(.blue)
                    .tint(.black)
                    
                }
                .scrollIndicators(.hidden)
                .scrollPosition(id: $scrolledID)
            }
            Divider()
                .frame(width: 2)
                .overlay(.red)
                .padding()
            VStack{
                Text("iOS 14+")
                    .modifier(TitleBookModifier())
                
                ScrollView{
                    // legacy code will go here
                    ScrollViewReader(content: { proxy in
                        Button("Go to letter Q") {
                            withAnimation(){
                                proxy.scrollTo(16)
                            }
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.black)
                        
                        ForEach(CharacterInfo.charArray) { image in
                            Image(systemName: image.name)
                                .font(.largeTitle)
                                .foregroundStyle(.yellow)
                                .frame(width: 90, height: 90)
                                .background(.blue)
                                .padding()
                        }
                        
                        Button("Go to letter G") {
                            withAnimation(){
                                proxy.scrollTo(6)
                            }
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.black)
                    })
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding()
    }
}

"""

    static let expandingListsHowItWorks = """

The Backpack struct was defined in such a way that you can nest elements. Its content property is an array of elements of the Backpack type.

Since the Backpack struct’s content property is optional, we can create mock items to put in the backpack. These mock items are of the Backpack type but have no content. The dollar and yen variables represent mock items.

Our currencies can then be stored in a bag called currencies, thereby creating a hierarchical struc- ture where the currencies variable is the parent and dollar and yen are the children.

A similar concept was used to add paperClip and glass to our bin variable. We also created a tools variable that contains the bin variable and a pencil and a hammer. Finally, in the body section of our project, we created a bagContent array that contains the currencies and tools variables.

The final touch that makes a list expandable is adding the children parameter to our List view.

The children parameter of the List view expects an array of the same type as the struct being passed to it.

"""
    static let expandingListsCode = """

struct Backpack: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var content: [Backpack]?
}

let dollar = Backpack(name: "Dollar", icon: "dollarsign.circle")
let yen = Backpack(name: "Yen",icon: "yensign.circle")
let currencies = Backpack(name: "Currencies", icon: "coloncurrencysign.circle", content: [dollar, yen])

let pencil = Backpack(name: "Pencil",icon: "pencil.circle")
let hammer = Backpack(name: "Hammer",icon: "hammer")
let paperClip = Backpack(name: "Paperclip",icon: "paperclip")
let glass = Backpack(name: "Magnifying glass", icon: "magnifyingglass")

let bin  = Backpack(name: "Bin", icon: "arrow.up.bin", content: [paperClip, glass])
let tools = Backpack(name: "Tools", icon: "folder", content: [pencil, hammer, bin])

struct ExpandingLists: View {
    //MARK: - Variables
    let bagContents = [currencies, tools]
    
    //MARK: - Views
    var body: some View {
        List(bagContents, children: \\.content) { row in
            Label(row.name, systemImage: row.icon)
        }
    }
}

"""

    static let disclosureGroupsHowItWorks = """

Our initial DisclosureGroup view presents a list of planets. We can read the state change by passing a binding and finding out whether the DisclosureGroup view is in an open or closed state. Next, we used a DisclosureGroup view without bindings to display the continents on Earth.

Our third DisclosureGroup uses the closure syntax to separate the Text and label parts into two separate views, thus allowing for improved customization.

DisclosureGroup views are versatile as they can be nested and used to display content hierarchically.

"""
    static let disclosureGroupsCode = """

struct DisclosureGroups: View {
    //MARK: - Variables
    @State private var showPlanets = true
    
    //MARK: - Views
    var body: some View {
        VStack{
            DisclosureGroup(isExpanded: $showPlanets){
                Text("Mercury")
                Text("Venus")
                
                DisclosureGroup("Earth"){
                    Text("North America")
                    Text("South America")
                    Text("Europe")
                    Text("Africa")
                    Text("Asia")
                    Text("Antarctica")
                    Text("Oceania")
                }
            } label: {
                Text("Planets")
            }
            
            DisclosureGroup(
                content: { Text("Surprise! This is an alternative way of using DisclosureGroup") },
                label: {
                    Label("Tap to reveal", systemImage: "cube.box")
                        .font(.system(size: 25, design: .rounded))
                        .foregroundStyle(.blue)
                }
            )
        }
        .padding()
    }
}

"""

    static let toDoListHowItWorks = """

In a widget, an entry is a struct that holds some data and a date property used by WidgetKit to update the widget view at certain time intervals. For example, this project’s entry is called TaskEntry.

A timeline is an array of entries that displays some content in the widget based on the date property that’s assigned to each entry. This means that the content to be displayed within a certain timeframe is predetermined, thus requiring fewer computing resources. In addition, various refresh policies can be used to determine when new timeline entries should be computed.

Now that you’ve grasped the basics of WidgetKit, let’s delve into the actions we took and why we took them.

Our widget should display a new task every 10 seconds. That means each of our entries should contain a date when it should be displayed and a task to be displayed. The TaskEntry struct fulfills that requirement.

The next task we did was creating a Provider struct that conforms to the TimelineProvider protocol. A TimelineProvider advises WidgetKit on when to update the widget’s display. The TimelineProvider protocol contains three required functions:

• The placeholder function creates the placeholder view, which is used when WidgetKit displays the widget for the first time. A placeholder view gives the user a general idea of what the widget shows.
• The getSnapshot function is used to show the widget in the widget gallery. Use a sample date if it would take too long to fetch data for this function.
• The getTimeLine function provides an array of entries for the current time and optional future times to update the widget. For example, in our getTimeLine function, we sorted our list of tasks by priority with the highest one first, created an array of entries whose dates are 10 seconds apart, added those entries to our timeline, and called our completion handler function.

After completing our Provider struct, we created our TodoWidgetEntryView struct, which describes the design of our widget.

Our final step involved creating the main function, TodoWidget, which is the first function that gets called when we try to run the widget. We use WidgetKit's StaticConfiguration object because we’re not requesting any user configuration values. The kind string identifies the widget and should be descriptive. Next, the provider object created the timeline. Lastly, the callback function displayed a TodoEntryView. To specify what widget sizes we support, we added a .supportedFamilies modifier to the body view.

"""
    static let toDoListCode = """

struct TaskInfo: Identifiable {
    let id = UUID()
    var completed: Bool
    var description: String
    var priority: TaskPriority
}

enum TaskPriority {
    case high
    case medium
    case low
}

extension TaskInfo {
    
    static var tasks = [
            TaskInfo(completed: false, description: "Wake up", priority: .low ),
            TaskInfo(completed: false, description: "Shower", priority: .medium),
            TaskInfo(completed: false, description: "Code", priority: .high),
            TaskInfo(completed: false, description: "Eat", priority: .high ),
            TaskInfo(completed: false, description: "Sleep", priority: .high),
            TaskInfo(completed: false, description: "Get groceries", priority: .high)
        ]
    
    static var task = tasks[0]
}

struct TaskInfoView: View {
    //MARK: - Variables
    @Binding var task: TaskInfo
    
    //MARK: - Views
    var body: some View {
        HStack {
            
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(task.completed ? Color(UIColor.systemBlue) : Color.secondary)
                .onTapGesture {
                    self.task.completed.toggle()
                }
            
            Text(task.description)
                .font(.title2)
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct TaskListView: View {
    //MARK: - Variables
    @Binding var tasks: [TaskInfo]
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach($tasks) { task in
                TaskInfoView(task: task)
            }
        }
        .navigationTitle(Text("To do list"))
    }
}

struct TodoList: View {
    @State var tasks = TaskInfo.tasks
        var body: some View {
            TaskListView(tasks: $tasks)
        }
}

Select File | New | Target. Make sure that the template platform is iOS and enter the word widget in the filter.
Set Product Name to TodoWidget and make sure that Include Live Activity and Include Configuration Intent are unchecked.
Click Activate on the next pop-up alert.

import WidgetKit
import SwiftUI

struct TaskEntry: TimelineEntry{
    let date: Date
    let task: TaskInfo
}

struct Provider: TimelineProvider{
    
    func placeholder(in context: Context) -> TaskEntry {
        TaskEntry(date: Date(), task: .task)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TaskEntry) -> Void) {
        let entity = TaskEntry(date: Date(), task: .task)
        completion(entity)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TaskEntry>) -> Void) {
        
        var entries: [TaskEntry] = []
        let currentDate = Date()
        let filteredTasks = TaskInfo.tasks.sorted(by: { $0.priority > $1.priority })
        
        for index in 0..<filteredTasks.count {
            let task = filteredTasks[index]
            let entryDate = Calendar.current.date(byAdding: .second, value: index * 10, to: currentDate)!
            let entry = TaskEntry(date: entryDate, task: task)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ToDoWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack{
            Image(systemName: imageName(forTask: entry.task))
            Text(entry.task.description)
        }
        .containerBackground(for: .widget){
            Color(.widgetBackground)
        }
    }
    
    private func imageName(forTask task: TaskInfo) -> String {
        switch task.priority {
        case .high: "arrowshape.up.circle"
        case .medium: "arrowshape.forward.circle"
        case .low: "arrowshape.down.circle"
        }
    }
}

struct ToDoWidget: Widget {
    let kind: String = "ToDoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ToDoWidgetEntryView(entry: entry)
            } else {
                ToDoWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Task List Widget")
        .description("Shows next pressing item on a todo list")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview("small", as: .systemSmall) { ToDoWidget() } timelineProvider: { Provider() }

#Preview("medium", as: .systemMedium) { ToDoWidget() } timeline: {
    TaskEntry(date: Date(), task: TaskInfo(completed: false, description: "Wake up", priority: .low))
    TaskEntry(date: Date(), task: TaskInfo(completed: false, description: "Shower", priority: .medium))
    TaskEntry(date: Date(), task: TaskInfo(completed: false, description: "Code", priority: .high))
}

"""
//
//    static let lazyStacksHowItWorks = ""
//    static let lazyStacksCode = ""
}
