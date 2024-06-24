//
//  SplashViewController.swift
//  Cproject
//
//  Created by 곽서방 on 6/18/24.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    @IBOutlet weak var lottieAnimationView: LottieAnimationView!
    
    
 
    
    //ovrrride 했을 경우 super로 상속 필수
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lottieAnimationView.play {  _  in
    // 이상태로 진행하면 homeviewcontroller로 화면 이동 시 코드로 구현된 작업은 가져올수있지만 스토리보드에서 작업한 내용은 가져오지 못함 그래서 스토리보드를 찾아서 연결해줘야댐. 즉 스토리보드를 읽어와서 스토리보드에 있는 홈뷰컨트롤러를 가져오는 것임.
            let storybord = UIStoryboard(name: "Home", bundle: nil)
            let viewcontroller = storybord.instantiateInitialViewController() //instantiateInitialViewController 설정 해줘야댐. 해당 스토리보드가서 설정.
    // splash view 는 일회성이기에 메인 뷰 컨트롤러 밑에 깔려있을 필요가 없다. 메모리 관리를 위해 루트 뷰컨트롤러를 HomeViewcontroller로 변경
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               // 키윈도우를 찾겠다.
               let window = windowScene.windows.first(where: { $0.isKeyWindow}) {
                // 루트 뷰 컨트롤러 변경
                window.rootViewController = HomeViewController()
            }
        }
    }
    
}
