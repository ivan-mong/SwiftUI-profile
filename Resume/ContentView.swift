//
//  ContentView.swift
//  Resume
//
//  Created by ChanKaMong on 1/11/2023.
//

import SwiftUI

struct ContentView: View {
    let resume = Resume.shared
    @State var showContact = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack { Image("avatar").resizable().aspectRatio(contentMode: ContentMode.fit).clipShape(Circle()).frame(width: 180)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text(resume.name).font(.title).bold()
                        Text(resume.title)
                        Label(resume.location,
                              systemImage: "location.fill").foregroundColor(.gray)
                    }
                }
                
                Button {
                    showContact = true
                } label: {
                    Text("Contact Me").font(.title2).padding(10).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 20).foregroundColor(.brown))
                }
                  
                Text("Skill").bold().font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    ForEach(resume.skills, id: \.self) {
                        skill in VStack {
                            Image(skill).resizable().aspectRatio(contentMode: ContentMode.fit).frame(width: 50)
                            Text(skill)
                        }.frame(width: 80)
                    }
                }
                
                Text("Experience").bold().font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 0) {
                    ForEach(resume.experiences, id: \.title) {
                        exp in HStack {
                            Rectangle().frame(width: 5).background(Circle().frame(width: 15)).padding(.horizontal, 20)
                            
                            VStack(spacing: 5) {
                                Group {
                                    Text("\(exp.start) - \(exp.end)").foregroundColor(.gray)
                                    Text(exp.title).bold()
                                    Text(exp.company).padding(.bottom, 14)
                                }.frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
            }.padding()
                .overlay(Color.black.opacity(showContact ? 0.5 : 0))
                .overlay(alignment: .top) {
                    Group {
                        if showContact {
                            ContactView(showContact: $showContact).offset(y: UIScreen.main.bounds.maxY * 0.35).transition(.slide)
                        }
                    }
                }.animation(.spring(), value: showContact)
            
        }.background(Color(uiColor: .secondarySystemBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
