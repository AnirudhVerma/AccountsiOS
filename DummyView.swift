//
//  DummyView.swift
//  Accounts
//
//  Created by Apple on 22/07/21.
//


import SwiftUI

struct DummyView: View {
    
    var username: String = ""
    var password: String = ""
    
    var body: some View {
        VStack{
           Text("Hello " + username + "!")
            Text("The password you entered was " + password)
        } //.navigationBarBackButtonHidden(true)
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView.init(username: "Name", password: "String")
    }

}

