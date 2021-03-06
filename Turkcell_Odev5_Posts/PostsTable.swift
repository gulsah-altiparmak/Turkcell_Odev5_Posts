//
//  PostsTable.swift
//  Turkcell_Odev5_Posts
//
//  Created by Gulsah Altiparmak on 28.01.2021.
//

import UIKit
import Alamofire
import Lottie
class PostsTable: UITableViewController {

    var posts: Posts? = []
    let animationView = AnimationView()
    var isOpen:Bool = false
  
    override func viewDidLoad() {
        setupAnimation(isOpened: isOpen)
       
        super.viewDidLoad()
        let url = "https://jsonplaceholder.typicode.com/posts"
        AF.request(url).responseJSON { [self] (res) in
            if (res.response?.statusCode == 200){
                self.posts = try? JSONDecoder().decode(Posts.self, from: res.data!)
                self.tableView.reloadData()
                self.isOpen = true
                self.setupAnimation(isOpened: self.isOpen)
            }
        }
  
    }
     func setupAnimation(isOpened:Bool){
        animationView.animation = Animation.named("postbox")
        if !(isOpened){
            animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            animationView.center = view.center
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
        }else{
            animationView.stop()
            animationView.alpha = 0
            animationView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        }
      
        view.addSubview(animationView)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.font = UIFont (name: "PottaOne-Regular", size: 16)
        let item = posts![indexPath.row]
        cell.textLabel?.text = item.title.capitalizingFirstLetter()
        cell.imageView?.image = UIImage(named: "newspaper")

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sender = posts![indexPath.row]
        performSegue(withIdentifier: "detail", sender: sender)
        
    
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail"){
          let vc = segue.destination as! NewsDetail
            vc.post = sender as! Post
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
