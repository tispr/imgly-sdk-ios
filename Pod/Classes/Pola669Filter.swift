//
//  Pola669Filter.swift
//  imglyKit
//
//  Created by Carsten Przyluczky on 11/03/15.
//  Copyright (c) 2015 9elements GmbH. All rights reserved.
//

import Foundation

@objc(IMGLYPola669Filter) public class Pola669Filter: ResponseFilter {
    init() {
        super.init(responseName: "Pola669")
        self.displayName = "669"
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override var filterType:FilterType {
        get {
            return FilterType.Pola669
        }
    }
}