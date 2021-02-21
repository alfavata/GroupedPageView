//
//  ListView.swift
//  JamPager
//
//  Created by Antonio Favata on 21/02/2021.
//

import SwiftUI

struct ListView: View {

    let books = [Book](repeating: .example, count: 10)

    var body: some View {
        NavigationView {
            List {
                ForEach(books.indices) {
                    NavigationLink(books[$0].title, destination: BookView(book: books[$0]))
                }
            }
            .navigationTitle("Books")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
