import XCTest
@testable import Signer

final class SignerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let signer: Signer = HDWallet()
        signer.deriveKeyPair(path: "", index: "")
    }
}
