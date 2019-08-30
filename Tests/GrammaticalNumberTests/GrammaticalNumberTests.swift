import XCTest
@testable import GrammaticalNumber

final class GrammaticalNumberTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GrammaticalNumber().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
