//
//  ContactView.swift
//  Resume
//
//  Created by ChanKaMong on 2/11/2023.
//

import SwiftUI

struct ContactView: View {
    @Binding var showContact: Bool

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "phone.fill").resizable().aspectRatio(contentMode: ContentMode.fit).foregroundColor(.white).padding().background(RoundedRectangle(cornerRadius: 10).foregroundColor(.brown)).onTapGesture { openUrl(Resume.shared.phoneUrl) }

                ForEach(Resume.shared.socialMedia, id: \.name) {
                    media in
                    Image(media.name.lowercased()).resizable().aspectRatio(contentMode: ContentMode.fit).cornerRadius(15).onTapGesture { openUrl(media.url) }
                }
            }.padding(.bottom, 10).padding(.horizontal, 10)
            Button {
                showContact = false
            } label: {
                Text("Cancel").font(.title2)
            }
        }.padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(uiColor: .tertiarySystemBackground))).padding()
    }
    func openUrl(_ url: String) {
    
          let url = URL(string: url)!
          
          if UIApplication.shared.canOpenURL(url) {
              print("can open")
              UIApplication.shared.open(url)
              return
          }
      }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(showContact: .constant(true))
    }
}
