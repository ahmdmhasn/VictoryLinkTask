//
//  MKSearchDelegate.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/17/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import MapKit

protocol MKSearchDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: MKSearchViewController, didAutocompleteWith place: MKPlacemark)
    
    func viewController(_ viewController: MKSearchViewController, didFailAutocompleteWithError error: Error)
    
    // User canceled the operation.
    func wasCancelled(_ viewController: MKSearchViewController)
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: MKSearchViewController)
    
    func didUpdateAutocompletePredictions(_ viewController: MKSearchViewController)
        
}
