//
//  ArticleRow.swift
//  eBoutique
//
//  Created by Erin Herzstein on 2021-05-21.
//  Copyright © 2021 Erin Herzstein. All rights reserved.
//

import SwiftUI

struct ArticleRow: View {
    var categoryName: String
    var articles: [Article]
    var body: some View {
        
       //for all the rows
        VStack(alignment: .leading)
        {
            Text(self.categoryName.uppercased())
                .font(.title)
                .foregroundColor(.blue)
               
            ScrollView(.horizontal, showsIndicators: false)
            {
                HStack
                {
                    ForEach(self.articles) {article in
                        NavigationLink(destination: ArticleDetail(article: article))
                        {
                            ArticleItem(article: article)
                                                       .frame(width: 300)
                                            .padding(.trailing,30)
                        }
                        
                    }
                    
                }//Fin Hstack
                
            }//Fin scrollView
            
        }//Fin Vstack
        
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(categoryName: "boots", articles: articleData)
    }
}
