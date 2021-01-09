//
//  HomeView.swift
//  UltimatePortfolio
//
//  Created by Ray on 1/8/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        VStack{
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