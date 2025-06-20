// Auto-generated by Java-to-Swift wrapper generator.
import JavaKit
import JavaKitCollection
import JavaRuntime

@JavaClass("kotlin.collections.AbstractCollection", implements: JavaCollection<JavaObject>.self, KMappedMarker.self)
open class AbstractCollection<E: AnyJavaObject>: JavaObject {
  @JavaMethod
  open func remove(_ arg0: JavaObject?) -> Bool

  @JavaMethod
  open func size() -> Int32

  @JavaMethod
  open override func toString() -> String

  @JavaMethod
  open func clear()

  @JavaMethod
  open func isEmpty() -> Bool

  @JavaMethod
  open func add(_ arg0: JavaObject?) -> Bool

  @JavaMethod
  open func toArray(_ arg0: [JavaObject?]) -> [JavaObject?]

  @JavaMethod
  open func toArray() -> [JavaObject?]

  @JavaMethod
  open func iterator() -> JavaIterator<JavaObject>!

  @JavaMethod
  open func contains(_ arg0: JavaObject?) -> Bool

  @JavaMethod
  open func addAll(_ arg0: JavaCollection<JavaObject>?) -> Bool

  @JavaMethod
  open func getSize() -> Int32

  @JavaMethod
  open func removeAll(_ arg0: JavaCollection<JavaObject>?) -> Bool

  @JavaMethod
  open func retainAll(_ arg0: JavaCollection<JavaObject>?) -> Bool

  @JavaMethod
  open func containsAll(_ arg0: JavaCollection<JavaObject>?) -> Bool
}
