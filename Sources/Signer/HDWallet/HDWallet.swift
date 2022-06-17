//
//  HDWallet.swift
//  
//
//  Created by Liu Pengpeng on 2022/4/1.
//

import Foundation
import CryptoSwift
import BIP32
import BIP39

public struct HDWallet: Hashable, Equatable {
    public private(set) var phrase: [String]

    private var hdKey: HDKey {
        let seed = try! Mnemonic(phrase: phrase).seed
        return BIP32.HDKey(seed: seed)
    }
    
    public init() {
        let mnemonic = Mnemonic()
        self.phrase = mnemonic.phrase
    }
    
    public init(_ phrase: String) throws {
        let mnemonic = try Mnemonic(phrase: phrase.components(separatedBy: " "))
        self.phrase = mnemonic.phrase
    }
    
    public init(_ phrase: [String]) throws {
        let mnemonic = try Mnemonic(phrase: phrase)
        self.phrase = mnemonic.phrase
    }
}

extension HDWallet: Signer {
    public func deriveOwnerKeyPair() -> KeyPair {
        return deriveKeyPair(path: "m/44'/60'/0'/0")
    }

    public func deriveKeyPair(path: String, index: UInt32 = 0) -> KeyPair {
        let child = try! hdKey.derive(path: path)!.derive(index: index)!
        return KeyPair(type: .ecdsa, public: child.publicKey, private: child.privateKey!)
    }
}
