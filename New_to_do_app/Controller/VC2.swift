//
//  VC@TableViewController.swift
//  New_to_do_app
//
//  Created by Жанадил on 2/25/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

protocol DoneDelegate: class{
    func addDone(newItem: String)
    func editDone(newItem: String, index: IndexPath)
}



class VC2: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    weak var doneDelegate: DoneDelegate?
    var itemToEdit: Item?
    var indexToEdit: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        let index = IndexPath(row: 0, section: 0)
        let cell: TableViewCell = tableView.cellForRow(at: index) as! TableViewCell
        if itemToEdit != nil {
            doneDelegate?.editDone(newItem: cell.textField.text!, index: indexToEdit!)
        }
        else{
            doneDelegate?.addDone(newItem: cell.textField.text!)
        }
        navigationController?.popViewController(animated: true)
    }
}




//MARK: TableView DataSource Methods
extension VC2: UITableViewDataSource{
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
          return 1
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell
          cell.textField.becomeFirstResponder()
          if itemToEdit != nil {
            cell.textField.text = itemToEdit?.text
          }
          return cell
      }
    

}



//MARK: UITextFieldDelegate
extension VC2: UITextFieldDelegate{
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let index = IndexPath(row: 0, section: 0)
        let cell: TableViewCell = tableView.cellForRow(at: index) as! TableViewCell
        let oldText = cell.textField.text!
        let stringRange = Range(range, in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty {
          doneButton.isEnabled = false
        } else {
          doneButton.isEnabled = true
        }
        return true
    }
}
