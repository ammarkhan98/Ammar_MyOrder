//
//  ContentView.swift
//  Ammar_MyOrder
//
//  Created by Ammar Khan on 2021-09-29.
/*
    Student ID: 991439943
    Student Name: Ammar Ummar Khan
 
    Reflection: The overall experience of coding and creating this coffee app was fun. The only real challenge I faced was when I couldn't get the Picker widget to work. I later found out that you have to just write "Text($0)" instead of "Text(self.$typeSelected)". This way it just gets the value of the option being clicked. Where as when I had "self.$typeSelected" it didn't read the values cause the data given to pick from is from an array. In array's you have to get values by using the index of array. Which I later realize was a foolish mistake I made with implementing this Picker widget. In the future, I'll be more careful on how to read and think thoroughly of how to implement various widgets.
 
    References Used:
    1. Picker = https://youtu.be/Ho88Eid9gi0
    2. NavigationBar Title Color = https://youtu.be/0SmlDmIJ-sg
    3. Picker Issue Getting the Value from option clicked fixed from: https://stackoverflow.com/questions/58880536/why-does-this-swiftui-picker-code-not-work
 
 */

import SwiftUI


struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode

    let typeCoffee = ["Original Blend", "Caramel Macchiato", "Cappuccino", "Black", "French Vanilla", "Espresso", "Ristretto", "Americano", "Flat White", "Piccolo Latte", "Mocha", "Affogato", "Irish Coffee"]
    
    let sizeCoffee = ["XSmall", "Small", "Medium", "Large", "XLarge"]
    
    //created this init in order to change the color of the navigationBar title
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))]
    }
    
    @State private var typeSelected = ""
    @State private var sizeSelected = ""
    @State private var numCoffee = ""
    @State private var cupsUsed = ""
    @State var coffeeOrderList = [Order]()
    
    
    @State private var selection: Int? = nil

    
    var body: some View {
       
        
        NavigationView{
            
    
            VStack {
                
                NavigationLink(destination: OrderView(coffee_order_list: self.coffeeOrderList), tag: 1, selection: self.$selection){}.hidden()
                
               
            Form {
                
                
                Section(header: Text("Choose your type of coffee")){
                    Picker("Choose your coffee", selection: $typeSelected){
                        
                        ForEach(typeCoffee, id: \.self)
                        {
                            Text($0)
                        }
                    }
                }//Section for the type of coffee picked
                
                Section(header: Text("Choose your cup size")){
                    Picker("Size of coffee", selection: $sizeSelected){
                        ForEach(sizeCoffee, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }//Section for the size of the coffee cups
                
                Section(header: Text("Choose the amount ")){
                    TextField("Number of Coffees", text: $numCoffee).keyboardType(.numberPad)
                        .padding(10)
                        
                }//Section for number of coffee cups picked
                
                Section{
                    
                    Button(action:
                            {
                                
                                
                                var order = Order()
                                order.typeSelected = typeSelected
                                order.sizeSelected = sizeSelected
                                order.numCoffee = numCoffee
                                coffeeOrderList.append(order)
                                print("This order has been placed: \(order)")
                                
                                
                            }){
                        
                        
                        
                        Text("Place Order")
                                
                    }//Button
                   
                }//Section for the Button
            }//Form
            .navigationTitle("Order Now 😊")
            .navigationBarItems(trailing: Button("Orders", action: self.goToOrderView))
            
            }//VStack
            
        }//NavigationView
        
        
    }
    
    private func goToOrderView()
    {
        
        //to navigate to HomeView
        self.selection = 1
        self.presentationMode.wrappedValue.dismiss()
       
    }
    
   private func addOrder()
    {
       
        let order = Order()
        self.coffeeOrderList.append(order)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
