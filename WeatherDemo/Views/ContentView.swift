//
//  ContentView.swift
//  WeatherDemo
//
//  Created by admin on 20.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
//                Text("Your coordinates: \(location.longitude), \(location.latitude)")
                if let weather = weather {
                WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                            } catch {
                                print("Error getting weather:\(error )")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager )
                }
            }
        }
        .background(.black)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
