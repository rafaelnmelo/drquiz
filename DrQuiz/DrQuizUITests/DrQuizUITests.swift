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

class when_user_taps_on_a_quiz: XCTestCase {
    
    func test_should_display_questions_for_the_selected_quiz() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        
        let quizList = app.tables["quizList"]
        quizList.cells["Math 101"].tap()
        
        let _ = app.tables["questionList"].waitForExistence(timeout: 2.0)
        XCTAssertEqual(3, app.tables["questionList"].cells.count)
    }
    
}
