//
//  SwiftUIRecipeExtension.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 28.02.24.
//

import Foundation

extension SwiftUIRecipe {
    
    static let chapter1: [SwiftUIRecipe] = [
        
        SwiftUIRecipe(
            recipeChapterName: "Laying out components",
            recipeName: "TheStacks",
            recipeHowItWorks: ChapterOneConstant.theStacksHowItWorks,
            recipeCode: ChapterOneConstant.theStacksCode,
            view: TheStacksView()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Dealing with text",
            recipeName: "FormattedText",
            recipeHowItWorks: ChapterOneConstant.formattedTextHowItWorks,
            recipeCode: ChapterOneConstant.formattedTextCode,
            view: FormattedText()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Using images",
            recipeName: "UsingImages",
            recipeHowItWorks: ChapterOneConstant.usingImagesHowItWorks,
            recipeCode: ChapterOneConstant.usingImagesCode,
            view: UsingImages()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Adding buttons and navigating with them",
            recipeName: "Buttons",
            recipeHowItWorks: ChapterOneConstant.buttonsHowItWorks,
            recipeCode: ChapterOneConstant.buttonsCode,
            view: Buttons()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Beyond buttons: using advanced pickers",
            recipeName: "UsingPickers",
            recipeHowItWorks: ChapterOneConstant.usingPickersHowItWorks,
            recipeCode: ChapterOneConstant.usingPickersCode,
            view: UsingPickers()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Applying groups of styles using ViewModifier",
            recipeName: "UsingViewModifiers",
            recipeHowItWorks: ChapterOneConstant.usingViewModifiersHowItWorks,
            recipeCode: ChapterOneConstant.usingViewModifiersCode,
            view: UsingViewModifiers()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Separating presentation from content with ViewBuilder",
            recipeName: "UsingViewBuilder",
            recipeHowItWorks: ChapterOneConstant.usingViewBuilderHowItWorks,
            recipeCode: ChapterOneConstant.usingViewBuilderCode,
            view: UsingViewBuilder()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Simple graphics using SF Symbols",
            recipeName: "UsingSFSymbols",
            recipeHowItWorks: ChapterOneConstant.usingSFSymbolsHowItWorks,
            recipeCode: ChapterOneConstant.usingSFSymbolsCode,
            view: UsingSFSymbols()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Integrating UIKit into SwiftUI: the best of both worlds",
            recipeName: "UIKitToSwiftUI",
            recipeHowItWorks: ChapterOneConstant.uIKitToSwiftUIHowItWorks,
            recipeCode: ChapterOneConstant.uIKitToSwiftUICode,
            view: UIKitToSwiftUI()
        ),
        SwiftUIRecipe(
            recipeChapterName: "Adding SwiftUI to a legacy UIKit app",
            recipeName: "AddingSwiftUIToALegacyUIKitApp",
            recipeHowItWorks: ChapterOneConstant.addSwiftUIToUIKitHowItWorks,
            recipeCode: ChapterOneConstant.addSwiftUIToUIKitCode,
            view: GreetingView(textFromUIKit: "AddingSwiftUIToALegacyUIKitApp")
        ),
        SwiftUIRecipe(
            recipeChapterName: "Exploring more views and controls",
            recipeName: "MoreViewsAndControls",
            recipeHowItWorks: ChapterOneConstant.moreViewsAndControlsHowItWorks,
            recipeCode: ChapterOneConstant.moreViewsAndControlsCode,
            view: MoreViewsAndControls()
        )
        
    ]
    
    static let chapter2: [SwiftUIRecipe] = [
    
        SwiftUIRecipe(
            recipeChapterName: "Using scroll views",
            recipeName: "WeScroll",
            recipeHowItWorks: ChapterTwoConstant.weScrollHowItWorks,
            recipeCode: ChapterTwoConstant.weScrollCode,
            view: WeScroll()),
        SwiftUIRecipe(
            recipeChapterName: "Creating a list of static items",
            recipeName: "StaticList",
            recipeHowItWorks: ChapterTwoConstant.staticListHowItWorks,
            recipeCode: ChapterTwoConstant.staticListCode,
            view: StaticList()),
        SwiftUIRecipe(
            recipeChapterName: "Using custom rows in a list",
            recipeName: "CustomRows",
            recipeHowItWorks: ChapterTwoConstant.customRowsHowItWorks,
            recipeCode: ChapterTwoConstant.customRowsCode,
            view: CustomRows(weatherData: WeatherInfo.weatherDataEx)),
        SwiftUIRecipe(
            recipeChapterName: "Adding rows to a list",
            recipeName: "ListRowAdd",
            recipeHowItWorks: ChapterTwoConstant.listRowAddHowItWorks,
            recipeCode: ChapterTwoConstant.listRowAddCode,
            view: ListRowAdd()),
        SwiftUIRecipe(
            recipeChapterName: "Deleting rows from a list",
            recipeName: "ListRowDelete",
            recipeHowItWorks: ChapterTwoConstant.listRowDeleteHowItWorks,
            recipeCode: ChapterTwoConstant.listRowDeleteCode,
            view: ListRowDelete()),
        SwiftUIRecipe(
            recipeChapterName: "Creating an editable List view",
            recipeName: "ListRowEdit",
            recipeHowItWorks: ChapterTwoConstant.listRowEditHowItWorks,
            recipeCode: ChapterTwoConstant.listRowEditCode,
            view: ListRowEdit()),
        SwiftUIRecipe(
            recipeChapterName: "Moving the rows in a List view",
            recipeName: "MovingListRows",
            recipeHowItWorks: ChapterTwoConstant.movingListRowsHowItWorks,
            recipeCode: ChapterTwoConstant.movingListRowsCode,
            view: MovingListRows()),
        SwiftUIRecipe(
            recipeChapterName: "Adding sections to a list",
            recipeName: "ListWithSections",
            recipeHowItWorks: ChapterTwoConstant.listWithSectionsHowItWorks,
            recipeCode: ChapterTwoConstant.listWithSectionsCode,
            view: ListWithSections()),
        SwiftUIRecipe(
            recipeChapterName: "Creating editable collections",
            recipeName: "EditableListsFields",
            recipeHowItWorks: ChapterTwoConstant.editableListsFieldsHowItWorks,
            recipeCode: ChapterTwoConstant.editableListsFieldsCode,
            view: EditableListsFields()),
        SwiftUIRecipe(
            recipeChapterName: "Using searchable lists with scopes",
            recipeName: "SearchableLists",
            recipeHowItWorks: ChapterTwoConstant.searchableListsHowItWorks,
            recipeCode: ChapterTwoConstant.searchableListsCode,
            view: SearchableLists()),
    ]
    
    static let chapter3: [SwiftUIRecipe] = [
        
        SwiftUIRecipe(
            recipeChapterName: "Using LazyHStack and LazyVStack",
            recipeName: "LazyStacks",
            recipeHowItWorks: ChapterThreeConstant.lazyStacksHowItWorks,
            recipeCode: ChapterThreeConstant.lazyStacksCode,
            view: MyLazyStacksView()),
        SwiftUIRecipe(
            recipeChapterName: "Displaying tabular content with LazyHGrid and LazyVGrid",
            recipeName: "LazyGrids",
            recipeHowItWorks: ChapterThreeConstant.lazyGridsHowItWorks,
            recipeCode: ChapterThreeConstant.lazyGridsCode,
            view: LazyGrids()),
        SwiftUIRecipe(
            recipeChapterName: "Scrolling programmatically",
            recipeName: "ScrollViewReaders",
            recipeHowItWorks: ChapterThreeConstant.scrollViewReadersHowItWorks,
            recipeCode: ChapterThreeConstant.scrollViewReadersCode,
            view: ScrollViewReaders()),
        SwiftUIRecipe(
            recipeChapterName: "Displaying hierarchical content in expanding lists",
            recipeName: "ExpandingLists",
            recipeHowItWorks: ChapterThreeConstant.expandingListsHowItWorks,
            recipeCode: ChapterThreeConstant.expandingListsCode,
            view: ExpandingLists()),
        SwiftUIRecipe(
            recipeChapterName: "Using disclosure groups to hide and show content",
            recipeName: "DisclosureGroups",
            recipeHowItWorks: ChapterThreeConstant.disclosureGroupsHowItWorks,
            recipeCode: ChapterThreeConstant.disclosureGroupsCode,
            view: DisclosureGroups()),
        SwiftUIRecipe(
            recipeChapterName: "Creating SwiftUI widgets",
            recipeName: "TodoList",
            recipeHowItWorks: ChapterThreeConstant.toDoListHowItWorks,
            recipeCode: ChapterThreeConstant.toDoListCode,
            view: TodoList())
    ]
    
    static let chapter4: [SwiftUIRecipe] = [
        
        SwiftUIRecipe(
            recipeChapterName: "Using the live preview canvas in Xcode15",
            recipeName: "CanvasPreview",
            recipeHowItWorks: ChapterFourConstant.canvasPreviewHowItWorks,
            recipeCode: ChapterFourConstant.canvasPreviewCode,
            view: CanvasPreview()),
        SwiftUIRecipe(
            recipeChapterName: "Previewing a view in a NavigationStack",
            recipeName: "PreviewingInNavigationStack",
            recipeHowItWorks: ChapterFourConstant.previewingInNavigationStackHowItWorks,
            recipeCode: ChapterFourConstant.previewingInNavigationStackCode,
            view: PreviewingInNavigationStack()),
        SwiftUIRecipe(
            recipeChapterName: "Previewing a view with different traits",
            recipeName: "PreviewingWithTraits",
            recipeHowItWorks: ChapterFourConstant.previewingWithTraitsHowItWorks,
            recipeCode: ChapterFourConstant.previewingWithTraitsCode,
            view: PreviewingWithTraits()),
        SwiftUIRecipe(
            recipeChapterName: "Previewing a view on different devices",
            recipeName: "PreviewOnDifferentDevices",
            recipeHowItWorks: ChapterFourConstant.previewOnDifferentDevicesHowItWorks,
            recipeCode: ChapterFourConstant.previewOnDifferentDevicesCode,
            view: PreviewOnDifferentDevices()),
        SwiftUIRecipe(
            recipeChapterName: "Using previews in UIKit",
            recipeName: "UIKitPreview",
            recipeHowItWorks: ChapterFourConstant.uiKitPreviewHowItWorks,
            recipeCode: ChapterFourConstant.uiKitPreviewCode,
            view: MyUIKitPreview()),
        SwiftUIRecipe(
            recipeChapterName: "Using mock data for previews",
            recipeName: "UsingMockDataForPreviews",
            recipeHowItWorks: ChapterFourConstant.usingMockDataForPreviewsHowItWorks,
            recipeCode: ChapterFourConstant.usingMockDataForPreviewsCode,
            view: UsingMockDataForPreviews())
    ]
    
    static let chapter5: [SwiftUIRecipe] = [
        
        SwiftUIRecipe(
            recipeChapterName: "Showing and hiding sections in forms",
            recipeName: "SignUp",
            recipeHowItWorks: ChapterFiveConstant.signUpHowItWorks,
            recipeCode: ChapterFiveConstant.signUpCode,
            view: SignUp()),
        SwiftUIRecipe(
            recipeChapterName: "Disabling and enabling items in forms",
            recipeName: "FormFieldDisable",
            recipeHowItWorks: ChapterFiveConstant.formFieldDisableHowItWorks,
            recipeCode: ChapterFiveConstant.formFieldDisableCode,
            view: FormFieldDisable()),
        SwiftUIRecipe(
            recipeChapterName: "Filling out forms easily using Focus and Submit",
            recipeName: "FocusAndSubmit",
            recipeHowItWorks: ChapterFiveConstant.focusAndSubmitHowItWorks,
            recipeCode: ChapterFiveConstant.focusAndSubmitCode,
            view: FocusAndSubmit()),
        SwiftUIRecipe(
            recipeChapterName: "Creating multi-column lists with Table",
            recipeName: "MultiColumnTable",
            recipeHowItWorks: ChapterFiveConstant.multiColumnTableHowItWorks,
            recipeCode: ChapterFiveConstant.multiColumnTableCode,
            view: MultiColumnTable()),
        SwiftUIRecipe(
            recipeChapterName: "Using Grid, a powerful two-dimensional layout",
            recipeName: "TwoDimensionalLayout",
            recipeHowItWorks: ChapterFiveConstant.twoDimensionalLayoutHowItWorks,
            recipeCode: ChapterFiveConstant.twoDimensionalLayoutCode,
            view: TwoDimensionalLayout()),
    ]
    
    static let chapter6: [SwiftUIRecipe] = [
        
        SwiftUIRecipe(
            recipeChapterName: "Presenting alerts",
            recipeName: "PresentingAlerts",
            recipeHowItWorks: ChapterSixConstant.presentingAlertsHowItWorks,
            recipeCode: ChapterSixConstant.presentingAlertsCode,
            view: PresentingAlerts()),
        SwiftUIRecipe(
            recipeChapterName: "Adding actions to alert buttons",
            recipeName: "AlertsWithActions",
            recipeHowItWorks: ChapterSixConstant.alertsWithActionsHowItWorks,
            recipeCode: ChapterSixConstant.alertsWithActionsCode,
            view: AlertsWithActions()),
        SwiftUIRecipe(
            recipeChapterName: "Presenting confirmation dialogs",
            recipeName: "PresentingConfirmationDialogs",
            recipeHowItWorks: ChapterSixConstant.presentingConfirmationDialogsHowItWorks,
            recipeCode: ChapterSixConstant.presentingConfirmationDialogsCode,
            view: PresentingConfirmationDialogs()),
        SwiftUIRecipe(
            recipeChapterName: "Presenting new views using sheets and full-screen covers",
            recipeName: "PresentingSheets",
            recipeHowItWorks: ChapterSixConstant.presentingSheetsHowItWorks,
            recipeCode: ChapterSixConstant.presentingSheetsCode,
            view: PresentingSheets()),
        SwiftUIRecipe(
            recipeChapterName: "Displaying popovers",
            recipeName: "DisplayingPopovers",
            recipeHowItWorks: ChapterSixConstant.displayingPopoversHowItWorks,
            recipeCode: ChapterSixConstant.displayingPopoversCode,
            view: DisplayingPopovers()),
        SwiftUIRecipe(
            recipeChapterName: "Creating context menus",
            recipeName: "DisplayingContextMenus",
            recipeHowItWorks: ChapterSixConstant.displayingContextMenusHowItWorks,
            recipeCode: ChapterSixConstant.displayingContextMenusCode,
            view: DisplayingContextMenus())
    ]
    
    static let chapter7: [SwiftUIRecipe] = [
        
        SwiftUIRecipe(
            recipeChapterName: "Simple navigation with NavigationStack",
            recipeName: "SimpleNavigation",
            recipeHowItWorks: ChapterSevenConstant.simpleNavigationHowItWorks,
            recipeCode: ChapterSevenConstant.simpleNavigationCode,
            view: SimpleNavigation()),
//        SwiftUIRecipe(
//            recipeChapterName: "Typed data-driven navigation with NavigationStack",
//            recipeName: "ModernNavigation",
//            recipeHowItWorks: ChapterSevenConstant.modernNavigationHowItWorks,
//            recipeCode: ChapterSevenConstant.modernNavigationCode,
//            view: ModernNavigation())

    ]
    
    
}
