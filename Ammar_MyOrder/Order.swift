//
//  Order.swift
//  Ammar_MyOrder
//
//  Created by Ammar Khan on 2021-09-30.
//
/*
    Student ID: 991439943
    Student Name: Ammar Ummar Khan
    
 Reflection: The overall experience of coding and creating this coffee app was fun. The only real challenge I faced was when I couldn't get the Picker widget to work. I later found out that you have to just write "Text($0)" instead of "Text(self.$typeSelected)". This way it just gets the value of the option being clicked. Where as when I had "self.$typeSelected" it didn't read the values cause the data given to pick from is from an array. In array's you have to get values by using the index of array. Which I later realize was a foolish mistake I made with implementing this Picker widget. In the future, I'll be more careful on how to read and think thoroughly of how to implement various widgets.
 
    References Used:
    1. Picker = https://youtu.be/Ho88Eid9gi0
    2. NavigationBar Title Color = https://youtu.be/0SmlDmIJ-sg
    3. Picker Issue Getting the Value from option clicked fixed from: https://stackoverflow.com/questions/58880536/why-does-this-swiftui-picker-code-not-work
 
 */

import Foundation

struct Order: Identifiable, Hashable{
    var id = UUID()
    var typeSelected: String = ""
    var sizeSelected: String = ""
    var numCoffee: String = ""

    init() {
        
    }
    
    init(typeSelected: String, sizeSelected: String, numCoffee: String)
    {
        self.typeSelected = typeSelected
        self.sizeSelected = sizeSelected
        self.numCoffee = numCoffee
    }
}

