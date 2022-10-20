//
//  ContentView.swift
//  WeatherDemo
//
//  Created by admin on 20.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            WelcomeView()
                .environmentObject(locationManager )
        }
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.178))
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
