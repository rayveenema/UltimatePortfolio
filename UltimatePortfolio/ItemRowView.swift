//
//  ItemRowView.swift
//  UltimatePortfolio
//
//  Created by Ray on 1/10/21.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var item: Item

    var body: some View {
            NavigationLink(destination: EditItemView(item: item)) {
                Text(item.itemTitle)
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: Item.example)
    }
}
