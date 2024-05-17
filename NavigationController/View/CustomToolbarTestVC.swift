//
//  CustomToolbarTestVC.swift
//  NavigationController
//
//  Created by Ümit Örs on 16.05.2024.
//

import UIKit

class CustomToolbarTestVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var toolbar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        // Do any additional setup after loading the view.
        toolbar.backgroundColor = .green
        
        view.bringSubviewToFront(toolbar)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension CustomToolbarTestVC: UIScrollViewDelegate {
    /*
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let safeAreaTop = view.window?.safeAreaInsets.top ?? 0
     print(safeAreaTop)
     let magicalSafeAreaTop : CGFloat = safeAreaTop
     let offset = scrollView.contentOffset.y + magicalSafeAreaTop
     //let alpha = 1.0 - min(1.0, offset / 80)
     let alpha = 1.0 - min(0, ((scrollView.contentOffset.y + safeAreaTop - 8) / safeAreaTop))
     toolbar.alpha = alpha
     toolbar.transform = .init(translationX: 0, y: min(0, -offset))
     scrollView.transform = .init(translationX: 0, y: min(0, -offset))
     }*/
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < 120 {
            //print(offset)
            let alpha = 1.0 - min(1.0, offset / 100)
            print(alpha)
            toolbar.alpha = alpha
            //toolbar.backgroundColor = UIColor.green.withAlphaComponent(alpha)
            toolbar.transform = .init(translationX: 0, y: min(0, -offset))
            scrollView.transform = .init(translationX: 0, y: min(0, -offset))
        }
        
    }
}
