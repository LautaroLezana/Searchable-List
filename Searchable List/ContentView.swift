//
//  ContentView.swift
//  Searchable List
//
//  Created by Lautaro matias Lezana luna on 03/11/2023.
//

import SwiftUI

struct ListView_6: View {
    @State var selectedAction: String = ""
    @State private var searchText = ""
    
    struct Device {
        let name: String
        let systemImage: String
    }
    
    let arrayOfData = [
        Device(name: "Sun", systemImage: "sun.max.fill"),
        Device(name: "Cloud Bolt", systemImage: "cloud.bolt.rain.fill"),
        Device(name: "Sun Rain", systemImage: "cloud.sun.rain.fill"),
        Device(name: "Snow", systemImage: "sun.snow.fill"),
        Device(name: "Moon", systemImage: "moon.fill"),
        Device(name: "Dust", systemImage: "moon.dust.fill"),
        Device(name: "Thermometer", systemImage: "thermometer.sun.fill")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredData, id: \.name) { device in
                    Label(device.name, systemImage: device.systemImage)
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                        .padding(.vertical, 12)
                        .swipeActions(edge: .trailing) {
                            Button {
                                selectedAction = "Favorite"
                            } label: {
                                Label("Favorite", systemImage: "star.fill")
                                    .tint(.yellow)
                                    
                            }
                            Button {
                                selectedAction = "Share"
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                selectedAction = "Delete"
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                                    .tint(.red)
                            }
                        }
                        .listRowBackground(Color.black)
                }
            }
            .navigationTitle(selectedAction.isEmpty ? "Search List" : selectedAction + " 🎉")
            .preferredColorScheme(.dark)
        }
        .searchable(text: $searchText)
    }
    
    var filteredData: [Device] {
        guard searchText.isEmpty else {
            return arrayOfData.filter { $0.name.contains(searchText) }
        }
        
        return arrayOfData
    }
}

#Preview {
    ListView_6()
}
