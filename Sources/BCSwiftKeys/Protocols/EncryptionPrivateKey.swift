import Foundation

/// A private key that affords decryption of messages encrypted using the public
/// key.
public protocol EncryptionPrivateKey: PrivateKey, DecryptionKey, EncryptionPublicKey {
}
