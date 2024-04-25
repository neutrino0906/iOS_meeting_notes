//
//  NotesTableViewCell.swift
//  meeting_notes
//
//  Created by Ground 2 on 22/04/24.
//

import UIKit

class NotesTableViewCell: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet var clientName: UILabel!
    @IBOutlet var subject: UILabel!
    @IBOutlet var dateCreated: UILabel!
    @IBOutlet var dateUpdated: UILabel!
    
    @IBAction func editButtonTapped(_ sender: Any) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        delegate?.didTapDeleteButton(cell: self)
    }
    
    
    
    
    weak var delegate: CustomTableViewCellDelegate?
    
    @IBAction func menuButtonTap(_ sender: Any) {
        editDeleteMenu.frame = CGRect(x: menuButton.frame.minX - (editDeleteMenu.frame.width / 2), y: menuButton.frame.maxY, width: 80, height: 64)
        editDeleteMenu.layer.cornerRadius = 8
        
        if editDeleteMenu.isHidden{
            self.editDeleteMenu.isHidden.toggle()
            editDeleteMenu.alpha = 0
            editDeleteMenu.transform = CGAffineTransform(translationX: -10, y: 0)
            
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.editDeleteMenu.alpha = 1
                self.editDeleteMenu.transform = .identity
            }, completion: { _ in
                self.addSubview(self.editDeleteMenu)
                
                
            })
            
        }
        else{
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.editDeleteMenu.alpha = 0
                self.editDeleteMenu.transform = CGAffineTransform(translationX: -10, y: 0)
            }, completion: { _ in
                self.editDeleteMenu.removeFromSuperview()
                self.editDeleteMenu.isHidden.toggle()
                
            })
        }
        
        
//        delegate?.didTapDeleteButton(cell: self)
        
    }
    
    @IBOutlet var menuButton: UIButton!
    
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var labelCollectionView: UICollectionView!
    
    
    @IBOutlet var editDeleteMenu: UIView!
    
    
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
        cell.setText(labelsArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelsArray.count
    }
    
}
