//
//  CatImageItem.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import SwiftUI

struct CatImageItem: View {
    var cat: Cat
    var body: some View {
        HStack(alignment: .center) {
            CachedAsyncImage(url: cat.url)
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80) // Set the size of the circle
                .clipShape(Circle()) // Make the image circular
                .overlay(Circle().stroke(Color.accentColor.opacity(0.5), lineWidth: 3))
            VStack(alignment: .leading, spacing: 0){
                if let catBread = cat.breeds.first {
                    Text(catBread.name)
                        .font(.title)
                    HStack{
                        Text(catBread.origin)
                        Spacer()
                        Text(catBread.lifeSpan)
                        Spacer()
                        Text(catBread.temperament)
                        Spacer()
                    }
                    Spacer()
                }
                
            }
            Spacer()
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 80)
        
        
    }
}
#Preview {
    CatImageItem(
        cat: Cat.example
    )
}
