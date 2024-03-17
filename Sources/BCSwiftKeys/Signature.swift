import Foundation

/// A signature produced by a `SigningPrivateKey`.
public protocol Signature: Hashable {
    associatedtype SignatureData
    var data: SignatureData { get }
}
