import UIKit

// UITabBarController
// 2개의 UIViewCOntroller, 2개의 TabBar

final class FirstViewController: UIViewController {}
final class SecondViewController: UIViewController {}

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "person"), tag: 0)
        
        let secondViewController = SecondViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "person"), tag: 1)
        
        viewControllers = [firstViewController, secondViewController]
    }
    
}


import SwiftUI

struct FirstView: View {
    var body: some View {
        Text("First tab")
    }
}

struct SecondView: View {
    var body: some View {
        Text("Second tab")
    }
}

struct SampleTabView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "person")
                    Text("First")
                }
            SecondView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Second")
                }
        }
    }
}
