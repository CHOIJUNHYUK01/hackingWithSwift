//
//  ContentView.swift
//  Moonshot
//
//  Created by CHOIJUNHYUK on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showGrid = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if showGrid {
                    GridLayout(columns: columns, missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar(content: {
                Toggle(showGrid ? "Grid" : "List", isOn: $showGrid)
                    .toggleStyle(.switch)
            })
            .navigationDestination(for: Astronaut.self) { crew in
                AstronautView(astronaut: crew)
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}

#Preview {
    ContentView()
}
