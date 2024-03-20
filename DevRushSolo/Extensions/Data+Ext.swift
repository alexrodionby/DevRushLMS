//
//  Data+Ext.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 10.03.24.
//

import Foundation

extension Data {
    init?(base64URLEncoded string: String) {
        var base64 = string
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        let paddedLength = base64.count + (4 - base64.count % 4) % 4
        base64 = base64.padding(toLength: paddedLength, withPad: "=", startingAt: 0)
        self.init(base64Encoded: base64)
    }
}
