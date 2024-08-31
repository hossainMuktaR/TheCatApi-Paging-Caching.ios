//
//  CatDetailScreen.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import SwiftUI

struct CatDetailScreen: View {
    var cat: Cat
    var body: some View {
        ScrollView{
            VStack {
                CachedAsyncImage(url: cat.url)
                    .aspectRatio(contentMode: .fill)
                
                VStack{
                    if let catBread = cat.breeds.first {
                        HStack{
                            Text("Name :")
                                .font(.headline)
                            Text(catBread.name)
                                .font(.body)
                        }
                        Divider()
                        HStack{
                            Text("Origin :")
                                .font(.headline)
                            Text(catBread.origin)
                                .font(.subheadline)
                        }
                        Divider()
                        HStack{
                            Text("Temperament :")
                                .font(.headline)
                            Text(catBread.temperament)
                                .font(.subheadline)
                        }
                        Divider()
                        VStack {
                            Text("Description")
                                .font(.title)
                            Text(catBread.description)
                                .font(.body)
                        }
                    }
                }
                .padding()
                Spacer()
                
            }
            .navigationTitle(cat.breeds.first!.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CatDetailScreen(
        cat: Cat.example
    )
}
