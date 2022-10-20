//
//  WeatherView.swift
//  O-Weather
//
//  Created by admin on 20.10.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute().second()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            switch weather.weather[0].main{
                            case "Clear":
                                Image(systemName: "sun.max")
                                    .font(.system(size: 50))
                            case "Clouds":
                                Image(systemName: "cloud")
                                    .font(.system(size: 50))
                            case "Cain":
                                Image(systemName: "cloud.drizzle")
                                    .font(.system(size: 50))
                            case "Snow":
                                Image(systemName: "cloud.snow")
                                    .font(.system(size: 50))
                            case "Extreme":
                                Image(systemName: "cloud.bolt.rain")
                                    .font(.system(size: 50))
                            default:
                                Image(systemName: "eye")
                                    .font(.system(size: 50))
                            }
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading )
                        Spacer()
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.light)
                            .padding()
                            
                    }
                    Spacer()
                        
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack{
                Spacer()
                VStack(alignment: .leading,spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temperature", value: weather.main.temp_min.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temperature", value: weather.main.temp_max.roundDouble() + "°")
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + " m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity              ", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.white)
                .background(Color(hue: 1.0, saturation: 0.025, brightness: 0.228))
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(.black)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
