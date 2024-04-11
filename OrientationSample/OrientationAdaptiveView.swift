//
//  OrientationAdaptiveView.swift
//  OrientationSample
//
//  Created by DuongTo on 11/4/24.
//

import SwiftUI

enum Orientation {
    case lanspace
    case portrait
    case all

    init(horizontal: UserInterfaceSizeClass?, vertical: UserInterfaceSizeClass?) {
        switch (horizontal, vertical) {
        case (.compact, .regular):
            self = .portrait
        case (.regular, .compact):
            self = .lanspace
        case (.regular, .regular):
            self = .all
        case (.compact, .compact):
            self = .lanspace
        default:
            self = .all
        }
    }
}

struct OrientationAdaptiveView<PortraitContent: View, LanspaceContent: View>: View {
    var portraitContent: PortraitContent
    var lanspaceContent: LanspaceContent

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    public init(@ViewBuilder portraitContent: () -> PortraitContent, @ViewBuilder lanspaceContent: () -> LanspaceContent) {
        self.portraitContent = portraitContent()
        self.lanspaceContent = lanspaceContent()
    }

    var body: some View {
        let orient = Orientation(horizontal: horizontalSizeClass, vertical: verticalSizeClass)
        switch orient {
        case .lanspace:
            lanspaceContent
        case .portrait:
            portraitContent
        case .all:
            lanspaceContent
        }
    }
}
