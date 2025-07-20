//
//  String+Extension.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 20/07/2568.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
