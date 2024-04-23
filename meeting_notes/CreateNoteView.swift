//
//  CreateNoteView.swift
//  meeting_notes
//
//  Created by Ground 2 on 23/04/24.
//

import UIKit

class CreateNoteView: UIView {
    @IBOutlet var leadingIcon: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var trailingIcon: UIImageView!
    @IBOutlet var separator: UIView!
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUpLayout()
//        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setUpLayout()
//        commonInit()
    }

    
    func setUpLayout(){
        
        let label : UILabel = {
            let label = UILabel()
            label.text = "Search Client"
            label.font = UIFont(name: "Lato", size: 15)
            label.frame = CGRect(x: 0, y: 0, width: 100, height: 18)
            return label
        }()
        let icon : UIImageView = {
            let icon = UIImageView()
            icon.image = UIImage(named: "user_plus_ic")
            icon.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
            return icon
        }()
        
        let trailingIcon : UIImageView = {
            let icon = UIImageView()
            icon.image = UIImage(systemName: "chevron.right")
            icon.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
            return icon
        }()
        
        let separator : UIView = {
            let line = UIView()
            line.backgroundColor = UIColor(named: "label_bg")
            line.frame = CGRect(x: 0, y: 0, width: frame.width, height: 20)
            return line
        }()
        
        let firstStack : UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.addArrangedSubview(label)
            stack.addArrangedSubview(trailingIcon)
            stack.distribution = .fill
            stack.frame = CGRect(x: 0, y: 0, width: frame.width - 40, height: 18)
            return stack
        }()
        
        let secondStack : UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fillProportionally
            stack.addArrangedSubview(icon)
            stack.addArrangedSubview(firstStack)
            stack.frame = CGRect(x: 0, y: 0, width: frame.width, height: 18)
            return stack
        }()
        
        let thirdStack : UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fill
            stack.addArrangedSubview(secondStack)
            stack.addArrangedSubview(separator)
            stack.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            return stack
        }()
        

        addSubview(thirdStack)
    }
    
    private func commonInit() {
            // Load the XIB file
            let nib = UINib(nibName: "CreateNoteView", bundle: nil)
            
            // Instantiate the view from the XIB
            if let contentView = Bundle.main.loadNibNamed("CreateNoteView", owner: self, options: nil)?.first as? UIView {
                contentView.frame = bounds
                addSubview(contentView)
                
                // Auto layout
                contentView.translatesAutoresizingMaskIntoConstraints = false
                contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
                contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            }
        }

}
