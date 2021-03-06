//
//  ViewController.swift
//  week2
//
//  Created by Dominic Lynn on 13/12/17.
//  Copyright © 2017 Dominic Lynn. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let array = ["item1", "item2", "item3", "dom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = 70
        tableView.backgroundView = UIImageView(image: UIImage(named: "breads"))
        
        NSUserDefaultsManager.initDefaults()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeManager.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        let recipe = RecipeManager.recipes[indexPath.item]
        
        cell.textLabel?.text = recipe.title?.capitalized
        cell.recipe = recipe
        
        if(indexPath.item % 2 == 0) {
            cell.backgroundColor = UIColor.clear
        } else {
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            RecipeManager.deleteRecipe(id: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            NSUserDefaultsManager.synchronize()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailView") {
            let cell = sender as! CustomCell
            let detailView = segue.destination as! DetailViewController
            detailView.recipe = cell.recipe
        }
    }
    
    
}

