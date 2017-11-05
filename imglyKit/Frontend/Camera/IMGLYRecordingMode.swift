//
//  IMGLYRecordingMode.swift
//  imglyKit
//
//  Created by Sascha Schwabbauer on 29/06/15.
//  Copyright (c) 2015 9elements GmbH. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import MobileCoreServices

@objc public enum IMGLYRecordingMode: Int {
    case photo
    case video
    
    var bundle: Bundle {
        return Bundle(for: IMGLYCameraViewController.self)
    }
    
    var titleForSelectionButton: String {
        switch self {
        case .photo:
            return NSLocalizedString("camera-view-controller.mode.photo", tableName: nil, bundle: bundle, value: "", comment: "")
        case .video:
            return NSLocalizedString("camera-view-controller.mode.video", tableName: nil, bundle: bundle, value: "", comment: "")
        }
    }
    
    var selectionButton: UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(titleForSelectionButton, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor(red:1, green:0.8, blue:0, alpha:1), for: .selected)
        return button
    }
    
    var actionButton: UIControl {
        switch self {
        case .photo:
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "LensAperture_ShapeLayer_00000", in: bundle, compatibleWith: nil), for: UIControlState())
            button.imageView?.animationImages = [UIImage]()
            button.imageView?.animationRepeatCount = 1
            button.adjustsImageWhenHighlighted = false
            
            for index in 0 ..< 10 {
                if let image = UIImage(named:String(format: "LensAperture_ShapeLayer_%05d", index), in: bundle, compatibleWith:nil) {
                    button.imageView?.animationImages?.append(image)
                }
            }
            
            return button
        case .video:
            let button = IMGLYVideoRecordButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
    }
    
    var actionSelector: Selector {
        switch self {
        case .photo:
            return "takePhoto:"
        case .video:
            return "recordVideo:"
        }
    }
    
    var sessionPreset: String {
        switch self {
        case .photo:
            return AVCaptureSession.Preset.photo.rawValue
        case .video:
            return AVCaptureSession.Preset.high.rawValue
        }
    }
}
