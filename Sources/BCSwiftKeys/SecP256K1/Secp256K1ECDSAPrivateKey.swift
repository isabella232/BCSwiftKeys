import Foundation

public struct Secp256k1ECDSAPrivateKey: PrivateKey {
    public static let algorithm = Secp256k1ECDSAKey.algorithm
    public static var capabilities = Secp256k1ECDSAKey.capabilities
    public static let type: AsymmetricKeyType = .private
    
    public static let keyLength = 32
    
    public let data: Data // 32 bytes
    public let permissions: KeyCapabilities
    
    public init(_ data: Data, permissions: KeyCapabilities = Self.capabilities) throws {
        try Self.requireCapabilities(permissions)
        guard data.count == Self.keyLength else {
            throw KeyError.invalidSize
        }
        self.data = data
        self.permissions = permissions
    }
}

extension Secp256k1ECDSAPrivateKey: SigningPrivateKey {
    public func sign(message: Data, with parameters: ()) throws -> Secp256k1ECDSASignature {
        try requirePermissions(.sign)
        todo()
    }
}

extension Secp256k1ECDSAPrivateKey: SigningPublicKey {
    public func verify(message: Data, signature: Secp256k1ECDSASignature) throws -> Bool {
        try publicKey.verify(message: message, signature: signature)
    }
}

extension Secp256k1ECDSAPrivateKey: PublicKeyProvider {
    public var publicKey: Secp256k1ECDSAPublicKey {
        get throws {
            try requirePermissions(.publicKey)
            todo()
        }
    }
}
