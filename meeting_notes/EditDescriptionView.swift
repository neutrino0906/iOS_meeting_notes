//
//  editDescriptionView.swift
//  meeting_notes
//
//  Created by Ground 2 on 24/04/24.
//

import UIKit

class EditDescriptionView: UIView {
    private var shadowLayer: CAShapeLayer!
    lazy var containerView = UIView(frame: frame)
    
    
    
    var didSelectView: ((UIView, Int, Bool) -> Void)?
    
    var views: [UIView] = [] {
            didSet {
                setupSubviews()
            }
        }
    
    
        // Function to set up subviews
    private func setupSubviews() {
            subviews.forEach { $0.removeFromSuperview() }

            let viewCount = views.count
            let viewWidth = bounds.width / CGFloat(viewCount)

            for (index, view) in views.enumerated() {
                view.isUserInteractionEnabled = true
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
                view.addGestureRecognizer(tapGesture)

                // Position each view horizontally
                view.frame = CGRect(x: CGFloat(index) * viewWidth, y: 0, width: viewWidth, height: bounds.height)

                containerView.addSubview(view)
            }
        }
    
    
    @objc private func viewTapped(_ gesture: UITapGestureRecognizer) {
        if let tappedView = gesture.view {
            if let index = containerView.subviews.firstIndex(of: tappedView) {
                let isSelected = tappedView.backgroundColor == .systemGray3 // Check if the view is currently selected
//                let newColor: UIColor = isSelected ? UIColor(named: "edit_description_bg")! : .systemGray3 // Toggle the background color
                
                let newColor = UIColor(named: "edit_description_bg")!
                tappedView.backgroundColor = newColor
                didSelectView?(tappedView, index, !isSelected) // Pass the tapped view, its index, and whether it's selected
            }
        }
    }

        // Override layoutSubviews to handle layout updates
        override func layoutSubviews() {
            super.layoutSubviews()
            isUserInteractionEnabled = true
            // Approach #1 for shadow and corner radius
            
//            if shadowLayer == nil {
//                shadowLayer = CAShapeLayer()
//                      
//                        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
//                shadowLayer.fillColor = UIColor.black.cgColor
//
//                        shadowLayer.shadowColor = UIColor.black.cgColor
//                        shadowLayer.shadowPath = shadowLayer.path
//                        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//                        shadowLayer.shadowOpacity = 0.2
//                        shadowLayer.shadowRadius = 3
//
//                        layer.insertSublayer(shadowLayer, at: 0)
//                }
//            layer.cornerRadius = 8
//            clipsToBounds = true
            
            // Approach #2 for shadow and corner radius
            
            
            layer.backgroundColor = UIColor.clear.cgColor
                  layer.shadowColor = UIColor.black.cgColor
                  layer.shadowOffset = CGSize(width: 0, height: 5.0)
                  layer.shadowOpacity = 0.2
                  layer.shadowRadius = 2.0
                    
                  // set the cornerRadius of the containerView's layer
                  containerView.layer.cornerRadius = 8
                  containerView.layer.masksToBounds = true
                  

            // Re-setup subviews when the view's bounds change
            containerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            setupSubviews()
            containerView.isUserInteractionEnabled = true
            addSubview(containerView)
        }

}
