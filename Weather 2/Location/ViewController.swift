//
//  ViewController.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 13.04.2024.
//

import UIKit
import Alamofire

class LocationViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    var weatherManager = WeatherManager()
    var weather = CurrentWeather()
    var searchData = WeatherManager()
    
    lazy var searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        //    weatherManager.delegate = self
        
        definesPresentationContext = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchBar.placeholder = "Search city"
        searchController.searchBar.delegate = self
        searchController.definesPresentationContext = false
        searchController.obscuresBackgroundDuringPresentation = false
        
        collectionView.backgroundColor = .white
        collectionView.register(LocationRowCell.self, forCellWithReuseIdentifier: "cellId")
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search text:\(searchText)")
        
                self.weatherManager.fetchWeather(cityName: searchText)
        
    }
    
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didFailWithError(error: Error){
        print(error)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! LocationRowCell
        cell.cityLabel.text = weather.cityName
        cell.temperatureLabel.text = "\(weather.currentTemp)"
//        cell.conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 90)
    }
}




