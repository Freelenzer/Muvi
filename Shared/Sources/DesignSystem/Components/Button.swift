import SwiftUI

public struct PrimaryButton: View {
  public let title: String
  public let systemImage: String
  public let action: () -> ()
  
  public init(title: String, systemImage: String, action: @escaping () -> ()) {
    self.title = title
    self.systemImage = systemImage
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      Label(title, systemImage: systemImage)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .foregroundColor(.white)
        .font(.button)
    }
    .background(content: {
      RoundedRectangle(cornerRadius: 4, style: .continuous).fill(Color.accent)
    })
    .frame(maxWidth: .infinity)
  }
  
}


public struct OutlineButton: View {
  public let title: String
  public let systemImage: String
  public let action: () -> ()
  
  public init(title: String, systemImage: String, action: @escaping () -> ()) {
    self.title = title
    self.systemImage = systemImage
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      Label(title, systemImage: systemImage)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .foregroundColor(.accent)
        .font(.title3)
    }
    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.accent, lineWidth: 2))
    .frame(maxWidth: .infinity)
  }
  
}
