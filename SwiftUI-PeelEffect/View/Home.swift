//
//  Home.swift
//  SwiftUI-PeelEffect
//
//  Created by Jay on 15/06/23.
//

import SwiftUI

struct Home: View {
    @State private var images:[AnimalModel] = []
    @State private var names:[String] = ["Fox","Lion","Wild Pig","Dog","Fox"]
    @State private var description:[String] = ["Fox","The lion, also known as the king of the jungle, is a magnificent and awe-inspiring creature. With its majestic mane, powerful roar, and commanding presence.","The wild pig, rugged and tenacious, roams the untamed wilderness. With its stout frame, bristly coat, and formidable tusks, it exudes a sense of power and resilience.","The dog, a loyal companion, fills our lives with joy and unconditional love. With wagging tails, playful antics, and gentle eyes, they bring comfort and companionship.","The fox, with its cunning nature and fiery red coat, captivates. With stealthy movements and sharp senses, it navigates the world with grace."]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(images) { image in
                    PeelEffect {
                        CardView(image)
                    } onDelete: {
                        if let index = images.firstIndex(where: { C1 in
                            C1.id == image.id
                        }) {
                            let _ =  withAnimation(.easeInOut(duration: 0.35)) {
                                images.remove(at: index)
                            }
                        }
                    }

                }
            }
            .padding(15)
        }
        .onAppear {
            for index in 1...4 {
                images.append(.init(assetName: "Pic \(index)", name: names[index], description: description[index]))
            }
        }
    }
    
    @ViewBuilder
    func CardView(_ animal: AnimalModel) -> some View {
        GeometryReader {
            let size = $0.size
            ZStack {
                HStack {
                    Image(animal.assetName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:100, height: 100)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text(animal.name)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                            .padding(.bottom,5)
                        
                        Text(animal.description)
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                            .font(.subheadline)
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.leading,15)
                .padding(.trailing,15)
                .padding(.top,15)
            }
        }
        .frame(height: 200)
        .contentShape(Rectangle())
        .background(Color.teal)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalModel: Identifiable {
    var id: UUID = .init()
    var assetName: String
    var name: String
    var description: String
}
