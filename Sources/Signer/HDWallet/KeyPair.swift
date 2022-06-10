//
//  KeyPair.swift
//  
//
//  Created by Liu Pengpeng on 2022/4/1.
//

import Foundation
import Crypto101

public enum KeyType {
    case ecdsa // secp256k1
    case eddsa // ed25519
}

public struct KeyPair {
    public var type: KeyType
    public var `public`: [UInt8]
    public var `private`: [UInt8]
    
    func sign(_ messageHash: [UInt8]) throws -> [UInt8] {
        let ecKey = ECC.Key(priv: self.private)
        let sig = try ecKey.sign(hash: messageHash)
        return sig.r + sig.s + [UInt8(sig.recoveryParam!)]
    }
}
