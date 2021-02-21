//
//  Book.swift
//  JamPager
//
//  Created by Antonio Favata on 20/02/2021.
//

import Foundation

struct Book {
    let title: String
    let chapters: [Chapter]

    struct Chapter: PageGroup {
        let title: String
        let pages: [String]
    }
}

extension Book {

    private static let loremIpsum = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Blandit massa enim nec dui nunc mattis enim ut. Mollis nunc sed id semper risus in hendrerit gravida. Habitant morbi tristique senectus et netus et. Eu scelerisque felis imperdiet proin fermentum leo vel orci. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum. Sapien pellentesque habitant morbi tristique senectus et netus. Vel turpis nunc eget lorem. Morbi tempus iaculis urna id. Aliquam purus sit amet luctus venenatis. Nunc faucibus a pellentesque sit amet porttitor eget. Lobortis elementum nibh tellus molestie nunc non. Purus viverra accumsan in nisl nisi scelerisque. Nec feugiat in fermentum posuere urna. Nec dui nunc mattis enim ut tellus elementum sagittis. Aliquet nec ullamcorper sit amet risus nullam eget. Ut faucibus pulvinar elementum integer. Nam libero justo laoreet sit amet cursus sit. Vitae nunc sed velit dignissim sodales ut eu sem. Vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt.",
        "Magna fringilla urna porttitor rhoncus dolor. In arcu cursus euismod quis viverra. Nec nam aliquam sem et tortor consequat. Nisl pretium fusce id velit ut tortor pretium viverra. Morbi tristique senectus et netus et malesuada fames. Ut aliquam purus sit amet. Neque gravida in fermentum et sollicitudin. Nulla facilisi cras fermentum odio. Sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu. Quam elementum pulvinar etiam non quam lacus suspendisse. Ultricies mi eget mauris pharetra.",
        "Et tortor consequat id porta nibh venenatis cras sed. Cursus sit amet dictum sit amet justo donec enim diam. Viverra mauris in aliquam sem fringilla. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Purus faucibus ornare suspendisse sed nisi lacus sed viverra. Turpis egestas integer eget aliquet nibh. Massa ultricies mi quis hendrerit dolor. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Facilisis gravida neque convallis a. Ut aliquam purus sit amet luctus venenatis lectus magna. Eros in cursus turpis massa tincidunt dui ut ornare. Nibh tellus molestie nunc non blandit massa enim nec. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Nunc non blandit massa enim nec dui. Vivamus arcu felis bibendum ut tristique et egestas quis. Risus feugiat in ante metus dictum at tempor commodo.",
        "Orci phasellus egestas tellus rutrum tellus pellentesque. Ante in nibh mauris cursus mattis molestie a iaculis. Sed sed risus pretium quam. Lacus sed viverra tellus in hac. Ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin. Imperdiet massa tincidunt nunc pulvinar sapien et ligula. Amet tellus cras adipiscing enim eu. Arcu ac tortor dignissim convallis. Lorem sed risus ultricies tristique nulla aliquet. Lectus magna fringilla urna porttitor rhoncus. Tempus egestas sed sed risus pretium quam vulputate dignissim. Vitae tortor condimentum lacinia quis vel eros donec ac odio. Mi tempus imperdiet nulla malesuada pellentesque. Tempus iaculis urna id volutpat lacus laoreet. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing.",
        "Porttitor rhoncus dolor purus non. In nulla posuere sollicitudin aliquam ultrices sagittis orci a. Sit amet tellus cras adipiscing enim eu turpis. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada. Nam at lectus urna duis convallis convallis tellus. At quis risus sed vulputate odio ut enim blandit. Neque volutpat ac tincidunt vitae semper quis lectus nulla. Quam vulputate dignissim suspendisse in est ante in nibh. Vitae suscipit tellus mauris a diam maecenas sed enim. Praesent tristique magna sit amet. Felis eget velit aliquet sagittis id consectetur purus ut. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Euismod quis viverra nibh cras pulvinar mattis nunc. Nibh tellus molestie nunc non blandit massa enim."
    ]

    private static func random() -> Range<Int> {
        0 ..< .random(in: 2..<5)
    }

    static let example = Book(title: "Example book", chapters: (0..<10).map {
        Chapter(title: "Ch. \($0 + 1)", pages: random().map { loremIpsum[$0] })
    })
}
