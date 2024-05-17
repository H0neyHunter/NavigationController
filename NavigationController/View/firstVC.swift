//
//  ViewController.swift
//  NavigationController
//
//  Created by Ümit Örs on 16.05.2024.
//

import UIKit

class firstVC: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
        setupNavBar()
    }
    @IBAction func toSecondaryVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let dc = sb.instantiateViewController(withIdentifier: "secondaryVC") as? secondaryVC {
            //dc.hidesBottomBarWhenPushed = false
            
            self.navigationController?.pushViewController(dc, animated: true)
        }
    }
    let titleView = UIView()
    fileprivate func setupNavBar(){
        
        
        let width = view.frame.width
        
        titleView.backgroundColor = .green
        titleView.frame = .init(x: 0, y: 0, width: width, height: 50)
        navigationItem.titleView = titleView
        //navigationItem.title = "Hello"
        //navigationItem.titleView?.backgroundColor = .clear
        //navigationController?.navigationBar.backgroundColor = .clear
        
    }
    @IBAction func customToolbarVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let dc = sb.instantiateViewController(withIdentifier: "CustomToolbarTestVC") as? CustomToolbarTestVC {
            dc.modalPresentationStyle = .fullScreen
            self.present(dc, animated: true)
        }
    }
    /*
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
     //print(scrollView.contentOffset.y)
     guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
     let window = windowScene.windows.filter({ $0.isKeyWindow }).first else { return }
     let safeAreaTop = window.safeAreaInsets.top
     let safeTop : CGFloat = safeAreaTop + (navigationController?.navigationBar.frame.height ?? 0)
     let offset = scrollView.contentOffset.y + safeTop
     let alpha : CGFloat = 1 - ((scrollView.contentOffset.y + safeTop) / safeTop)
     navigationItem.titleView?.alpha = alpha
     navigationController?.navigationBar.alpha = alpha
     navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
     }*/
    /*
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let safeTop : CGFloat = 16//safeAreaTop
     let offset = scrollView.contentOffset.y + safeTop
     let alpha : CGFloat = 1 + (scrollView.contentOffset.y) / safeTop
     navigationController?.navigationBar.alpha = -alpha
     navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
     }*/
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Kaydırma ofsetini alın
        let offset = scrollView.contentOffset.y
        
        // Navigasyon çubuğunun opaklığını kaydırmaya göre ayarlayın
        let alpha = 1 - min(1, offset / 100)
        navigationController?.navigationBar.alpha = alpha

                // Navigasyon çubuğunun konumunu kaydırmaya göre ayarlayın
        //navigationController?.navigationBar.frame.origin.y = -min(0, offset)
        
        // Navigasyon çubuğunun konumunu kaydırmaya göre ayarlayın
        //navigationController?.navigationBar.frame.origin.y = -min(0, +offset)
        navigationController?.navigationBar.transform = .init(translationX: 0, y: -min(0, offset))
    }
    
    
}

