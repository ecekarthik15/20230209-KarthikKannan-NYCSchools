//
//  _0230209_KarthikKannan_NYCSchoolsUITests.swift
//  20230209-KarthikKannan-NYCSchoolsUITests
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import XCTest

final class _0230209_KarthikKannan_NYCSchoolsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func getElementPositionAsCGFloat(element: XCUIElement) -> (x: CGFloat, y: CGFloat) {
        let frame = element.frame
        let xPosition = frame.origin.x
        let yPosition = frame.origin.y
        let screenWidth = UIScreen.main.fixedCoordinateSpace
        .bounds.width
        let screenHeight = UIScreen.main.fixedCoordinateSpace
        .bounds.height
        let elementXPositionAsPortionOfScreen = xPosition / screenWidth
        let elementYPositionAsPortionOfScreen = yPosition / screenHeight
        return (
          x: elementXPositionAsPortionOfScreen,
          y: elementYPositionAsPortionOfScreen
        )
    }
    
    func tap(on element: XCUIElement, xOffset: CGFloat, yOffset:    CGFloat) {
        let coordinate = element.coordinate(withNormalizedOffset: CGVector(dx: xOffset, dy: yOffset))
        if element.waitForExistence(timeout: 5) {
          coordinate.tap()
        } else {
          // fail the test
        }
    }
    
    func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 5) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate,
                                                    object: element)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        return result == .completed
    }
    
    
    func testSchoolDetails() {
        
        let app = XCUIApplication()
        app.launch()
                
        let cell = app.collectionViews.buttons["Liberation Diploma Plus High School, 2865 West 19th Street, Brooklyn, 11224 - NY, 718-946-6812, 206, students"]
        
        _ = waitForElementToAppear(cell)
        
        let position = getElementPositionAsCGFloat(element: cell)
        tap(on: app, xOffset: position.x, yOffset: position.y)
        
        let name = app.staticTexts["name"]
        _ = waitForElementToAppear(name)
        
        let satCriticalAvg = app.staticTexts["sat critical reading avg score"]
        _ = waitForElementToAppear(satCriticalAvg)
        let satMathAvg = app.staticTexts["sat math avg score"]
        _ = waitForElementToAppear(satMathAvg)
        let satWritingAvg = app.staticTexts["sat writing avg score"]
        _ = waitForElementToAppear(satWritingAvg)
        
        let overviewTitle = app.staticTexts["Overview title"]
        _ = waitForElementToAppear(overviewTitle)
        let overviewDesc = app.staticTexts["Overview description"]
        _ = waitForElementToAppear(overviewDesc)
        
        let sportsTitle = app.staticTexts["Sports title"]
        _ = waitForElementToAppear(sportsTitle)
        let sportsDesc = app.staticTexts["Sports description"]
        _ = waitForElementToAppear(sportsDesc)
        
        let extraCurricularTitle = app.staticTexts["Extracurricular Activities title"]
        _ = waitForElementToAppear(extraCurricularTitle)
        let extraCurricularDesc = app.staticTexts["Extracurricular Activities description"]
        _ = waitForElementToAppear(extraCurricularDesc)
        
        let transportTitle = app.staticTexts["Transport title"]
        _ = waitForElementToAppear(transportTitle)
        let transportDesc = app.staticTexts["Transport description"]
        _ = waitForElementToAppear(transportDesc)
        
        let locationTitle = app.staticTexts["Location title"]
        _ = waitForElementToAppear(locationTitle)
        let locationDesc = app.staticTexts["Location description"]
        _ = waitForElementToAppear(locationDesc)
        
        let phoneNumber = app.staticTexts["Location phoneNumber"]
        _ = waitForElementToAppear(phoneNumber)
        let mail = app.staticTexts["Location mail"]
        _ = waitForElementToAppear(mail)
    }
}
