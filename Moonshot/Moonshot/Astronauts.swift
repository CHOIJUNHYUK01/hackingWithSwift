//
//  Astronauts.swift
//  Moonshot
//
//  Created by CHOIJUNHYUK on 6/3/24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
