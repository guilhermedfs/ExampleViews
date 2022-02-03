//
//  ViewBuilderExample.swift
//  BaseAssets
//
//  Created by Guilherme - ília on 02/02/22.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }

            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
       
    }
}

struct HeaderViewGeneric<T: View>: View {
    let title: String
    let content: T
    
    init(title: String, @ViewBuilder content: () -> T) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content

            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content:View>:View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderExample: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New title", description: "Description")
            
            HeaderViewRegular(title: "New title", description: nil)
            
            HeaderViewGeneric(title: "Home") {
                HStack {
                    Text("Hi")
                    Image(systemName: "heart.fill")
                        .foregroundColor(.pink)
                }
            }
            
            CustomHStack {
                Text("Hi")
                Text("Hi")
                Text("Hi")
                Text("Hi")
                Text("Hi")
            }
            
            Spacer()
        }
    }
}

struct ViewBuilderExample_Previews: PreviewProvider {
    static var previews: some View {
//        ViewBuilderExample()
        LocalViewBuilder(type: .two)
    }
}

struct LocalViewBuilder: View {
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
           viewTwo
        case .three:
           viewThree
        }
    }
    
    private var viewOne: some View {
        Text("One!")
    }
    
    private var viewTwo: some View {
        VStack {
            Text("Two!")
            Image(systemName: "heart.fill")
        }
    }
    
    private var viewThree: some View {
        HStack {
            Image(systemName: "heart.fill")
            Image(systemName: "house.fill")
        }
    }
}
