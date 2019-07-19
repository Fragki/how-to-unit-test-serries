//
//  AppDelegate.swift
//  CountriesOfTheWorld
//
//  Created by Fragkiskos Katsimpas on 16/07/2019.
//  Copyright © 2019 Fragkiskos Katsimpas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        guard let countriesListViewCountroller = self.window?.rootViewController as? CountriesListViewCountroller else {
            return true
        }
        let countries = [Country(name: "Greece"), Country(name: "United Kingdom"), Country(name: "France"), Country(name: "Spain")]
        let countriesDataSource = CountriesDataSource(countries: countries)
        countriesListViewCountroller.dataSource = countriesDataSource
        
        return true
    }


}

