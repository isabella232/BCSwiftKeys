import Foundation

public enum KeyError: Error {
    /// Thrown on an attempt to perform a function where the key was not granted the
    /// permission to use the requested capability.
    case permissionViolation

    /// Thrown when the size of data given for a field is incorrect.
    case invalidSize
    
    /// Thrown when attempting to decrypt data with an incorrect key.
    case incorrectDecryptionKey
}
