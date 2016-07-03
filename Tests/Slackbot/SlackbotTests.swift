import XCTest
@testable import Slackbot

class SlackbotTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Slackbot().text, "Hello, World!")
    }


    static var allTests : [(String, (SlackbotTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
