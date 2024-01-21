// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Common {
    /// Apple
    internal static let apple = Strings.tr("Localizable", "common.apple", fallback: "Apple")
    /// Cancel
    internal static let cancel = Strings.tr("Localizable", "common.cancel", fallback: "Cancel")
    /// Close
    internal static let close = Strings.tr("Localizable", "common.close", fallback: "Close")
    /// Confirm
    internal static let confirm = Strings.tr("Localizable", "common.confirm", fallback: "Confirm")
    /// Delete
    internal static let delete = Strings.tr("Localizable", "common.delete", fallback: "Delete")
    /// Done
    internal static let done = Strings.tr("Localizable", "common.done", fallback: "Done")
    /// Email
    internal static let email = Strings.tr("Localizable", "common.email", fallback: "Email")
    /// Facebook
    internal static let facebook = Strings.tr("Localizable", "common.facebook", fallback: "Facebook")
    /// Google
    internal static let google = Strings.tr("Localizable", "common.google", fallback: "Google")
    /// Name
    internal static let name = Strings.tr("Localizable", "common.name", fallback: "Name")
    /// Password
    internal static let password = Strings.tr("Localizable", "common.password", fallback: "Password")
    /// Save
    internal static let save = Strings.tr("Localizable", "common.save", fallback: "Save")
    /// Send
    internal static let send = Strings.tr("Localizable", "common.send", fallback: "Send")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
