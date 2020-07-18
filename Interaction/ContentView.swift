//
//  ContentView.swift
//  Interaction
//
//  Created by Romain Rabouan on 18/07/2020.
//

import SwiftUI

struct ContentView: View {
    
    
    let elements: [SettingsElement] = [
        SettingsElement(title: "Paramètres", subtitle: "Changez les paramètres de l'application", imageName: "gearshape", gradient: Gradient(colors: [Color(red: 102/255, green: 125/255, blue: 182/255), Color(red: 0/255, green: 130/255, blue: 200/255)])),
        
        SettingsElement(title: "Nouveautés", subtitle: "Explorez les nouveautés", imageName: "sparkles", gradient: Gradient(colors: [Color(red: 104/255, green: 191/255, blue: 244/255), Color(red: 169/255, green: 229/255, blue: 223/255)])),
        
        SettingsElement(title: "Déconnexion", subtitle: "Changer de compte", imageName: "multiply.circle", gradient: Gradient(colors: [Color(red: 255/255, green: 130/255, blue: 90/255), Color(red: 255/255, green: 70/255, blue: 70/255)]))
    ]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(elements) { element in
                        
                        NavigationLink(destination: DetailSettings()) {
                            SettingsListRow(element: element)
                                .padding(.bottom, 10)
                                .padding(.leading, 28)
                        }.buttonStyle(SettingsButtonStyle())
                        
                        
                        
                    }
                }.padding(.top, 20)
            }

            
            .navigationTitle("Compte et réglages")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
            
    }
}

struct SettingsButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(configuration.isPressed ? Color.gray.opacity(0.25) : Color.clear
                ).padding(.horizontal, 20)
            )
    }
}

struct DetailSettings: View {
    var body: some View {
        Text("Hello, detail")
    }
}

struct SettingsIcon: View {
    var imageName: String
    var gradient: Gradient
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .background(
                    LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                        .cornerRadius(16)
                )
                .foregroundColor(.clear)
                .frame(width: 45, height: 45)
            
            Image(systemName: imageName)
                .resizable()
                .frame(maxWidth: 20, maxHeight: 20)
                .scaledToFill()
                .foregroundColor(.white)
                
            
            
        }
    }
}

struct SettingsListRow: View {
    var element: SettingsElement
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            Spacer()
            HStack {

                SettingsIcon(imageName: element.imageName, gradient: element.gradient)
                    .padding(.trailing, 7)
                            
                VStack(alignment: .leading, spacing: 3) {
                    Text(element.title).bold()
                    
                    Text(element.subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }.background(Color.green.opacity(0.01))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SettingsElement: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var imageName: String
    var gradient: Gradient
}
