//
//  AppDelegate.swift
//  PushNotifications
//
//  Created by woosub kim  on 2/6/24.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        
        // FCM 토큰 새로 고침 및 FCM 다이렉트 채널을 통해 수신된 원격 데이터 메시지를 처리하도록 위임하기
        Messaging.messaging().delegate = self
        /*
         델리게이트 객체를 사용하여 앱이 포그라운드에 있을 때 사용자가 선택한 작업에 응답하고 수신되는 알림을 처리할 수 있습니다. 
         예를 들어 앱이 포그라운드에 있을 때 델리게이트를 사용하여 알림을 무음 처리할 수 있습니다.
         앱이 모든 실행 가능한 알림에 응답하도록 하려면 앱 실행이 완료되기 전에 이 속성의 값을 설정해야 합니다.
         iOS 앱의 경우, 이는 앱 델리게이트의 application(_:willFinishLaunchingWithOptions:) 또는 application(_:didFinishLaunchingWithOptions:) 메서드에서 이 프로퍼티를 업데이트하는 것을 의미합니다.
         이러한 메서드의 실행이 완료된 직후에 앱이 실행되거나 전달되도록 하는 알림입니다.
         델리게이트 메서드 구현에 대한 자세한 내용은 UNUserNotificationCenterDelegate를 참조하세요.
         */
        UNUserNotificationCenter.current().delegate = self
        // 앱에 대한 로컬 및 원격 알림을 허용하려면 개인의 승인을 요청합니다.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, _ in
            guard success else {
                return
            }
            
            print("APNS 등록에 성공했습니다.")
            
            // Apple 푸시 알림 서비스를 통해 원격 알림을 받기 위해 등록합니다.
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
        
        return true
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, _ in
            guard let token = token else {
                return
            }
            
            print("token - \(token)")
        }
    }

}

