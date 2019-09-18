//
//  MKSearchControllerView.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/17/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import MapKit

class MKSearchViewController: UIViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!

    var delegate: MKSearchDelegate?
    
    var request = MKLocalSearch.Request()
    
    var matchingItems = [MKMapItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        searchBar.becomeFirstResponder()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.rowHeight = UITableView.automaticDimension
        resultsTableView.estimatedRowHeight = 50
        resultsTableView.layer.cornerRadius = 10
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func search(with text: String) {
        
        request.naturalLanguageQuery = text
        
        let search = MKLocalSearch(request: request)
        
        delegate?.didRequestAutocompletePredictions(self)
        
        search.start { [weak self] (response, error) in
            
            guard let strongSelf = self else { return }
            
            strongSelf.delegate?.didUpdateAutocompletePredictions(strongSelf)
            
            guard let response = response else {
                strongSelf.delegate?.viewController(strongSelf, didFailAutocompleteWithError: error!)
                return
            }
            
            strongSelf.matchingItems = response.mapItems
            
            strongSelf.resultsTableView.reloadData()
        }
    }
}

extension MKSearchViewController: UISearchBarDelegate {
    
    // called when text changes (including clear)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let searchBarText = searchBar.text else { return }
        
        search(with: searchBarText)
    }
    
    // called when keyboard search button pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else { return }
        
        search(with: searchBarText)
    }
    
    // called when cancel button pressed
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.delegate?.didUpdateAutocompletePredictions(self)
        
        delegate?.wasCancelled(self)
    }
}

extension MKSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let placemark = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = placemark.title
        cell.detailTextLabel?.text = placemark.subtitle
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.viewController(self, didAutocompleteWith: matchingItems[indexPath.row].placemark)
        
    }
}
