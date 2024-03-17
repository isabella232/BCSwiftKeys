import Foundation

/// A type that affords creating new unique keys.
public protocol NewKeyProvider {
    /// Create a new unique key with the given permissions.
    ///
    /// - Throws `KeyError.permissionViolation` if `permissions` is not a subset of `Self.capabilities`.
    init(permissions: KeyCapabilities) throws
}
