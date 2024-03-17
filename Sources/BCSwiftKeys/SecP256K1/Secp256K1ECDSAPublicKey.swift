import Foundation

public struct Secp256k1ECDSAPublicKey: PublicKey {
    public static let algorithm = Secp256k1ECDSAKey.algorithm
    public static var capabilities = Secp256k1ECDSAKey.capabilities
    public static let type: AsymmetricKeyType = .public
    
    public static let compressedKeyLength = 33
    public static let uncompressedKeyLength = 65
    
    public let data: Data // Compressed or uncompressed representation
    public let permissions: KeyCapabilities
    
    public init(_ data: Data, permissions: KeyCapabilities = Self.capabilities) throws {
        try Self.requireCapabilities(permissions)
        guard
            data.count == Self.compressedKeyLength ||
                data.count == Self.uncompressedKeyLength
        else {
            throw KeyError.invalidSize
        }
        self.data = data
        self.permissions = permissions
    }
    
    public var isCompressed: Bool {
        switch data.count {
        case Self.uncompressedKeyLength:
            return false
        case Self.compressedKeyLength:
            return true
        default:
            preconditionFailure()
        }
    }

    public var compressed: Self {
        guard !isCompressed else {
            return self
        }
        todo()
    }
    
    public var uncompressed: Self {
        guard isCompressed else {
            return self
        }
        todo()
    }
}

extension Secp256k1ECDSAPublicKey: SigningPublicKey {
    public func verify(message: Data, signature: Secp256k1ECDSASignature) throws -> Bool {
        try requirePermissions(.sign)
        todo()
    }
}
