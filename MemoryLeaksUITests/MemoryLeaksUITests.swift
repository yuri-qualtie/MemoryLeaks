//
//  MemoryLeaksUITests.swift
//  MemoryLeaksUITests
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import XCTest

class MemoryLeaksUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
    }

    func testPickerWithBinding() throws {
        for _ in 1...3 {
            app.buttons["Picker with Binding"].click()
            
            app.staticTexts["Selected: Item 1"].waitToAppear()
            
            let index = Int.random(in: 1...5)
            app.popUpButtons["select item"].click()
            app.menuItems["Item \(index)"].click()
            app.staticTexts["Selected: Item \(index)"].waitToAppear()
            
            app.buttons["Back"].click()
        }
        
        print("put breakpoint here to debug memory graph")
    }
    
    func testNestedPublished() throws {
        for _ in 1...3 {
            app.buttons["Nested Published"].click()
            
            app.staticTexts["Name is Alice"].waitToAppear()
            app.buttons["Change Name"].click()
            app.staticTexts["Name is Bob"].waitToAppear()
            app.buttons["Revert Name"].click()
            
            app.buttons["Back"].click()
        }
        
        print("put breakpoint here to debug memory graph")
    }
}

extension XCUIElement {
    func waitToAppear() {
        XCTAssertTrue(waitForExistence(timeout: 1.0), "element is not appear")
    }
}
