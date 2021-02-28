//
//  LottieView.swift
//  Tastethewaste
//
//  Created by Caylie Taylor on 2/27/21.
//

import Foundation
import Lottie
import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable{

    typealias UIViewType = UIView
    var fileName: String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        //add the animation
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        //animationView.frame = CGRect(x: 0, y: 100, width: 1000, height: 2000)
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 500),
            animationView.heightAnchor.constraint(equalToConstant: 600),
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.rightAnchor.constraint(equalTo: view.rightAnchor),
            animationView.leftAnchor.constraint(equalTo: view.leftAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
