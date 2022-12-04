//
//  TextFieldProtocols.swift
//
//  Created by Justin Cook on 11/23/22.
//

import SwiftUI

public protocol GenericTextFieldModelProtocol: ObservableObject {
    // MARK: - Constants
    var id: UUID { get }
    var keyboardType: UIKeyboardType { get set }
    var textContentType: UITextContentType { get set }
    var textInputAutocapitalization: TextInputAutocapitalization { get set }
    var submitLabel: SubmitLabel { get set }
    var autoCorrectionDisabled: Bool { get set }
    
    // MARK: - States
    var title: String { get set }
    var placeholderText: String { get set }
    var textEntry: String { get set } // Text entered by the user, use this to access the contents of the text field
    
    // MARK: - Bindings
    ///(Non-property wrapper b/c this isn't a view and no parent has to be informed when the wrapped value updates)
    var boundTextEntry: Binding<String> { get } // Bound to the text field, shouldn't be used to view the text entry's contents for lack of simplicity
    
    // MARK: - Published - Forces parent view to update when updates occur
    var enabled: Bool { get set }
    var focused: Bool { get set }
    var unsheathed: Bool { get set }
    var protected: Bool { get set }
    
    // Entry validation
    /// Trigger this when validating the text entry with some separate validation module
    var validEntry: Bool { get set }
    var shouldValidateEntry: Bool { get set }
    /// Set this to enable or disable entry validation visual indication entirely
    var entryValidationEnabled: Bool { get set }
    var validationCondition: ((String) -> Bool)? { get set }
    
    // MARK: - Actions
    var onSubmitAction: (() -> Void)? { get set }
}

public protocol SheathedTextFieldModelProtocol: GenericTextFieldModelProtocol {
    // MARK: - Main Icon
    /// To be displayed on the side of the textfield
    var icon: Image? { get set }
    var iconColor: Color? { get set }
    
    // MARK: - General Properties
    // Interior
    var fieldBackgroundColor: Color { get set }
    var textFieldTextColor: Color { get set }
    var textColor: Color { get set }
    var borderColor: Color { get set }
    var sheatheColor: Color { get set }
    var textFont: Font { get set }
    var fontWeight: Font.Weight { get set }
    
    // Exterior / Shadow
    var invalidEntryGlow: Color? { get set }
    var validEntryGlow: Color? { get set }
    var shadowColor: Color? { get }
    var shadowRadius: CGFloat? { get set }
    var shadowOffset: CGSize? { get set }
    
    // MARK: - Optional in-field button properties
    /// i.e hide password button for password textfields
    var inFieldButtonIcon: Image? { get set }
    var inFieldButtonAction: (() -> Void)? { get set }
    var inFieldButtonIconTint: Color? { get set }
    
    /// Allows configuration of the model after it has been initialized, used to simplify the constructor call
    func configurator(configuration: @escaping ((SheathedTextFieldModel)-> Void))
    
    /// Simplified way of focusing the textfield attached to this model from an external source, i.e another textfield on submission
    func focus()
    
    func executeValidationCondition()
}

public extension SheathedTextFieldModelProtocol {
    func focus() {
        unsheathed = true
        
        DispatchQueue.main.async {
            self.focused = true
        }
    }
    
    func executeValidationCondition() {
        guard let condition = validationCondition else { return }
        validEntry = condition(textEntry)
    }
}
