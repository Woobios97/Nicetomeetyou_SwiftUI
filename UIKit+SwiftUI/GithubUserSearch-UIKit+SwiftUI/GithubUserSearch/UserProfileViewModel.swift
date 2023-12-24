//
//  UserProfileViewModel.swift
//  GithubUserSearch
//
//  Created by 김우섭 on 12/24/23.
//

import Foundation
import Combine

final class UserProfileViewModel: ObservableObject {
    
    let loginID: String
    
    let network: NetworkService
    
    @Published var selectedUser: UserProfile?
    // 세팅되었을 떄 자동으로 업데이트가 되어야하기때문에, @Published로 설정해놓는다.
    
    var subscriptions = Set<AnyCancellable>()
    
    init(network: NetworkService, loginID: String) {
        self.network = network
        self.loginID = loginID
    }
    
    /*
     클릭을 했을 때, 클릭된 키워드를 가지고,
     viewModel이 키워드를 받아서 네트워크요청을 해서 세팅하는 것이다.
     네트워크의 요청의 결과가 selectedUserProfile이다. 그래서,
     init(초기화)를 통해서 외부에서 값을 주입받아야 한다.
     키워드를 UserProfileViewModel에 넘겨줄 것이다. 그러면, 뷰모델은 loginID를 가지고 네트워크에 요청을 할 것이다. (ex: ID관련해서 유저프로필을 보여줘라 -> 요청할 때는 NetworkService가 필요한 것이다.)
     그 결과물이 selectedUserProfile로 세팅이 되는 것이다.
     세팅이 된다면? -> UserProfile에서 UserProfileView가 자동으로 렌더링이 되고(selectedUserProfile이 @Published이고, UserProfileViewModel은 ObservableObject이기 때문에),
     UserProfileViewModel에서는 새로운 Data를 바인딩 시킨다.
     */
    
    var name: String {
        return selectedUser?.name ?? "n/a"
    }
    
    var login: String {
        return selectedUser?.login ?? "n/a"
    }
    
    var followers: String {
        guard let value = selectedUser?.followers else { return "" }
        return "followers: \(value)"
    }
    
    var following: String {
        guard let value = selectedUser?.following else { return "" }
        return "following: \(value)"
    }
    
    var imageURL: URL? {
        return selectedUser?.avatarUrl
    }
    
    // User Action => Input
    func search(keyword: String) {
        let resource: Resource<UserProfile> = Resource(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.selectedUser = nil
                    print("error: \(error)")
                case .finished: break
                }
            }, receiveValue: { user in
                self.selectedUser = user
            })
            .store(in: &subscriptions)
    }
    
}
