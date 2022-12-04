<div align="center">
 
# Sheathed-TextField-SwiftUI
 
[![Swift Version badge](https://img.shields.io/badge/Swift-5.7.1-orange.svg)](https://shields.io/)
[![Platforms description badge](https://img.shields.io/badge/Platform-iOS-blue.svg)](https://shields.io/)
[![GitHub license](https://badgen.net/github/license/jcook03266/Sheathed-TextField-SwiftUI)](https://github.com/jcook03266/Sheathed-TextField-SwiftUI/blob/main/LICENSE)
[![GitHub version](https://badge.fury.io/gh/jcook03266%2FSheathed-TextField-SwiftUI.svg)](https://github.com/jcook03266/Sheathed-TextField-SwiftUI)
[![GitHub followers](https://img.shields.io/github/followers/jcook03266.svg?style=social&label=Follow&maxAge=2592000)](https://github.com/jcook03266?tab=followers)
 
</div>

<div align="center">

<img src="https://github.com/jcook03266/Sheathed-TextField-SwiftUI/blob/main/Resources/sword.jpg" width="600">
<img src="https://github.com/jcook03266/Sheathed-TextField-SwiftUI/blob/main/Resources/Login-form-shot.jpg" width="600">

</div>

## The pen is mightier than the sword!

This custom textfield is a very unique and fluid centerpiece for any form or search menu built using SwiftUI. It was designed to be as eye-catching and functional as possible, every element of this textfield adds not just stylistic value, but purpose as well. From the name you'd be right to guess the naming convention was derived from swords, as the transition of the textfield resembles the unsheathing of a sword; high precision, flamboyant, and purposeful; you're uncovering a tool of great importance, a gateway of personalization for your application.

## Supported Platforms:
* iOS

## Minimum Required iOS Version:
* iOS 16

## Minimum Required Xcode / Swift Version to build this package:
* Xcode 14 / Swift: 5.7

## Installation:
1. Launch your target Xcode project 
2. Go to the menu bar
3. Click `File -> Add Packages Packages -> Search bar`
4. Enter the URL of this repository `https://github.com/jcook03266/Sheathed-TextField-SwiftUI/`
5. Set the dependency rule to `Up to Next Major Version`
6. Press the `Add Package` button at the bottom of the window. 
7. Done!

## How to use this package in your code:
1. At the top of the swift files in which this textfield will be referenced, add: `import Sheathed-TextField-SwiftUI`
2. Define a `SheathedTextFieldModel`
3. Configure the model using the built in `configurator` function
4. Define a `SheathedTextField` view and insert the configured model into that view
5. Install the `SheathedTextField` inside of a parent view, Note: The textfield is already centered, and it has a device appropriate width you can also specify in the view's `init` constructor

## Example:

### View Model:
```
import SwiftUI
import Sheathed-TextField-SwiftUI

class LoginScreenViewModel: ObservableObject {
    // MARK: - Published / TextField Models
    @Published var username_emailTextFieldModel: SheathedTextFieldModel!
    @Published var passwordTextFieldModel: SheathedTextFieldModel!
    
    ...
    
    init(...) {
        setModels()
    }
    
    func setModels() {
        username_emailTextFieldModel = .init()
        username_emailTextFieldModel.configurator { [weak self] model in
            guard let self = self else { return }
            
            model.title = self.username_emailTextFieldTitle
            model.placeholderText = "user123 / sampleEmail@Test.com"
            model.icon = Icons.getIconImage(named: .person_fill)
            model.keyboardType = .emailAddress
            model.textContentType = .emailAddress
            model.submitLabel = .next
            model.onSubmitAction = { [weak self] in
                guard let self = self else { return }
                
                self.passwordTextFieldModel.focus()
            }
        }
        
        passwordTextFieldModel = .init()
        passwordTextFieldModel.configurator { [weak self] model in
            guard let self = self else { return }
            
            model.title = self.passwordTextFieldTitle
            model.placeholderText = "Cr3&TiV3Password!23"
            model.icon = Icons.getIconImage(named: .lock_fill)
            model.keyboardType = .asciiCapable
            model.textContentType = .password
            model.submitLabel = .done
            
            // Validation
            model.entryValidationEnabled = true
            model.validationCondition = { text in
                !text.contains {
                    $0 == "."
                }
            }
            
            model.inFieldButtonIcon = Icons.getIconImage(named: .eye_slash)
            model.protected = true
            model.inFieldButtonAction = {
                model.protected.toggle()
                
                model.inFieldButtonIcon = model.protected ? Icons.getIconImage(named: .eye_slash) : Icons.getIconImage(named: .eye)
            }
        }
        }
```

### View:

```
import SwiftUI
import Sheathed-TextField-SwiftUI

// MARK: - Observed
@StateObject var model: LoginScreenViewModel

...
    
struct LoginScreen: View {

    // TextFields
    var username_EmailTextField: some View {
        let textField =  SheathedTextField(model: model.username_emailTextFieldModel)
        
        return textField
    }
    var password_TextField: some View {
        let textField = SheathedTextField(model: model.passwordTextFieldModel)
        
        return textField
    }
    var textFields: some View {
        VStack(spacing: textFieldSpacing) {
            username_EmailTextField
            
            password_TextField
        }
    }

var body: some View {
        GeometryReader { geom in
            ScrollView {
                VStack {
                    ...
                    
                    textFields
                    
                }
                .frame(width: geom.size.width)
                
                ...
        }
        .submitScope(true) // Note: Prevents submissions from this page from backtracking and triggering other submissions from separate views in the hierarchy
        
        ...
    }
}

...
}
```

<div align="center">

## Demonstration
### Here's a demo of a login form built using two sheathed textfields in a VStack. Auto-fill functionality works as expected with this custom textfield.

https://user-images.githubusercontent.com/63657230/205480657-3303207a-bc1d-457d-b1d8-64cb90eb218e.mp4

</div>
