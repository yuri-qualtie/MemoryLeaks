# MemoryLeaks

## Description of issue
Sample project to demonstrate that `.accessibilityElement(children: .contain)` recommended by [Apple](https://developer.apple.com/documentation/swiftui/accessibilitychildbehavior/contain) produces objects that are leaked in UITest

We introduced view modifier `containerAccessibility(identifier: String)` to add accesibility to containers such as VStack and HStacks.
```
struct ContainerAccessibility: ViewModifier {
    let identifier: String

    func body(content: Content) -> some View {
        content
            .accessibilityElement(children: .contain)
            .accessibilityIdentifier(identifier)
    }
}

extension View {
    func containerAccessibility(identifier: String) -> some View {
        modifier(ContainerAccessibility(identifier: identifier))
    }
}
```

In sample application we have navigation based on `router.state`:
```
struct MainView: View {
    @ObservedObject var router: AppRouter
    
    @State var selection = NameModel()
    
    var body: some View {
        switch(router.state) {
        case .selection:
            SelectionView(viewModel: .init())
                .containerAccessibility(identifier: "selection-view")
        case .pickerWithBinding:
            PickerWithBindingView(viewModel: .init())
                .containerAccessibility(identifier: "picker-with-binding-view")
        case .nestedPublished:
            NestedPublishedView(viewModel: .init(selection: selection))
                .containerAccessibility(identifier: "nested-published-view")
        }
    }
}
```

We applied `.containerAccessibility` to each view. In this project `MemoryLeaksUITests::testPickerWithBinding` we do navigation between Selection and PickerWithBindingView several times and expect that all the instances of `PickerWithBindingViewModel` are deallocated at the end of the tests but they accumulate and are not released:

<img width="323" alt="Leak-1" src="https://user-images.githubusercontent.com/70205509/131562842-8fc0430f-7440-4197-90fd-8ce754f070bf.png">
<img width="1070" alt="Leak2" src="https://user-images.githubusercontent.com/70205509/131563175-c3002de3-c120-4986-b916-41be4291b221.png">


## Steps to reproduce:

1. Open Project
2. Navigate to MemoryLeaksUITests
3. Put breakpoint on line 31 - `print("put breakpoint here to debug memory graph")`
4. Run `testPickerWithBinding()`
5. Wait until breapoint is triggered
6. Select MemoryLeaks app in Debug
7. Click Debug Memory Graph
8. Inspect objects

Actual: We see 3 instances of PickerWithBindingViewModel that are leaked by UITests
Expected: All instances of PickerWithBindingViewModel should be deallocated when PickerWithBindingView disappears.
Note: The issue disappears if we comment line 22 `.containerAccessibility(identifier: "picker-with-binding-view")` in MainView.swift -  and repeat steps 2-8
