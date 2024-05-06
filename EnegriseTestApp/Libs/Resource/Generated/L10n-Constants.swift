// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum AboutApp {
    /// Contact Us
    public static let contactUs = L10n.tr("Localizable", "about_app.contact_us", fallback: "Contact Us")
    /// Rate App
    public static let rate = L10n.tr("Localizable", "about_app.rate", fallback: "Rate App")
    /// Share App
    public static let share = L10n.tr("Localizable", "about_app.share", fallback: "Share App")
  }
  public enum LocationSearch {
    /// Reload
    public static let buttonTitle = L10n.tr("Localizable", "location_search.button_title", fallback: "Reload")
    public enum LocationModel {
      /// AS number and organization
      public static let asNumber = L10n.tr("Localizable", "location_search.location_model.as_number", fallback: "AS number and organization")
      /// City
      public static let city = L10n.tr("Localizable", "location_search.location_model.city", fallback: "City")
      /// Country
      public static let country = L10n.tr("Localizable", "location_search.location_model.country", fallback: "Country")
      /// Country Code
      public static let countryCode = L10n.tr("Localizable", "location_search.location_model.country_code", fallback: "Country Code")
      /// ISP
      public static let isp = L10n.tr("Localizable", "location_search.location_model.isp", fallback: "ISP")
      /// Latitude
      public static let latitude = L10n.tr("Localizable", "location_search.location_model.latitude", fallback: "Latitude")
      /// Longitude
      public static let longitude = L10n.tr("Localizable", "location_search.location_model.longitude", fallback: "Longitude")
      /// Organization Name
      public static let organizationName = L10n.tr("Localizable", "location_search.location_model.organization_name", fallback: "Organization Name")
      /// Query
      public static let query = L10n.tr("Localizable", "location_search.location_model.query", fallback: "Query")
      /// Region
      public static let region = L10n.tr("Localizable", "location_search.location_model.region", fallback: "Region")
      /// Region Name
      public static let regionName = L10n.tr("Localizable", "location_search.location_model.region_name", fallback: "Region Name")
      /// Status
      public static let status = L10n.tr("Localizable", "location_search.location_model.status", fallback: "Status")
      /// Timezone
      public static let timezone = L10n.tr("Localizable", "location_search.location_model.timezone", fallback: "Timezone")
      /// Zip
      public static let zip = L10n.tr("Localizable", "location_search.location_model.zip", fallback: "Zip")
    }
  }
  public enum TabBar {
    public enum Item {
      /// About
      public static let about = L10n.tr("Localizable", "tab_bar.item.about", fallback: "About")
      /// Location
      public static let location = L10n.tr("Localizable", "tab_bar.item.location", fallback: "Location")
      /// Timer
      public static let timer = L10n.tr("Localizable", "tab_bar.item.timer", fallback: "Timer")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
