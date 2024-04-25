//
//  SearchClientViewModel.swift
//  meeting_notes
//
//  Created by Ground 2 on 25/04/24.
//

import Foundation
import UIKit

extension SearchClientViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = clientSearchResultTableView.dequeueReusableCell(withIdentifier: "clientSearchCell", for: indexPath) as! SearchClientTableViewCell
        cell.clientName.text = clientList[indexPath.row]
        cell.backgroundColor = UIColor(named: "searchClientTableView_bg")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clientSearchResultTableView.deselectRow(at: indexPath, animated: true)
        let cell = clientSearchResultTableView.cellForRow(at: indexPath) as! SearchClientTableViewCell
        callbackToCreateNote?(cell.clientName.text ?? "Not Found")
        dismiss(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    
}
