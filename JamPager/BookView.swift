//
//  BookView.swift
//  JamPager
//
//  Created by Antonio Favata on 20/02/2021.
//

import SwiftUI

struct BookView: View {
    let book: Book

    var body: some View {
        GroupedPageView(source: book.chapters) { chapter, page, index in
            VStack {
                HStack {
                    Text(chapter.title.replacingOccurrences(of: "Ch.", with: "Chapter"))
                    Spacer()
                    Text("\(index + 1)")
                }
                .font(.headline)
                .padding()

                Rectangle()
                    .frame(maxHeight: 1.0, alignment: .center)
                    .padding(.horizontal)

                Text(page).padding()

                Spacer()
            }
        } buttonLabel: { chapter, current in
            Text(chapter.title)
                .fontWeight(current ? .bold : .none)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: .example)
    }
}
