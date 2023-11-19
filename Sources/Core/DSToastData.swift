//
//  ToastView.swift
//  DSToast
//
//  Created by Dream on 2023/11/17.
//

import Foundation
import SwiftUI
import Combine


public extension DSToast {
    
    ///  Drives the `ToastView` data model
    class Data: ObservableObject {
        
        /// `DSToast` display position
        public enum Position {
            
            /// Top position
            case top
            
            /// Bottom position
            case bottom
            
            /// Center position
            case center
        }
        
        /// Drives the `ToastView` display model
        @Published public var model: Molde
        
        /// Drives `DSToast` configuration model
        @Published public var config: Config
        
        /// Drives `DSToast` Blur Background Config
        @Published public var blur: Blur?
        
        /// `DSToast` display position
        @Published public var position: Position
        
        /// `DSToast` background color
        @Published public var backgroundColor: Color
        
        /// `Data` Initialization Method
        /// - Parameters:
        ///   - model:              Drives the `ToastView` display model
        ///   - config:             Drives `DSToast` configuration model
        ///   - blur:               Drives `DSToast` Blur Background Config
        ///   - position:           `DSToast` display position
        ///   - backgroundColor:    `DSToast` background color
        public init(model: Molde,
                    config: Config = Config.default,
                    blur: Blur? = nil,
                    position: Position = .top,
                    backgroundColor: Color = Color.ds.toastBackgroundColor) {
            self.model = model
            self.config = config
            self.blur = blur
            self.position = position
            self.backgroundColor = backgroundColor
        }
        
        
        /// `Data` Easy Initialization Method
        /// - Parameters:
        ///   - title:          Tips title
        ///   - message:        Tips message
        ///   - image:          Tips image
        ///   - config:         Drives `DSToast` configuration model
        ///   - blur:           Drives `DSToast` Blur Background Config
        ///   - position:       `DSToast` display position
        ///   - backgroundColor:`DSToast` background color
        public convenience init(title: String,
                                message: String,
                                image: Image = Image.ds.default,
                                config: Config = Config.default,
                                blur: Blur? = nil,
                                position: Position = .top,
                                backgroundColor: Color = Color.ds.toastBackgroundColor) {
            let model = Molde(title: title, message: message, image: image)
            self.init(model: model, config: config, blur: blur, position: position, backgroundColor: backgroundColor)
        }
        
    }
    
    /// Drives the `ToastView` data model
    struct Molde {
        
        /// Title and Message Text Alignment
        public enum TextAlignment {
            /// Center display
            case center
            
            /// Display on the left
            case leading
            
            /// Display on the right
            case trailing
        }

        /// Image and Text layout
        public enum Alignment {
            
            /// Horizontal layout
            case horizontal
            
            /// Vertical layout
            case vertical
        }
        
        /// Tips title
        public var title: String
        
        /// Tips message
        public var message: String
        
        /// Tips image
        public var image: Image
        
        /// Title and Message text location
        public var textAlignment: TextAlignment
        
        /// Image and Text Layout
        public var alignment: Alignment

        /// `Molde` Initialization Method
        /// - Parameters:
        ///   - title:              Tips title
        ///   - message:            Tips message
        ///   - image:              Tips image
        ///   - textAlignment:      Title and Message Text Alignment
        ///   - alignment:          Image and Text Layout
        public init(title: String,
                    message: String,
                    image: Image = Image.ds.default,
                    textAlignment: TextAlignment = .leading,
                    alignment: Alignment = .horizontal) {
            self.title = title
            self.message = message
            self.image = image
            self.textAlignment = textAlignment
            self.alignment = alignment
            
        }
    }
    
    
    /// Drives `DSToast` configuration model
    struct Config {
        
        /// Hidden or display `DSToast`, Hidden = true, display = false, `default` = `true`
        public var isHidden: Bool
        
        /// Delay Hidden `DSToast`, `default` = `2s`
        public var delay: TimeInterval
        
        /// Automatically hidden, `default` = `true`
        public var isAutoHidden: Bool
        
        /// Click `DSToast` is hidden
        public var isTapGesture: Bool
        
        /// Time Tasks
        public var cancellable: AnyCancellable?
        
        /// Rapid Initialization
        public static let `default` = Config()
        
        
        /// `Config` Initialization Method
        /// - Parameters:
        ///   - isHidden:       Hidden or display `DSToast`, Hidden = true, display = false, `default` = `true`
        ///   - delay:          Delay Hidden `DSToast`, `default` = `2s`
        ///   - isAutoHidden:   Automatically hidden, `default` = `true`
        ///   - isTapGesture:   Click `DSToast` is hidden
        ///   - cancellable:    Time Tasks
        public init(isHidden: Bool = true,
                    delay: TimeInterval = 2,
                    isAutoHidden: Bool = true,
                    isTapGesture: Bool = true,
                    cancellable: AnyCancellable? = nil) {
            self.isHidden = isHidden
            self.delay = delay
            self.isAutoHidden = isAutoHidden
            self.isTapGesture = isTapGesture
        }
    }
    
    /// Drives `DSToast` Blur Background Config
    struct Blur {
        
        /// Rapid Initialization
        public static let `default` = Blur()
        
        /// Background Color
        public var backgroundColor: Color
        
        /// Background Opacity, The minimum is `0.6`, `< 0.6` Click the event will penetrate
        public var opacity: Double
        
        /// `Blur` Initialization Method
        /// - Parameters:
        ///   - backgroundColor:    Background Color
        ///   - opacity:            Background Opacity
        public init(backgroundColor: Color = Color.ds.blurBackgroundColor, opacity: Double = 0.6) {
            self.backgroundColor = backgroundColor
            self.opacity = opacity < 0.6 ? 0.6 : opacity
        }
    }

}

