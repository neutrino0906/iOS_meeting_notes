//
//  protocols.swift
//  meeting_notes
//
//  Created by Ground 2 on 25/04/24.
//

import Foundation

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapDeleteButton(cell: NotesTableViewCell)
}
