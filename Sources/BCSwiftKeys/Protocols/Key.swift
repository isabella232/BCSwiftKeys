import Foundation

// "Capabilities" refers to the possible uses of the key type.
//
// "Permissions" refers to the subset of capabilities granted to a particular key.

public protocol Key: Hashable {
    associatedtype KeyData
    
    /// The algorithm this key uses.
    static var algorithm: KeyAlgorithm { get }
    
    /// The capabilities that keys of this type can be granted.
    static var capabilities: KeyCapabilities { get }
    
    /// The actual key data.
    var data: KeyData { get }
    
    /// They capability permissions granted to this key.
    var permissions: KeyCapabilities { get }
    
    /// Create a new key from the given data and permissions.
    ///
    /// - Throws `KeyError.permissionViolation` if `permissions` is not a subset of `Self.capabilities`.
    init(_ data: KeyData, permissions: KeyCapabilities) throws
}

public extension Key {
    /// Called when a key is used to perform an operation to ensure it has the required
    /// permissions.
    ///
    /// `permissions` must be a subset of permissions granted to the key, which will be
    /// a subset of the key type's capabilities.
    ///
    /// - Throws `KeyError.permissionViolation` if the key does not have the required permissions.
    func requirePermissions(_ permissions: KeyCapabilities) throws {
        guard self.permissions.contains(permissions) else {
            throw KeyError.permissionViolation
        }
    }
    
    /// Called when a key is created to ensure it is only granted permissions
    /// of which its type is capable.
    ///
    /// `capabilities` must be a subset of `Self.capabilities`.
    ///
    /// - Throws `KeyError.permissionViolation` if the key type cannot provide the required capabilities.
    static func requireCapabilities(_ capabilities: KeyCapabilities) throws {
        guard Self.capabilities.contains(capabilities) else {
            throw KeyError.permissionViolation
        }
    }
}
