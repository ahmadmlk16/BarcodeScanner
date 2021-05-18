//
//  EnterFoodBarcodeUPC.swift
//  BarcodeScanner
//
//  Created by Ahmad Malik on 3/1/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI

 

struct EnterFoodBarcodeUPC: View {

       

    @State private var upcTextFieldValue = ""

    @State private var upcEntered = ""

   

    var body: some View {

        VStack {

            HStack {

                Text("UPC: ")

                TextField("Enter Food UPC", text: $upcTextFieldValue,

                    onCommit: {

                        self.upcEntered = self.upcTextFieldValue

                    }

                ).textFieldStyle(RoundedBorderTextFieldStyle())

               

                // Button to clear the text field

                Button(action: {

                    self.upcTextFieldValue = ""

                    self.upcEntered = ""

                }) {

                    Image(systemName: "multiply.circle")

                        .imageScale(.medium)

                        .font(Font.title.weight(.regular))

                }

            }   // End of HStack

            .padding(.horizontal)

 

            if !upcEntered.isEmpty {

                foodItemNutritionDetails

                    .padding(.top)

            }

        }   // End of VStack

    }

   

    var foodItemNutritionDetails: some View {

       

        // Public function getNutritionDataFromApi is given in NutritionixApiData.swift

        getNutritionDataFromApi(upc: self.upcEntered)

       

        if foodItem.foodName.isEmpty {

            return AnyView(noNutritionData)

        }

 

        return AnyView(

            FoodNutritionDetails(code: self.$upcEntered)

                .onDisappear() {

                    self.upcTextFieldValue = ""

            }

        )

    }

   

    var noNutritionData: some View {

        VStack {

            Image(systemName: "exclamationmark.triangle")

                .imageScale(.large)

                .font(Font.title.weight(.medium))

                .foregroundColor(.red)

            Text("No Data for the Entered Item! \nThe Nutritionix API did not return data for the entered item with UPC \(self.upcEntered)!")

                .font(.body)

                .padding()

                .multilineTextAlignment(.center)

        }

    }

}

 

struct EnterFoodBarcodeUPC_Previews: PreviewProvider {

    static var previews: some View {

        EnterFoodBarcodeUPC()

    }

}

 
