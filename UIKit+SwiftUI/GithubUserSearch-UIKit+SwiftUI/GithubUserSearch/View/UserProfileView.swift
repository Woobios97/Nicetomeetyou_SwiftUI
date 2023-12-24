//
//  UserProfileView.swift
//  GithubUserSearch
//
//  Created by 김우섭 on 12/24/23.
//

import SwiftUI
import Kingfisher

struct UserProfileView: View {
    
    /*
    model를 들고 있기보다는 viewModel를 들고 있어서 가공해서 들고 있는 것이 좋을 것 같다.
     @Published가 세팅이 되면, @StateObject는 그걸 알아차려서 body쪽 view를
     렌더링를 다시 한다. -> 데이터가 응답을 받으면 자동으로 렌더링이 된다.
    */
    
    @StateObject var viewModel: UserProfileViewModel
    
    var body: some View {
        VStack(spacing: 80) {
            KFImage(viewModel.imageURL)
                .resizable()
                .frame(width: 160, height: 160)
                .background(.gray)
                .cornerRadius(80)
            
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.name)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    Text(viewModel.login)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.followers)
                    Text(viewModel.following)
                }
                .font(.system(size: 18))
                .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        }.onAppear {
            let id = viewModel.loginID
            viewModel.search(keyword: id)
        }
    }
}

#Preview {
    UserProfileView(viewModel: UserProfileViewModel(network: NetworkService(configuration: .default), loginID: "woobios97"))
}
