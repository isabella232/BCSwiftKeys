import Foundation

public struct RSAPublicKey<Traits>: PublicKey
where Traits: RSATraits
{
    public static var algorithm: KeyAlgorithm { Traits.algorithm }
    public static var capabilities: KeyCapabilities { Traits.capabilities }

    public let data: [Data]
    public let permissions: KeyCapabilities
    
    public var publicExponent: Data { data[0] }
    public var modulus: Data { data[1] }
    
    public init(_ data: [Data], permissions: KeyCapabilities = Self.capabilities) throws {
        try Self.requireCapabilities(permissions)
        self.data = data
        self.permissions = permissions
    }
    
    public init(publicExponent: Data, modulus: Data, permissions: KeyCapabilities = Self.capabilities) throws {
        try self.init([publicExponent, modulus], permissions: permissions)
    }
}

extension RSAPublicKey: SigningPublicKey {
    public func verify(message: Data, signature: RSASignature) throws -> Bool {
        try requirePermissions(.sign)
        todo()
    }
}
 
extension RSAPublicKey: EncryptionPublicKey {
    public func encrypt(plaintext: Data, with parameters: ()) throws -> Data {
        try requirePermissions(.encrypt)
        todo()
    }
}
