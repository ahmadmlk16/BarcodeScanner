//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Ahmad Malik on 2/29/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI

 

struct ContentView: View {

    var body: some View {

        ZStack {

            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)

            NavigationView {

                VStack(alignment: .leading) {

                    Image("BarcodeScanning")

                        .resizable()

                        .aspectRatio(contentMode: .fit)

                        .frame(width: UIScreen.main.bounds.width - 60)

                        .padding(.bottom, 30)

                    NavigationLink(destination: ScanFoodBarcode()) {

                        HStack {

                            Image(systemName: "barcode.viewfinder")

                                .foregroundColor(.blue)

                                .imageScale(.large)

                                .font(Font.title.weight(.regular))

                                .frame(width: 60)

                            Text("Scan Food Barcode")

                                .font(.headline)

                        }

                    }.padding(.bottom, 30)

                   

                    NavigationLink(destination: EnterFoodBarcodeUPC()) {

                        HStack {

                            Image(systemName: "pencil.and.ellipsis.rectangle")

                                .foregroundColor(.blue)

                                .imageScale(.large)

                                .font(Font.title.weight(.regular))

                                .frame(width: 60)

                            Text("Enter Food Barcode Value")

                                .font(.headline)

                        }

                    }.padding(.bottom, 30)

                   

                    NavigationLink(destination: ScanQRBarcode()) {

                        HStack {

                            Image(systemName: "qrcode.viewfinder")

                                .foregroundColor(.blue)

                                .imageScale(.large)

                                .font(Font.title.weight(.regular))

                                .frame(width: 60)

                            Text("Scan QR Barcode")

                                .font(.headline)

                        }

                    }.padding(.bottom, 60)

                   

                    Text("Powered By")

                        .font(.headline)

               

                    NavigationLink(destination:

                        WebView(url: "https://www.nutritionix.com/business/api")

                            .navigationBarTitle(Text("Nutritionix API"), displayMode: .inline) )

                        {

                            Image("Nutritionix")

                                .renderingMode(.original)   // To keep the logo in its original form

                                .resizable()

                                .aspectRatio(contentMode: .fit)

                                .frame(height: 37)

                        }

               

                }   // End of VStack

                .navigationBarTitle(Text("Barcode Scanner"), displayMode: .inline)

           

            }   // End of NavigationView

        }   // End of ZStack

    }

}

 

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()

    }

}

 
