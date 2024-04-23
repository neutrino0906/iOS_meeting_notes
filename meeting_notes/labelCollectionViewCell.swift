//
//  labelCollectionViewCell.swift
//  meeting_notes
//
//  Created by Ground 2 on 23/04/24.
//

import UIKit

class labelCollectionViewCell: UICollectionViewCell {

    let label: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0 // Allow multiple lines for text
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
    
    func setText(_ text: String) {
        label.text = text
        invalidateIntrinsicContentSize()
    }
    
    

}
