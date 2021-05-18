//
//  FoodNutritionDetails.swift
//  BarcodeScanner
//
//  Created by Ahmad Malik on 3/1/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI

 

struct FoodNutritionDetails: View {

   

    @Binding var code: String

   

    var body: some View {

        /*

         foodItem global variable was obtained in NutritionixApiData.swift

         A Form cannot have more than 10 Sections. Group the Sections if more than 10.

         */

        Form {

            Group {

                Section(header: Text("Brand Name")) {

                    Text(verbatim: foodItem.brandName)

                }

                Section(header: Text("Food Name")) {

                    Text(verbatim: foodItem.foodName)

                }

                Section(header: Text("Food Item Photo")) {

                    getImageFromUrl(url: foodItem.imageUrl)

                        .resizable()

                        .aspectRatio(contentMode: .fit)

                }

                Section(header: Text("Food Ingredients")) {

                    Text(verbatim: foodItem.ingredients)

                }

                Section(header: Text("Serving Size")) {

                    Text("\(foodItem.servingQuantity) \(foodItem.servingUnit) (\(foodItem.servingWeight))")

                }

                Section(header: Text("Serving Size Calories")) {

                    Text(verbatim: foodItem.calories)

                }

            }

            Group {

                Section(header: Text("Serving Size Dietary Fiber")) {

                    Text(verbatim: foodItem.dietaryFiber)

                }

                Section(header: Text("Serving Size Protein")) {

                    Text(verbatim: foodItem.protein)

                }

                Section(header: Text("Serving Size Saturated Fat")) {

                    Text(verbatim: foodItem.saturatedFat)

                }

                Section(header: Text("Serving Size Sodium")) {

                    Text(verbatim: foodItem.sodium)

                }

                Section(header: Text("Serving Size Sugars")) {

                    Text(verbatim: foodItem.sugars)

                }

                Section(header: Text("Serving Size Total Carbohydrate")) {

                    Text(verbatim: foodItem.totalCarbohydrate)

                }

                Section(header: Text("Serving Size Total Fat")) {

                    Text(verbatim: foodItem.totalFat)

                }

            }

            Divider()

            /*

             ********************************************************

             There is a navigation bug in Apple's code as of iOS 13.3

             After the second food barcode scan, the app crashes.

             The following is a workaround to the navigation issue.

             ********************************************************

             */

            Group {

                Section(header: Text("End of Nutrition Details")) {

                    Button(action: {

                        /*

                         Upon making ScanFoodBarcode's @State variable empty, it invalidates

                         its appearance and recomputes its body view resulting in the display

                         of the barcode scanning camera view to enable another scan.

                         */

                        self.code = ""

                    }) {

                        HStack {

                            Image(systemName: "arrow.left.square.fill")

                                .imageScale(.large)

                                .font(Font.title.weight(.regular))

                            Text("Go Back")

                                .font(.headline)

                        }

                    }

                }

            }

 

        }   // End of Form

        .navigationBarTitle(Text("Nutrition Details"), displayMode: .inline)

        .navigationBarBackButtonHidden(true)    // Needed for the workaround solution

        .font(.system(size: 14))

    }

}

 

struct FoodNutritionDetails_Previews: PreviewProvider {

    static var previews: some View {

        FoodNutritionDetails(code: .constant(""))

    }

}

 
