//
//  WelcomeView.swift
//  O-Weather
//
//  Created by admin on 20.10.2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            
            Image(systemName: "cloud.sun")
                .font(.system(size: 100))
                .frame(width: 150, height: 150)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.015, brightness: 0.155))
                .cornerRadius(50)
                .foregroundColor(.orange)
            
            VStack(spacing: 20){
                Text("Welcome to O-Weather")
                    .font(.title)
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(20)
//            .symbolVariant(.fill)
            .foregroundColor(.white)  //Text color
            .tint(Color(hue: 0.062, saturation: 1.0, brightness: 1.0))  //Background color
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity )
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
