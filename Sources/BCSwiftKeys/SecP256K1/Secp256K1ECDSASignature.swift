import Foundation

public protocol Secp256k1Signature: Signature {
    static var signatureLength: Int { get }
    var data: [Data] { get }
    
    init(data: [Data]) throws
}

public struct Secp256k1ECDSASignature: Secp256k1Signature {
    public static let signatureLength = 64
    public let data: [Data] // 64 bytes

    public init(data: [Data]) throws {
        guard data.count == Self.signatureLength else {
            throw KeyError.invalidSize
        }
        self.data = data
    }
}

public struct Secp256k1SchnorrSignature: Secp256k1Signature {
    public static let signatureLength = 64
    public let data: [Data] // 64 bytes

    public init(data: [Data]) throws {
        guard data.count == Self.signatureLength else {
            throw KeyError.invalidSize
        }
        self.data = data
    }
}
