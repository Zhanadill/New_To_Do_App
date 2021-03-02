//
//  TableViewController1.swift
//  New_to_do_app
//
//  Created by Жанадил on 2/25/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

class VC1: UITableViewController {
   @IBOutlet weak var checkedLabel: UILabel!
   @IBOutlet weak var label: UILabel!
   var items = [Item]()
    
    
   required init?(coder aDecoder: NSCoder) {
      var row0Item = Item()
      row0Item.text = "Walk the dog"
      items.append(row0Item)
      
      var row1Item = Item()
      row1Item.text = "Brush my teeth"
      items.append(row1Item)
      
      var row2Item = Item()
      row2Item.text = "Learn iOS development"
      items.append(row2Item)
      
      var row3Item = Item()
      row3Item.text = "Soccer pratice"
      items.append(row3Item)
      
      var row4Item = Item()
      row4Item.text = "Eat ice cream"
      row4Item.checked = true
      items.append(row4Item)
      
      var row5Item = Item()
      row5Item.text = "Watch Game of Thrones"
      row5Item.checked = true
      items.append(row5Item)
      
      var row6Item = Item()
      row6Item.text = "Read iOS Apprentice"
      row6Item.checked = true
      items.append(row6Item)
      
      var row7Item = Item()
      row7Item.text = "Take a nap"
      items.append(row7Item)
      
      super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "AddSegue" {
          let controller = segue.destination as! VC2
              controller.doneDelegate = self
              controller.title = "Add Item"
       }else if segue.identifier == "EditSegue" {
           let controller = segue.destination as! VC2
              controller.doneDelegate = self
              controller.title = "Edit Item"
              if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                    controller.itemToEdit = items[indexPath.row]
                    controller.indexToEdit = indexPath
              }
       }
    }
}




//MARK: TableView Methods
extension VC1{
    //TableView DataSource Methods
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
           return items.count
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
           let label = cell.viewWithTag(1001) as! UILabel
           let checkedLabel = cell.viewWithTag(1000) as! UILabel
           label.text = items[indexPath.row].text
           if items[indexPath.row].checked{
               checkedLabel.text = "√"
           }else{
               checkedLabel.text = ""
           }
           return cell
       }

       
       //TableView Delete Methods
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         items.remove(at: indexPath.row)
         let indexPaths = [indexPath]
         tableView.deleteRows(at: indexPaths, with: .automatic)
       }
    
       
       //TableView Delegate Methods
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           items[indexPath.row].aaa()
           tableView.reloadData()
           tableView.deselectRow(at: indexPath, animated: true)
       }
}



//MARK: DoneDelegate
extension VC1: DoneDelegate{
    func addDone(newItem: String) {
        var item = Item()
        item.text = newItem
        items.append(item)
        tableView.reloadData()
    }
    
    func editDone(newItem: String, index: IndexPath) {
        items[index.row].text = newItem
        tableView.reloadData()
    }
}
