//
//  TabBarView.swift
//  FlightScanner
//
//  Created by Lars Neeft on 06/12/2021.
//

import SwiftUI

struct TabBarView: View {
    @State private var showMenu = false
    @ObservedObject var router = ViewRouter()
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                router.view
                Spacer()
                
                HStack {
                    TabIcon(viewModel: .home, router: router)
                    TabIcon(viewModel: .search, router: router)
                    TabMenuButton(showMenu: $showMenu)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    TabIcon(viewModel: .notifications, router: router)
                    TabIcon(viewModel: .account, router: router)

                }
                .frame(height: UIScreen.main.bounds.height / 8)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
            }
            if showMenu {
                PopUpMenu()
                    .padding(.bottom, 144)
            }
            
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

struct TabIcon: View {
    let viewModel: TabBarViewModel
    @ObservedObject var router: ViewRouter
    
    var body: some View {
        Button {
            router.currentItem = viewModel
        } label: {
            Image(systemName: viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
    }
}

struct TabMenuButton: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .shadow(radius: 4)
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(Color(.systemBlue))
                .rotationEffect(Angle(degrees: showMenu ? 45: 0))
        }
        .offset(y: -44)
    }
}
