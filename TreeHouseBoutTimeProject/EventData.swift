//
//  EventData.swift
//  TreeHouseBoutTimeProject
//
//  Created by Joey Devlin on 7/30/18.
//  Copyright © 2018 Joey. All rights reserved.
//

import Foundation
import GameKit

class Events {
    
    
    
    class func getSpaceEvents() -> [event] {
        return [
            event(event: "First telescopic observation of the night sky: discovery of Jupiter's moons, lunar craters and the phases of Venus. ", date: 1610),
            event(event: "First clear telescopic photograph of another world: the Moon. ", date: 1840),
            event(event: "Oberth, with students including Wernher von Braun, launches his first liquid-fueled rocket ", date: 1929),
            event(event: "Goddard launches the first liquid-fueled rocket ", date: 1926),
            event(event: "The Explorer II balloon takes two people to 22,066 metres (72,395 ft), where they observe and photograph the curvature of the Earth. (Sorry FlatEarthers)", date: 1935),
            event(event: "First man-made object to cross what would later be defined as the Kármán line and hence first spaceflight in history. ", date: 1944),
            event(event: "First dogs in space (Dezik and Tsygan)", date: 1951),
            event(event: "First artificial satellite and signals from space", date: 1957),
            event(event: "First photograph of Earth from orbit ", date: 1958),
            event(event: "First impact into another world (the Moon): USSR", date: 1959),
            event(event: "First photos of another world from space: The far side of the Moon", date: 1960),
            event(event: "First human spaceflight (Yuri Gagarin)", date: 1961),
            event(event: "First human on the Moon, and first space launch from a celestial body other than the Earth", date: 1969),
            event(event: "The first propulsive landing for an orbital rocket. ", date: 2015),
            event(event: "Space-X launches a car towards Mars Via Falcon Heavy(will miss Mars)", date: 2018),
            event(event: "The Apollo 13 Mission", date: 1970),
            event(event: "The Space Shuttle Challenger explosion", date: 1986),
            event(event: "Shannon Lucid returns to Earth after 188-day Mir mission, a U.S. space endurance record and a world record for women", date: 1996),
            event(event: "Final space shuttle mission ends when Atlantis arrives at Kennedy Space Center", date: 2011),
            event(event: "Atlantis docks with Mir in first shuttle-station hookup.", date: 1995),
            event(event: "The Hubble Space Telescope was launched into orbit, searching deep into space looking for Earth-Like Planets", date: 1990 ),
            event(event: "Yalta Conference", date: 1945),
            event(event: "The United States dropps atomic bomb on Hiroshima and Nagasaki ", date: 1946),
            event(event: "Bay of Pigs Invasion", date: 1962),
            event(event: "JFK Assassination", date: 1963),
            event(event: "Chernobyl Disaster", date: 1987),
            event(event: "Fall of the Berlin Wall", date: 1989),
            event(event: "End of the Soviet Union", date: 1991)
        ]
    }
    
    
    class func getEvent() -> event {
        let events = Events.getSpaceEvents()
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        let event1 = events[randomNumber]
        
        return event1
    }
    
    
    
}
