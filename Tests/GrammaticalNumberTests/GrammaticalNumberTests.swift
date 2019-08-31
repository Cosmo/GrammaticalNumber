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
        XCTAssertEqual("grandchild".pluralized(), "grandchildren")
    }
    
    func testSingulars() {
        XCTAssertEqual("children".singularized(), "child")
        XCTAssertEqual("tables".singularized(), "table")
        XCTAssertEqual("computers".singularized(), "computer")
        XCTAssertEqual("mice".singularized(), "mouse")
        XCTAssertEqual("teeth".singularized(), "tooth")
        XCTAssertEqual("axes".singularized(), "axis")
        XCTAssertEqual("women".singularized(), "woman")
        XCTAssertEqual("grandchildren".singularized(), "grandchild")
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
    
    func testCustomGermanRules() {
        let rule = GrammaticalNumberRule.plural("album", "alben")
        GrammaticalNumberRule.add(rule, language: "de")
        
        XCTAssertEqual("album".pluralized(language: "de"), "alben")
    }
    
    func testCustomTurkishRules() {
        GrammaticalNumberRule.add(.plural(#"([aoıu][^aoıueöiü]{0,6})$"#, #"$1lar"#), language: "tr")
        GrammaticalNumberRule.add(.plural(#"([eöiü][^aoıueöiü]{0,6})$"#, #"$1ler"#), language: "tr")
        GrammaticalNumberRule.add(.singular(#"l[ae]r$"#, #""#), language: "tr")
        
        XCTAssertEqual("koltuk".pluralized(language: "tr"), "koltuklar")
        XCTAssertEqual("kitap".pluralized(language: "tr"), "kitaplar")
        XCTAssertEqual("domates".pluralized(language: "tr"), "domatesler")
        XCTAssertEqual("yemek".pluralized(language: "tr"), "yemekler")
        XCTAssertEqual("yemekler".singularized(language: "tr"), "yemek")
        XCTAssertEqual("dolaplar".singularized(language: "tr"), "dolap")
    }
    
    func testCaseSensitivity() {
        XCTAssertEqual("matrix".pluralized(), "matrices")
        XCTAssertEqual("Matrix".pluralized(), "Matrices")
        XCTAssertEqual("MATRIX".pluralized(), "MATRICES")
        
        XCTAssertEqual("sheep".pluralized(count: 0), "0 sheep")
        XCTAssertEqual("Sheep".pluralized(count: 0), "0 Sheep")
        XCTAssertEqual("SHEEP".pluralized(count: 0), "0 SHEEP")
        
        XCTAssertEqual("knife".pluralized(count: 0), "0 knives")
        XCTAssertEqual("Knife".pluralized(count: 0), "0 Knives")
        XCTAssertEqual("KNIFE".pluralized(count: 0), "0 KNIVES")
        
        XCTAssertEqual("teeth".singularized(), "tooth")
        XCTAssertEqual("Teeth".singularized(), "Tooth")
        XCTAssertEqual("TEETH".singularized(), "TOOTH")
        
        XCTAssertEqual("child".pluralized(), "children")
        XCTAssertEqual("Child".pluralized(), "Children")
        XCTAssertEqual("CHILD".pluralized(), "CHILDREN")
    }
    
    func testCaseMatching() {
        XCTAssertEqual("child".matchCase("CHILD"), "CHILD")
        XCTAssertEqual("Child".matchCase("Child"), "Child")
        XCTAssertEqual("children".matchCase("Children"), "Children")
    }

    static var allTests = [
        ("testPlurals", testPlurals),
        ("testSingulars", testSingulars),
        ("testCounts", testCounts),
        ("testCustomRules", testCustomRules),
        ("testCustomGermanRules", testCustomGermanRules),
        ("testCustomTurkishRules", testCustomTurkishRules),
        ("testCaseSensitivity", testCaseSensitivity),
        ("testCaseMatching", testCaseMatching),
    ]
}
