import Foundation

public struct RSAPrivateKey<Traits>: PrivateKey
where Traits: RSATraits
{
    public static var algorithm: KeyAlgorithm { Traits.algorithm }
    public static var capabilities: KeyCapabilities { Traits.capabilities }
    
    public let data: [Data]
    public let permissions: KeyCapabilities
    
    public var modulus: Data { data[0] }
    public var privateExponent: Data { data[1] }
    public var publicExponent: Data { data[2] }
    public var prime1: Data { data[3] }
    public var prime2: Data { data[4] }
    public var coefficient: Data { data[5] }
    
    public init(_ data: [Data], permissions: KeyCapabilities = Self.capabilities) throws {
        try Self.requireCapabilities(permissions)
        self.data = data
        self.permissions = permissions
    }
    
    public init(modulus: Data, privateExponent: Data, publicExponent: Data, prime1: Data, prime2: Data, coefficient: Data, permissions: KeyCapabilities = Self.capabilities) throws {
        try self.init([
            modulus,
            privateExponent,
            publicExponent,
            prime1,
            prime2,
            coefficient
        ], permissions: permissions)
    }
}

extension RSAPrivateKey: NewKeyProvider {
    public init(permissions: KeyCapabilities) throws {
        todo()
    }
}

extension RSAPrivateKey: PublicKeyProvider {
    public var publicKey: RSAPublicKey<Traits> {
        get throws {
            try requirePermissions(.publicKey)
            todo()
        }
    }
}

extension RSAPrivateKey: EncryptionPrivateKey {
    public func decrypt(ciphertext: Data) throws -> Data {
        try requirePermissions(.encrypt)
        todo()
    }
}

extension RSAPrivateKey: SigningPrivateKey {
    public func sign(message: Data, with parameters: ()) throws -> RSASignature {
        try requirePermissions(.sign)
        todo()
    }
}

extension RSAPrivateKey: EncryptionPublicKey {
    public func encrypt(plaintext: Data, with parameters: ()) throws -> Data {
        try publicKey.encrypt(plaintext: plaintext, with: parameters)
    }
}

extension RSAPrivateKey: SigningPublicKey {
    public func verify(message: Data, signature: RSASignature) throws -> Bool {
        try publicKey.verify(message: message, signature: signature)
    }
}
