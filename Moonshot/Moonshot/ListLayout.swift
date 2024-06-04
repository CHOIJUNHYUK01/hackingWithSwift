//
//  ListLayout.swift
//  Moonshot
//
//  Created by CHOIJUNHYUK on 6/4/24.
//

import SwiftUI

struct ListLayout: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    var body: some View {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            Spacer()
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text(mission.displayName)
                                    .font(.title.bold())
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground, lineWidth: 1)
                    )
                    
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 5)
                .padding(.horizontal, 20)
                .background(.darkBackground)
            }
            .listStyle(.plain)
    }
}
