//
//  SheathedTextFieldModel.swift
//
//  Created by Justin Cook on 11/23/22.
//

import SwiftUI

class SheathedTextFieldModel: SheathedTextFieldModelProtocol {
    // MARK: - Properties
    let id: UUID = .init()
    
    var formatter: Formatter? = nil,
        keyboardType: UIKeyboardType = .default,
        textContentType: UITextContentType = .username,
        textInputAutocapitalization: TextInputAutocapitalization = .never,
        submitLabel: SubmitLabel = .done,
        
        // Labels and initial text to be displayed
        title: String,
        placeholderText: String,
        
        // MARK: - Actions
        onSubmitAction: (() -> Void)? = nil
    
    // MARK: - Binding (Non-property wrapper)
    var boundTextEntry: Binding<String> {
        .init {
            return self.textEntry
        } set: { newVal in
            self.textEntry = newVal
        }
    }
    
    // MARK: - Published
    @Published var textEntry: String
    @Published var enabled: Bool = true
    @Published var focused: Bool = false
    @Published var unsheathed: Bool = false
    @Published var protected: Bool = false
    
    // MARK: - Styling
    // Main Icon
    var icon: Image?,
        iconColor: Color? = .white,
        
        // MARK: - General Properties
        // Interior
        fieldBackgroundColor: Color = .white,
        textColor: Color = .white,
        borderColor: Color = .black,
        sheatheColor: Color = .black,
        textFont: Font = Font.system(size: 16),
        fontWeight: Font.Weight = .semibold,
        
        // Exterior / Shadow
        invalidEntryGlow: Color? = .red,
        validEntryGlow: Color? = .green,
        shadowColor: Color? = .gray.opacity(0.45),
        shadowRadius: CGFloat? = 0,
        shadowOffset: CGSize? = CGSize(width: 0, height: 6),
        
        // MARK: - Optional in-field button properties
        inFieldButtonIcon: Image? = nil,
        inFieldButtonAction: (() -> Void)? = nil,
        inFieldButtonIconTint: Color? = .gray
    
    init(title: String = "",
         placeholderText: String = "",
         formatter: Formatter? = nil,
         textEntry: String = "")
    {
        self.title = title
        self.placeholderText = placeholderText
        self.formatter = formatter
        self.textEntry = textEntry
    }
    
    func configurator(configuration: @escaping ((SheathedTextFieldModel)-> Void)) {
        configuration(self)
    }
}
