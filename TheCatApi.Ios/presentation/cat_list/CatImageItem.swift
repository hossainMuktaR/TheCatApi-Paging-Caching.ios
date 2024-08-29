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
            AsyncImage(url: URL(string: cat.url)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // Loading indicator
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80) // Set the size of the circle
                        .clipShape(Circle()) // Make the image circular
                        .overlay(Circle().stroke(Color.accentColor.opacity(0.5), lineWidth: 3)) // Optional: Add a border
//                        .shadow(radius: 10) // Optional: Add a shadow
                case .failure:
                    Image(systemName: "exclamationmark.triangle.fill") // Placeholder on error
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.red)
                        .clipShape(Circle()) // Make the placeholder circular
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 80, height: 80)
            .padding()
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
