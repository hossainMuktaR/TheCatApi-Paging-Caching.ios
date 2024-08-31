//
//  CatListScreen.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import SwiftUI

struct CatListScreen: View {
    @State var vm = CatListViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                
                List{
                    ForEach(vm.cat, id: \.id) { cat in
                        NavigationLink(destination: CatDetailScreen(cat: cat)) {
                            CatImageItem(cat: cat)
                        }
                    }
                    if vm.isLoading {
                        HStack {
                            Spacer()
                            Image(systemName: "circle.circle")
                            Spacer()
                        }
                    } else {
                        Color.clear
                            .onAppear {
                                vm.getImages()
                            }
                    }
                }
                    
            }
            .navigationTitle("Cat")
        }
    }
}
#Preview {
    CatListScreen()
}
