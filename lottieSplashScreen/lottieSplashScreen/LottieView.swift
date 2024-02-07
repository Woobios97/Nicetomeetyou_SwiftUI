//
//  LottieView.swift
//  lottieSplashScreen
//
//  Created by woosub kim  on 2/7/24.
//

import SwiftUI
import UIKit
import Lottie

struct LottieView: UIViewRepresentable {
    
    var name : String
    var loopMode: LottieLoopMode
    
    init(_ jsonName: String = "party"
         ,_ loopMode: LottieLoopMode = .loop) {
        self.name = jsonName
        self.loopMode = loopMode
    }
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        print("LottieView - makeUIView() called")
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(name)
        
        animationView.animation = animation
        
        animationView.contentMode = .scaleAspectFit
        
        animationView.loopMode = loopMode
        
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
