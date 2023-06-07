//
//  TextStyles.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 06/06/23.
//

import Foundation
import SwiftUI

struct TitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("Raleway1", size: 26))
            .foregroundColor(.white)
    }
}


struct CouponTitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("Mulish", size: UIDevice.isIpad() ? 20 : 16))
            .foregroundColor(.black)
    }
}


struct DiscountAmountTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("Inter", size: 25))
            .foregroundColor(.green)
    }
}

struct DiscountStatusTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("Inter", size: 16))
            .foregroundColor(.green)
    }
}

struct PromoDescriptionTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("Inter", size: UIDevice.isIpad() ? 12 : 10))
            .foregroundColor(.green)
    }
}
