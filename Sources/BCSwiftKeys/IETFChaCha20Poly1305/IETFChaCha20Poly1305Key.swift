import Foundation
import BCRandom

/// A symmetric key for encryption and decryption of IETF-ChaCha20-Poly1305 messages.
///
/// https://datatracker.ietf.org/doc/html/rfc8439
public struct IETFChaCha20Poly1305Key: SymmetricKey {
    public static let algorithm: KeyAlgorithm = .ietf_chacha20_poly1305
    public static var capabilities: KeyCapabilities = [.encrypt, .wrap]

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
    
    public init<T: RandomNumberGenerator>(using rng: inout T, permissions: KeyCapabilities = Self.capabilities) throws {
        try self.init(rng.randomData(Self.keyLength), permissions: permissions)
    }
    
    public init(permissions: KeyCapabilities = Self.capabilities) throws {
        var rng = SecureRandomNumberGenerator()
        try self.init(using: &rng, permissions: permissions)
    }

    public struct Parameters {
        public let aad: Data?
        public let nonce: Data?

        public init(aad: Data? = nil, nonce: Data? = nil) {
            self.aad = aad
            self.nonce = nonce
        }
    }

    public struct Encrypted {
        public let ciphertext: Data
        public let authTag: Data
    }

    public func encrypt(plaintext: Data, with parameters: Parameters) throws -> Encrypted {
        try requirePermissions(.encrypt)
        todo()
    }

    public func decrypt(ciphertext: Encrypted) throws -> Data {
        try requirePermissions(.encrypt)
        todo()
    }
}
