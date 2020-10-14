//
//  CategoryRowView.swift
//  Landmarks
//
//  Created by vphom on 10/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRowView: View {
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            ScrollView(.horizontal,showsIndicators:false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(self.items){ landmark in
                        NavigationLink( destination: LandmarkDetail(landmark: landmark)){
                            CategoryItem(landmark:landmark)
                        }

                    }
                }
            }
            .frame(height: 185)
            
        }
    }
}

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading){
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading,15)
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(categoryName: landmarkData[0].category.rawValue,
                        items: Array(landmarkData.prefix(4)))
    }
}

