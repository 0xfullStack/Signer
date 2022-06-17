
public protocol Signer {
    func deriveOwnerKeyPair() -> KeyPair
    func deriveKeyPair(path: String, index: UInt32) -> KeyPair
    
    var phrase: [String] { get }
}
