//
//  HomeViewModel.swift
//  meeting_notes
//
//  Created by Ground 2 on 23/04/24.
//

import Foundation
import UIKit


extension HomeViewController: UITableViewDataSource, UITableViewDelegate, CustomTableViewCellDelegate{
    
    func didTapDeleteButton(cell: NotesTableViewCell) {
        
        if let indexPath = notesTableView.indexPath(for: cell) {
                    notesList.remove(at: indexPath.row)
            notesTableView.deleteRows(at: [indexPath], with: .fade)
                }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notesTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NotesTableViewCell
        
        cell.delegate = self
        cell.clientName.text = notesList[indexPath.row].clientName
        cell.subject.text = notesList[indexPath.row].subject
        cell.dateCreated.text = notesList[indexPath.row].createDate
        cell.dateUpdated.text = notesList[indexPath.row].updateDate
        cell.labelsArray = notesList[indexPath.row].labels
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
//        return 200
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        notesTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
