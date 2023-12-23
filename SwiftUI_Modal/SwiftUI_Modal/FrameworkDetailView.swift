//
//  FrameworkDetailView.swift
//  SwiftUI_Modal
//
//  Created by 김우섭 on 12/23/23.
//


/*
EnvironmentObject 같은 경우 Custom으로 제작한 Object를 삽입할 때 쓰고 싶었던 것이었다.
 Environment는 환경 -> 애플시스템에서 정의해놓은 것들을 가져다 쓸 때 이용하는 것이다.
*/

import SwiftUI

struct FrameworkDetailView: View {
    
    @StateObject var viewModel: FrameworkDetailViewModel
    
    /*
     -> 환경변수
     앞에 뷰에서 띄우면 presentationMode가 binding되어서 넘어오는 것이다.
     정리
     presentationMode가 환경변수로 넘어온다. 감싸고 있는 실제값은 FrameworkListView에서 띄울때
     사용한 변수 isShowingDetail가 연결되어있다.
     앞의 view에서 뒤의 view로 넘겨주는 것은 앞의 view와 뒤의 view가 서로 의존성이 생길 수 있다.
    */
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(viewModel.framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(viewModel.framework.name)
                .font(.system(size: 24, weight: .bold, design: .default))
            Text(viewModel.framework.description)
                .font(.system(size: 16, weight: .regular, design: .default))
            Spacer()
            Button(action: {
                viewModel.isSafariPresented = true
            }, label: {
                Text("Learn more")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
            })
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
            .cornerRadius(40)
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .sheet(isPresented: $viewModel.isSafariPresented, content: {
            let url = URL(string: viewModel.framework.urlString)!
            SafariView(url: url)
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = FrameworkDetailViewModel(framework: AppleFramework.list[0])
        FrameworkDetailView(viewModel: vm)
    }
}
