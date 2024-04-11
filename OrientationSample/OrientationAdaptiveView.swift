//
//  OrientationAdaptiveView.swift
//  OrientationSample
//
//  Created by DuongTo on 11/4/24.
//

import SwiftUI

enum Orientation {
    case landspace
    case portrait
    case all

    init(horizontal: UserInterfaceSizeClass?, vertical: UserInterfaceSizeClass?) {
        switch (horizontal, vertical) {
        case (.compact, .regular):
            self = .portrait
        case (.regular, .compact):
            self = .landspace
        case (.regular, .regular):
            self = .all
        case (.compact, .compact):
            self = .landspace
        default:
            self = .all
        }
    }
}

struct OrientationAdaptiveView<PortraitContent: View, LanspaceContent: View>: View {
    var portraitContent: PortraitContent
    var landspaceContent: LanspaceContent

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    public init(@ViewBuilder portraitContent: () -> PortraitContent, @ViewBuilder landspaceContent: () -> LanspaceContent) {
        self.portraitContent = portraitContent()
        self.landspaceContent = landspaceContent()
    }

    var body: some View {
        let orient = Orientation(horizontal: horizontalSizeClass, vertical: verticalSizeClass)
        switch orient {
        case .landspace:
            landspaceContent
        case .portrait:
            portraitContent
        case .all:
            landspaceContent
        }
    }
}
