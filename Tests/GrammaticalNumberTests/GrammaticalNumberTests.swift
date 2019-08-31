import XCTest
@testable import GrammaticalNumber

final class GrammaticalNumberTests: XCTestCase {
    func testPlurals() {
        XCTAssertEqual("person".pluralized(), "people")
        XCTAssertEqual("center".pluralized(), "centers")
        XCTAssertEqual("sheep".pluralized(), "sheep")
        XCTAssertEqual("knife".pluralized(), "knives")
        XCTAssertEqual("mouse".pluralized(), "mice")
        XCTAssertEqual("money".pluralized(), "money")
        XCTAssertEqual("axis".pluralized(), "axes")
        XCTAssertEqual("item".pluralized(), "items")
        XCTAssertEqual("status".pluralized(), "statuses")
        XCTAssertEqual("fox".pluralized(), "foxes")
        XCTAssertEqual("move".pluralized(), "moves")
        XCTAssertEqual("tooth".pluralized(), "teeth")
        XCTAssertEqual("foxes".pluralized(), "foxes")
        XCTAssertEqual("millennium".pluralized(), "millennia")
        XCTAssertEqual("child".pluralized(), "children")
        XCTAssertEqual("matrix".pluralized(), "matrices")
        XCTAssertEqual("man".pluralized(), "men")
        XCTAssertEqual("ox".pluralized(), "oxen")
        XCTAssertEqual("radius".pluralized(), "radii")
        XCTAssertEqual("sub-child".pluralized(), "sub-children")
    }
    
    func testSingulars() {
        XCTAssertEqual("children".singularized(), "child")
        XCTAssertEqual("tables".singularized(), "table")
        XCTAssertEqual("computers".singularized(), "computer")
        XCTAssertEqual("mice".singularized(), "mouse")
        XCTAssertEqual("teeth".singularized(), "tooth")
        XCTAssertEqual("axes".singularized(), "axis")
        XCTAssertEqual("women".singularized(), "woman")
        XCTAssertEqual("sub-children".singularized(), "sub-child")
    }
    
    func testCounts() {
        XCTAssertEqual("child".pluralized(count: 0), "0 children")
        XCTAssertEqual("child".pluralized(count: 1), "1 child")
        XCTAssertEqual("child".pluralized(count: 3), "3 children")
        
        XCTAssertEqual("knife".pluralized(count: 0), "0 knives")
        XCTAssertEqual("knife".pluralized(count: 1), "1 knife")
        XCTAssertEqual("knife".pluralized(count: 3), "3 knives")
        
        XCTAssertEqual("sheep".pluralized(count: 0), "0 sheep")
        XCTAssertEqual("sheep".pluralized(count: 1), "1 sheep")
        XCTAssertEqual("sheep".pluralized(count: 3), "3 sheep")
    }
    
    func testCustomRules() {
        let rule = GrammaticalNumberRule.plural("bug", "features")
        GrammaticalNumberRule.add(rule)
        
        XCTAssertEqual("bug".pluralized(), "features")
    }
    
    func testCustomLanguageRules() {
        let rule = GrammaticalNumberRule.plural("album", "alben")
        GrammaticalNumberRule.add(rule, language: "de")
        
        XCTAssertEqual("album".pluralized(language: "de"), "alben")
    }

    static var allTests = [
        ("testPlurals", testPlurals),
        ("testSingulars", testSingulars),
        ("testCounts", testCounts),
        ("testCustomRules", testCustomRules),
        ("testCustomLanguageRules", testCustomLanguageRules),
    ]
}
