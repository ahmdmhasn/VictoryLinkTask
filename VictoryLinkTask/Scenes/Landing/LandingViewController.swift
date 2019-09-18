//
//  LandingViewController.swift
//  VictoryLinkTask
//
//  Created by Ahmed M. Hassan on 9/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import MapKit

class LandingViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        
        mapView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(revealRegionDetailsWithLongPressOnMap(sender:))))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        BaseHandler.shared.searchType = nil
    }
    
    
    // MARK: Handlers
    
    private func setupNavigationController() {
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchPressed(_:)))
        
        let menuBtn = UIButton(type: .custom)
        menuBtn.setImage(UIImage(named:"menu"), for: .normal)
        menuBtn.addTarget(self, action: #selector(toggleSideMenu(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([menuBtn.widthAnchor.constraint(equalToConstant: 20),
                                     menuBtn.heightAnchor.constraint(equalToConstant: 20)])
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        
        navigationItem.rightBarButtonItems = [searchItem]
        navigationItem.leftBarButtonItems = [menuBarItem]
        navigationController?.navigationBar.tintColor = UIColor.appLightGrey
        navigationController?.navigationBar.barTintColor = UIColor.appPrimaryBlue
    }
    
    @objc private func toggleSideMenu(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
    @objc private func searchPressed(_ sender: UIButton) {
        let searchController = MKSearchViewController()
        searchController.delegate = self
        
        // Display the autocomplete view controller.
        present(searchController, animated: true, completion: nil)
    }
    
    @objc func revealRegionDetailsWithLongPressOnMap(sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        showPhotosViewControllerWith(searchType: .coordinates(locationCoordinate.latitude, locationCoordinate.longitude))
    }


}


extension LandingViewController: MKMapViewDelegate {
    
    
}


extension LandingViewController: MKSearchDelegate {
    
    func viewController(_ viewController: MKSearchViewController, didAutocompleteWith place: MKPlacemark) {
        
        showPhotosViewControllerWith(searchType: .tag(place.title ?? ""))
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: MKSearchViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: MKSearchViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: MKSearchViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: MKSearchViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}


extension LandingViewController {
    
    func showPhotosViewControllerWith(searchType: SearchType) {
        
        guard let navigationController = navigationController else { return }
        
        BaseHandler.shared.searchType = searchType
        
        let imagesVC = ImagesViewController(nibName: "\(ImagesViewController.self)", bundle: nil)
        
        navigationController.pushViewController(imagesVC, animated: true)
    }
    
}
