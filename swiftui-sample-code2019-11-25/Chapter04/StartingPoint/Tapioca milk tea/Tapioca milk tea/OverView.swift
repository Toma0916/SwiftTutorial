//
//  OverView.swift
//  Tapioca milk tea
//
//  Created by 鈴木透馬 on 2020/04/14.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct OverView: View {
    
    @State private var flavor: Int = 0
    @State private var nataDeCoco = false
    @State private var iceCream: Int = 0
    @State private var quantity = 1
    @State private var other = ""
    var body: some View {
        VStack{
            Image("tapioca_preview")
            
            HStack{
                Text("Select flavor")
                Picker(selection: $flavor,
                       label: Text("Select flavor")) {
                        ForEach(0..<flavorArray.count) {
                            Text(flavorArray[$0])
                        }
                }.labelsHidden()
                    .frame(minWidth: 250)
                    .clipped()
            }
            
            Toggle(isOn: $nataDeCoco) {
                Text("Nata de coco topping")
            }
            
            Picker(selection: $iceCream,
                   label: Text("Ice cream topping")) {
                    ForEach(0..<iceCreamArray.count)
                    {
                        Text(iceCreamArray[$0])
                    }
            }.pickerStyle(SegmentedPickerStyle())
            
            Stepper(value: $quantity, in: 1...10) {
                Text("Quantity: \(quantity)")
            }
            
            TextField("Other request",
                      text: $other)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
            
            Button(action: {}) {
                Text("Order")
            }
            
        }.padding()
        
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView()
    }
}
