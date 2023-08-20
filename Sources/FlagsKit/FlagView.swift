import SwiftUI

/// SwiftUI Flag view
///
/// Check init for more details on how to create a new flag view:
/// ``init(countryCode:style:contentMode:)``
///
/// Example:
///
/// ```swift
/// FlagView(countryCode: "US")
/// ```
public struct FlagView: View {

    private let countryCode: String
    private let style: Style
    private let contentMode: ContentMode

    /// Initaliser for FlagView
    /// - Parameters:
    ///   - countryCode: ``String`` ISO country code ("US" for example)
    ///   - style: ``Style`` image style
    ///   - contentMode: ``ContentMode`` content mode of the image
    public init(
        countryCode: String,
        style: Style = .default,
        contentMode: ContentMode = .fill
    ) {
        self.countryCode = countryCode.uppercased()
        self.style = style
        self.contentMode = contentMode
    }

    public var body: some View {
        switch style {
        case .default:
            Image(countryCode.lowercased(), bundle: .currentModule)
                .resizable()
                .aspectRatio(contentMode: contentMode)
        case .circle:
            Image(countryCode.lowercased(), bundle: .currentModule)
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .clipShape(Circle())
        case .rounded(let radius):
            Color.clear
                .aspectRatio(contentMode: contentMode)
                .overlay(
                    Image(countryCode.lowercased(), bundle: .currentModule)
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(RoundedRectangle(cornerRadius: radius))
        }
    }
}

public extension FlagView {

    /// Style of the flag image
    enum Style {
        case `default`
        case circle
        case rounded(CGFloat)
    }
}

struct FlagView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            FlagView(countryCode: "US")
                .frame(width: 50, height: 50)
                .previewLayout(.sizeThatFits)
            FlagView(countryCode: "ro", style: .circle)
                .frame(width: 50, height: 50)
                .previewLayout(.sizeThatFits)
        }
    }
}
