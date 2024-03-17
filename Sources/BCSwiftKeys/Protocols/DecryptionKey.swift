import Foundation

public protocol DecryptionKey: Key {
    associatedtype EncryptedMessageType
    
    /// Decrypts `message` using this key.
    ///
    /// - Throws `KeyError.incorrectDecryptionKey` if this is not the correct key.
    /// - Throws `KeyError.permissionViolation` if the key does not have the `.encrypt` permission.
    func decrypt(ciphertext: EncryptedMessageType) throws -> Data
}
