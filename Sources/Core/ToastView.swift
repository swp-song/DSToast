//
//  ToastView.swift
//  DSToast
//
//  Created by Dream on 2023/11/17.
//

import SwiftUI

/// Display the style of `DSToast`
struct ToastView: View {
    
    
    /// Drives the `ToastView` data model
    var model: DSToast.Molde
    
    var body: some View {
        if case.horizontal = model.alignment {
            horizontal
        }
        
        if case.vertical = model.alignment {
            vertical
        }
    }
}

extension ToastView {
    
    /// Display Image
    var image: some View {
        model.image
            .font(.title)
            .font(.body)
    }
    
    /// Display text
    /// - Parameter alignment: Alignment
    /// - Returns: Title and Message
    func text(_ alignment: HorizontalAlignment) -> some View {
        VStack(alignment: alignment, spacing: 3) {
            Text(LocalizedStringKey(model.title))
                .font(.headline)
                .fontWeight(.bold)
            Text(LocalizedStringKey(model.message))
                .font(.subheadline)
                .opacity(0.9)
        }
    }
    
    
    /// Horizontal Layout
    var horizontal: some View {
        HStack {
            if case.trailing = model.textAlignment {
                Spacer()
            }
                
            image
            text(.leading)
            
            if case.leading = model.textAlignment {
                Spacer()
            }
        }
        .foregroundStyle(Color.ds.textColor)
        .padding(10)
    }
    
    /// Vertical Layout
    var vertical: some View {
        
        HStack {
            if case.trailing = model.textAlignment {
                Spacer()
            }
            VStack(spacing: 10) {
                image
                text(.center)
            }
            
            if case.leading = model.textAlignment {
                Spacer()
            }
        }
        .foregroundStyle(Color.ds.textColor)
        .padding(10)
    }
}
