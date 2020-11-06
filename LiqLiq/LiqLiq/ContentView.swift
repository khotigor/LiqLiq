//
//  ContentView.swift
//  LiqLiq
//
//  Created by Igor Khotyanovich on 06.11.2020.
//

import SwiftUI
import Combine


struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack(spacing: 10){
                NavigationLink(
                    destination: MyBottles(),
                    label: {
                        Text("My Bottles").foregroundColor(.white)
                    })
                    .frame(width: 300, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                
                NavigationLink(
                    destination: MyCocktail(),
                    label: {
                        Text("My Cocktail").foregroundColor(.white)
                    })
                    .frame(width: 300, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                NavigationLink(
                    destination: AllCocktail(),
                    label: {
                        Text("All Cocktail").foregroundColor(.white)
                    })
                    .frame(width: 300, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                NavigationLink(
                    destination: Advise(),
                    label: {
                        Text("Advise").foregroundColor(.white)
                    })
                    .frame(width: 300, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.gray)
                    .cornerRadius(10)
                
            }
        }
    }
}



struct Item: Identifiable {
    var isEnabled: Binding<Bool>
    var id: String { self.name }
    var name: String
    init(name: String, enabled enabledValue: Bool) {
        self.name = name
        let enabled = CurrentValueSubject<Bool, Never>(enabledValue)
        isEnabled = Binding<Bool>(
            get: { enabled.value },
            set: { enabled.value = $0}
        )
    }
}


final class ItemSet: ObservableObject {
    @Published var items: [Item]
    init() {
        items = [
            Item(name: "Whiskey/bourbon", enabled: false),
            Item(name:  "Conac/brandy", enabled: false),
            Item(name: "Light rum", enabled: false),
            Item(name: "Dark rum", enabled: false),
            Item(name: "Tequila", enabled: false),
            Item(name: "Vodka", enabled: false),
            Item(name: "Gin", enabled: false),
            Item(name: "Triple sec", enabled: false),
            Item(name:  "Bianco vermouth", enabled: false),
            Item(name: "Rosato vermouth", enabled: false),
            Item(name: "Dry vermouth", enabled: false),
            Item(name: "Angostura", enabled: false),
        ]
    }
}

var myBottles = ItemSet()

struct MyBottles: View {
    
    var body: some View {
        List {
            ForEach(myBottles.items) { item in
                Toggle(isOn: item.isEnabled, label: { Text (item.name) })
            }
        }
    }
}


struct MyCocktail: View {
    var body: some View{
        Text("MyCocktail")
    }
}

struct AllCocktail: View {
    var body: some View{
        Text("AllCocktail")
    }
}

struct Advise: View {
    var body: some View{
        Text("Advise")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
