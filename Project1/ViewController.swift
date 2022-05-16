//
//  ViewController.swift
//  Project1
//
//  Created by Mehmet Sümer on 15.04.2022.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        //FOR PROJECT 3
        /*
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
         */

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }

        pictures.sort()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row] //"Picture \(indexPath.row + 1) of \(pictures.count)"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {

            vc.selectedImage = pictures[indexPath.row]
            vc.totalImage = pictures.count
            vc.selectedImageIndex = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
