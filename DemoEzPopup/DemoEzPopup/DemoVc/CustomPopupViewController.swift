//
//  CustomPopupViewController.swift
//  DemoEzPopup
//
//  Created by MAC on 7/28/22.
//

import UIKit
protocol CustomPopupViewControllerDelegate: AnyObject {
    
    /// It is called when pop up is dismissed by tap outside
    func popupViewControllerDidDismissByTapGesture(_ sender: CustomPopupViewController)
}
class CustomPopupViewController: UIViewController {

    /// Popup width, it's nil if width is determined by view's intrinsic size
    private(set) open var popupWidth: CGFloat?
    
    /// Popup height, it's nil if width is determined by view's intrinsic size
    private(set) open var popupHeight: CGFloat?
    
//    /// Popup position, default is center
//    private(set) open var position: PopupPosition = .center(nil)
//
    /// Background alpha, default is 0.5
    open var backgroundAlpha: CGFloat = 0.2
    
    /// Background color, default is black
    open var backgroundColor = UIColor.label
    
    /// Allow tap outside popup to dismiss, default is true
    open var canTapOutsideToDismiss = true
    
    /// Corner radius, default is 0 (no rounded corner)
    open var cornerRadius: CGFloat = 0
    
    /// Shadow enabled, default is true
    open var shadowEnabled = true
    
    /// The pop up view controller. It's not mandatory.
    private(set) open var contentController: UIViewController?
    
    /// The pop up view
    private(set) open var contentView: UIView?
    
    /// The delegate to receive pop up event
    open weak var delegate: CustomPopupViewControllerDelegate?
    
    private var containerView = UIView()
    private var isViewDidLayoutSubviewsCalled = false
    var offset: CGPoint?
    var anchorView: UIView?
    
    // MARK: -
    
    /// NOTE: Don't use this init method
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     Init with content view controller. Your pop up content is a view controller (easiest way to design it is using storyboard)
     - Parameters:
        - contentController: Popup content view controller
        - position: Position of popup content, default is center
        - popupWidth: Width of popup content. If it isn't set, width will be determine by popup content view intrinsic size.
        - popupHeight: Height of popup content. If it isn't set, height will be determine by popup content view intrinsic size.
     */
    public init(contentController: UIViewController, offset: CGPoint, anchorView: UIView , popupWidth: CGFloat?, popupHeight: CGFloat?) {
        super.init(nibName: nil, bundle: nil)
        self.contentController = contentController
        self.contentView = contentController.view
        self.popupWidth = popupWidth
        self.popupHeight = popupHeight
        self.offset = offset
        self.anchorView = anchorView
        
        commonInit()
    }
    
    /**
     Init with content view
     - Parameters:
         - contentView: Popup content view
         - position: Position of popup content, default is center
         - popupWidth: Width of popup content. If it isn't set, width will be determine by popup content view intrinsic size.
         - popupHeight: Height of popup content. If it isn't set, height will be determine by popup content view intrinsic size.
     */
//    public init(contentView: UIView, position: PopupPosition = .center(nil), popupWidth: CGFloat?, popupHeight: CGFloat?) {
//        super.init(nibName: nil, bundle: nil)
//        self.contentView = contentView
//        self.popupWidth = popupWidth
//        self.popupHeight = popupHeight
//        self.position = position
//
//        commonInit()
//    }
    
    private func commonInit() {
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addDismissGesture()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isViewDidLayoutSubviewsCalled == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.setupViews()
            }
        }
        
        isViewDidLayoutSubviewsCalled = true
    }
    
    // MARK: - Setup

    private func addDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissTapGesture(gesture:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView?.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = backgroundColor.withAlphaComponent(backgroundAlpha)
        
        if cornerRadius > 0 {
            contentView?.layer.cornerRadius = cornerRadius
            contentView?.layer.masksToBounds = true
        }
        
        if shadowEnabled {
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.shadowColor = UIColor.label.cgColor
            containerView.layer.shadowRadius = 3
        }
    }
    
    private func setupViews() {
        if let contentController = contentController {
            addChild(contentController)
        }
        
        addViews()
        addSizeConstraints()
        //addPositionConstraints()
    }
    
    private func addViews() {
        view.addSubview(containerView)
        
        if let contentView = contentView {
            containerView.addSubview(contentView)
            
            let topConstraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let leftConstraint = NSLayoutConstraint(item: contentView, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)
            let rightConstraint = NSLayoutConstraint(item: contentView, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate([topConstraint, leftConstraint, bottomConstraint, rightConstraint])
        }
    }
    
    // MARK: - Add constraints
    
    private func addSizeConstraints() {
        if let popupWidth = popupWidth {
            let widthConstraint = NSLayoutConstraint(item: containerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: popupWidth)
            NSLayoutConstraint.activate([widthConstraint])
        }
        
        if let popupHeight = popupHeight {
            let heightConstraint = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: popupHeight)
            NSLayoutConstraint.activate([heightConstraint])
        }
        var position: CGPoint = offset ?? .zero
        let anchorViewPosition = view.convert(CGPoint.zero, from: anchorView)
        position = CGPoint(x: position.x + anchorViewPosition.x, y: position.y + anchorViewPosition.y)
        let topConstraint = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: position.y)
        let leftConstraint = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: position.x)
        NSLayoutConstraint.activate([topConstraint, leftConstraint])
    }
    

    private func addTopLeftPositionConstraints(offset: CGPoint?, anchorView: UIView?) {
        var position: CGPoint = offset ?? .zero
        
        if let anchorView = anchorView {
            let anchorViewPosition = view.convert(CGPoint.zero, from: anchorView)
            position = CGPoint(x: position.x + anchorViewPosition.x, y: position.y + anchorViewPosition.y)
        }
        
        let topConstraint = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: position.y)
        let leftConstraint = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: position.x)
        NSLayoutConstraint.activate([topConstraint, leftConstraint])
    }
    @objc func dismissTapGesture(gesture: UIGestureRecognizer) {
        dismiss(animated: true) {
            self.delegate?.popupViewControllerDidDismissByTapGesture(self)
        }
    }

}
// MARK: - UIGestureRecognizerDelegate
extension CustomPopupViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let touchView = touch.view, canTapOutsideToDismiss else {
            return false
        }
        
        return !touchView.isDescendant(of: containerView)
    }
}
