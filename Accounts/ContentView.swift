//
//  ContentView.swift
//  Accounts
//
//  Created by Apple on 20/07/21.
//

import SwiftUI

let lightGreyColor = Color(red: 239/255, green: 243/255, blue: 244/255)

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State var selection: Int? = nil
    @State var showsAlert = false
    
    var body: some View {
        NavigationView {
            VStack{
                HelloText()
                Icon()
                LoginText()
                TextField("Phone Number",
                          text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .keyboardType(.numberPad)
                    .onReceive(username.publisher.collect()) {
                            username = String($0.prefix(10))
                          }
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
 
                NavigationLink(destination: DummyView(), tag: 1, selection: $selection) {
                    Button.init(action: {
                        if(password == "password"){
                            self.selection = 1
                        }
                        else{
                            showsAlert = true
                        }
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .cornerRadius(35)
                    }
                                }
                
//                NavigationLink(destination:  DummyView.init(username: username, password: password), tag: 1, selection: $selection) {
//
//                    Button.init(action: {
//                        if !isValidPassword(text: password){
//                            showsAlert = true
//                        }
//                        else{
//                            self.selection = 1
//                        }
//                    }, label: {
//                        Text("Login")
//                    }).alert(isPresented: self.$showsAlert) {
//                        Alert(title: Text("The password you entered is incorrect, please try again"))
//                    }
//            }
                
                NavigationLink(destination:  DummyView.init(username: username, password: password), tag: 1, selection: $selection) {
                    
                    Button.init(action: {
                            self.selection = 1
                        
                    }, label: {
                        Text("Login!")
                    }).alert(isPresented: self.$showsAlert) {
                        Alert(title: Text("The password you entered is incorrect, please try again"))
                    }
                }
                
                NavigationLink(
                    destination: HomeScreen(),
                    label: {
                        Text("Home")
                    })
                
                
//                    Button(
//                                                        ("Login")) {
//                                                        self.selection = 1
//                                                    }
//                                                }
                
            }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HelloText: View {
    var body: some View {
        Text("Hello You!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom)
    }
}

struct Icon: View {
    var body: some View {
        Image("sunset")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 128, height: 128)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 24)
    }
}

struct LoginText: View {
    var body: some View {
        HStack{Text("Login to continue")
            .bold()
            .padding()
            Spacer()
        }
    }
}


func isValidPassword(text: String) -> Bool {
    // least one uppercase,
    // least one digit
    // least one lowercase
    // least one symbol
    //  min 8 characters total
    let password = text.trimmingCharacters(in: CharacterSet.whitespaces)
    let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
    let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
    return passwordCheck.evaluate(with: password)
}
}
//func checkPassword(`var` password: String) ->Bool {
//    if(password == "password"){
//        NavigationLink(destination:  DummyView.init(username: username, password: password), tag: 1, selection: $selection) {
//                                            Button(("Login")) {
//                                                self.selection = 1
//                                            }
//                                        }
//    }
//}
