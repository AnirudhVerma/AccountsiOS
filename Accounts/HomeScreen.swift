//
//  HomeScreen.swift
//  Accounts
//
//  Created by Apple on 23/07/21.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    var body: some View{
        TabView{
            Text("Home")
                .tabItem {
                Text("Home")
                Image(systemName: "house")
            }
            
            Text("Settings")
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gear")
                }
        }
    }
}
