//
//  PresentationAnimationViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/30/22.
//

import UIKit

class PresentationAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func showAction(_ sender: UIButton) {
        
        let vc = ShowViewController()
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

extension PresentationAnimationViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            let animator = Animator()
            return animator
        }
}
class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        
        toView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
        UIView.animate(withDuration: 5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: UIView.AnimationOptions.init(rawValue: 0), animations: {
            toView.transform = CGAffineTransform.identity
        }) { (_) in
            
        }
        
        transitionContext.completeTransition(true)
    }
}
