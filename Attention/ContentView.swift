//
//  ContentView.swift
//  Attention
//
//  Created by Liam on 10/15/19.
//  Copyright © 2019 LJ Software Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var message = "Press for Attention";
    @State var buttonDisabled = false;
    @State var backgroundColor = Color(UIColor(red:0.51, green:0.51, blue:0.51, alpha:1.0));
    var body: some View {
        Button(action:{
            self.message = "Attention Incoming";
            let secondsToDelay = 3.0
            self.buttonDisabled = true;
            self.backgroundColor = Color(UIColor(red:0.66, green:0.66, blue:0.66, alpha:1.0));
            DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
                
                let session = URLSession.shared
                let url = URL(string: "https://maker.ifttt.com/trigger/elizabethAttention/with/key/bMk1TCAtjGRas6dRqCTX52")!
                
                let task = session.dataTask(with: url) { data, response, error in
                    //print(data ?? "No Data")
                    //print(response ?? "No Response")
                    // print(error ?? "No Error")
                }
                task.resume()
 
                self.message = "Press for Attention";
                self.buttonDisabled = false;
                self.backgroundColor = Color(UIColor(red:0.51, green:0.51, blue:0.51, alpha:1.0));
            }
        }) {
            Text("\(message)")
                .fontWeight(.bold)
                .padding()
                .background(backgroundColor)
                .foregroundColor(Color.white)
                .cornerRadius(40)
        }.disabled(buttonDisabled);
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
