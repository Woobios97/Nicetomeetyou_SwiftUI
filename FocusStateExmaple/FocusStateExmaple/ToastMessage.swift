//
//  ToastMessage.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/26/24.
//

import SwiftUI

// ToastMessage 4가지 종류로 정의
enum FancyToastStyle {
    case error
    case warning
    case success
    case info
}

extension FancyToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.yellow
        case .info: return Color.blue
        case .success: return Color.green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}

// ToastMessage를 구성하는 데이터 형식 선언
struct FancyToast: Equatable {
    var type: FancyToastStyle
    var title: String
    var message: String
    var duration: Double = 3
}

// ToastView
struct FancyToastView: View {
    var type: FancyToastStyle
    var title: String
    var message: String
    var onCancleTapped: (() -> Void)
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: type.iconFileName)
                    .foregroundColor(type.themeColor)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(message)
                        .font(.system(size: 12))
                        .foregroundColor(Color.black.opacity(0.6))
                }
                
                Spacer(minLength: 10)
                
                Button {
                    onCancleTapped()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .background(.white)
        .overlay(
        Rectangle()
            .fill(type.themeColor)
            .frame(width: 6)
            .clipped()
        , alignment: .leading
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, 16)
    }
}

// Toast Modifier 만들고 View extension해서 사용할 수 있게 하기
struct FancyToastModifier: ViewModifier {
    @Binding var toast: FancyToast?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        .offset(y: -30)
                }.animation(.spring(), value: toast)
            )
            .onChange(of: toast) { value in
                showToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                Spacer()
                FancyToastView(
                    type: toast.type,
                    title: toast.title,
                    message: toast.message) {
                    dismissToast()
                }
            }
            .transition(.move(edge: .bottom))
        }
    }
    
    private func showToast() {
        guard let toast = toast else { return }
        
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
                dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }

    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}

extension View {
    func toastView(toast: Binding<FancyToast?>) -> some View {
        self.modifier(FancyToastModifier(toast: toast))
    }
}

struct ContentView2: View {
    
    var body: some View {
        TabView {
            VStack {
                EmptyView()
            }
            .tabItem {
                Text("기본검색")
            }
            VStack {
                ToastBasicView()
            }
            .tabItem {
                Text("토스트")
            }
            VStack {
                EmptyView()
            }
            .tabItem {
                Text("연습")
            }
            .padding()
            .tabItem {
                Text("커스텀검색")
            }
        }
    }
}

struct ToastBasicView: View {
    
    @State private var toast: FancyToast? = nil
    
    var body: some View {
        VStack {
            Button {
                toast = FancyToast(type: .info, title: "제목으로 안내", message: "문제없어요")
            } label: {
                Text("안내")
            }
            Button {
                toast = FancyToast(type: .info, title: "제목으로 에러발생", message: "문제있어요")
            } label: {
                Text("오류")
            }
            Button {
                toast = FancyToast(type: .info, title: "제목으로 경고", message: "경고했어요")
            } label: {
                Text("경고")
            }
            Button {
                toast = FancyToast(type: .info, title: "제목으로 성공", message: "성공했어요")
            } label: {
                Text("성공")
            }
        }
        .toastView(toast: $toast)
    }
}

//
//#Preview {
//    ToastMessage()
//}
