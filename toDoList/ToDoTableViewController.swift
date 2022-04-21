//
//  TableViewController.swift
//  toDoList
//
//  Created by Алексей Каземиров on 4/18/22.
//


import UIKit
import CoreData

class ToDoTableViewController: UITableViewController {

    var tasks = [Tasks]()
    
    //-MARK: Уроки Swift: ToDoList с использованием CoreData - инфа про удаление в конце
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New task", message: "Enter new task", preferredStyle: .alert)
        let saveTask = UIAlertAction(title: "Save", style: .default) { action in
            let tf = alertController.textFields?.first
            if let newTask = tf?.text {
                self.saveTask(withTitle: newTask)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextField { _ in }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveTask)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil )
    }
    
    func saveTask(withTitle title: String) {
        //Добираемся до контекста
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //Добираемся до сущности
        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else {return}
        
        //Добираемся до объекта (title в coredata)
        let taskObject = Tasks(entity: entity, insertInto: context)
        taskObject.title = title
        
        //С помощью do catch блока пробуем записать  Если ок - записываем в массив таскс, если нет - принт еррор
        do {
            try context.save()
            tasks.append(taskObject)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            tasks = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myDel = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        myDel.image = UIImage(systemName: "trash")
        myDel.backgroundColor = .black
        
        return UISwipeActionsConfiguration(actions: [myDel])
    }
    
    
    

}
