//
//  GridLayout.swift
//  Moonshot
//
//  Created by CHOIJUNHYUK on 6/4/24.
//

import SwiftUI

struct GridLayout: View {
    var columns: [GridItem]
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                    
//                    NavigationLink {
//                        MissionView(mission: mission, astronauts: astronauts)
//                    } label: {
//                        
//                    }
                }
            })
            .padding([.horizontal, .bottom])
        }
    }
}
