//
//  HomeView.swift
//  UltimatePortfolio
//
//  Created by Ray on 1/8/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    static let tag: String? = "Home"
    
    var body: some View {
        VStack{
            // Create new data in memory when selected
            Button("Add Data") {
                dataController.deleteAll()
                try? dataController.createSampleData()
            }
        }
        .navigationTitle("Home")
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
