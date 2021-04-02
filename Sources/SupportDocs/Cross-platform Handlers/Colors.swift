//
//  Colors.swift
//  SupportDocs
//
//  Created by H. Kamran on 3/31/21.
//

#if os(macOS)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

// TODO: Add complete UIColor/NSColor color list
public enum Colors {
    #if os(iOS)
        public static let label = UIColor.label
        public static let secondaryLabel = UIColor.secondaryLabel
        public static let background = UIColor.systemBackground
        public static let secondaryBackground = UIColor.secondarySystemBackground
        public static let groupedBackground = UIColor.systemGroupedBackground

        public static let blue = UIColor.blue
        public static let white = UIColor.white
        public static let systemBlue = UIColor.systemBlue

        /// Add an UIColor that is not already declared
        /// - Parameter color: Any UIColor
        /// - Returns: An UIColor
        public static func color(_ color: UIColor) -> UIColor {
            return color
        }

    #elseif os(macOS)
        public static let label = NSColor.labelColor
        public static let secondaryLabel = NSColor.secondaryLabelColor
        public static let background = NSColor.windowBackgroundColor
    
        // TODO: Find NSColor equivalents to UIColor.secondarySystemBackground and UIColor.systemGroupedBackground
        public static let secondaryBackground = NSColor.windowBackgroundColor
        public static let groupedBackground = NSColor.windowBackgroundColor

        public static let blue = NSColor.blue
        public static let white = NSColor.white
        public static let systemBlue = NSColor.systemBlue

        /// Add a NSColor that is not already declared
        /// - Parameter color: Any NSColor
        /// - Returns: A NSColor
        public static func color(_ color: NSColor) -> NSColor {
            return color
        }
    #endif
}
