import Foundation

public struct RSASignature<Traits>: Signature
where Traits: RSATraits
{
    public var data: Data
}
