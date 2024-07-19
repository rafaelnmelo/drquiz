import XCTest

class when_app_is_launched: XCTestCase {
    
    func test_should_display_available_quizzes() {
        
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        
        let _ = app.tables["quizList"].waitForExistence(timeout: 5.0)
        
        let quizList = app.tables["quizList"]
        XCTAssertEqual(2, quizList.cells.count)
    }
   
}
