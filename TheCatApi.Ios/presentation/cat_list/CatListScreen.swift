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
        ZStack{
        if vm.state.isLoading {
                ProgressView()
            } else if let cat = vm.state.cat {
                NavigationStack{
                    ScrollView{
                        LazyVStack(spacing: 0){
                            ForEach(cat, id: \.id) { cat in
                                NavigationLink(destination: CatDetailScreen(cat: cat)) {
                                    CatImageItem(cat: cat)
                                }
                                Divider()
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                    .navigationTitle("Cat")
                }
            } else if let error = vm.state.error {
                VStack{
                    Text("Something gone wrong")
                    Text("\(error)")
                }
            }
        }.onAppear {
            vm.getImages()
        }
        
    }
}
#Preview {
    CatListScreen()
}
