//
//  NotesTableViewCell.swift
//  meeting_notes
//
//  Created by Ground 2 on 22/04/24.
//

import UIKit

class NotesTableViewCell: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var labelCollectionView: UICollectionView!
    
    
    var labelsArray : [String] = ["x","y","z"]
    var labelScrollView = UIScrollView()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelCollectionView.dataSource = self
        labelCollectionView.delegate = self
        
        labelCollectionView.register(labelCollectionViewCell.self, forCellWithReuseIdentifier: "labelCell")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 4
        
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 10)
        containerView.layer.shadowOffset = CGSize(width: 0, height: 10)
        
//        let labelsStack = getLabelsStack()
        
//        labelScrollView = getLabelsStack()
//        labelScrollView.frame = CGRect(x: 0, y: stackView.frame.height, width: containerView.frame.width, height: 40)
        
//        labelScrollView.addSubview(labelsStack)
        
//        stackView.addSubview(labelScrollView)
        
        
    }
    
    
    
//    func getLabelsStack() -> UIScrollView{
//        let stack = UIScrollView()
//        stack.contentSize = CGSize(width: frame.width, height: 100)
//        for i in labelsArray{
//            let view = labelsView()
//            view.setText(i)
//            view.translatesAutoresizingMaskIntoConstraints = false
//            stack.addSubview(view)
//        }
//        
//        return stack
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = labelCollectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexPath) as! labelCollectionViewCell
        
        
        
        cell.backgroundColor = UIColor(named: "label_bg")
        cell.label.text = "a"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
}
