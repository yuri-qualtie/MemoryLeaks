# MemoryLeaks
Sample project to demonstrate that `.accessibilityElement(children: .contain)` recommended by [Apple](https://developer.apple.com/documentation/swiftui/accessibilitychildbehavior/contain) produces objects that are leaked in UITest

We introduced view modifier `containerAccessibility(identifier: String)` to add accesability to containers such as VStack and HStacks.
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

We applied `.containerAccessibility` to each view. In `MemoryLeaksUITests::testPickerWithBinding` we do navigation between Selection and PickerWithBindingView several times and expect that all the instances of `PickerWithBindingViewModel` is dealocated at the end of the tests but they are accumulated and is not released:

<img width="323" alt="Leak-1" src="https://user-images.githubusercontent.com/70205509/131562842-8fc0430f-7440-4197-90fd-8ce754f070bf.png">
<img width="1070" alt="Leak2" src="https://user-images.githubusercontent.com/70205509/131563175-c3002de3-c120-4986-b916-41be4291b221.png">


