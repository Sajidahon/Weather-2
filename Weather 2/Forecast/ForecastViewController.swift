//
//  ForecastViewController.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 13.04.2024.
//

import UIKit
import CoreLocation
import Alamofire

class ForecastViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate  {
    
    
    let cellId = "cellId"
    let cellId1 = "cellId1"
    
    let locationManager = CLLocationManager()
    
    var currentWeather: CurrentWeather!
    var currentLocation: CLLocation?
    var forecastWeather: ForecastWeather!
    var forecastArray = [ForecastWeather]()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        currentWeather = CurrentWeather()
        setupLocation()
        setupCollectionView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        locationAuthCheck()
        downloadForecastWeather {
            print("DATA DOWNLOADED")
        }
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(ForecastRowCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(WeeklyForecastCell.self, forCellWithReuseIdentifier: cellId1)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 + forecastArray.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ForecastRowCell
            cell.cityNameLabel.text = currentWeather.cityName
            cell.currentCityTempLabel.text = "\(Int(currentWeather.currentTemp))"
            cell.descriptionLabel.text = currentWeather.weatherType
            cell.weatherImageView.image = UIImage(named: currentWeather.weatherType) //Clouds 
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! WeeklyForecastCell
                cell.configureCell(forecastData: forecastArray[indexPath.row - 1])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return .init(width: collectionView.frame.width, height: 300)
        } else {
            return .init(width: collectionView.frame.width, height: 70)
        }
    }
    func setupLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // Take Permission from the user
        locationManager.startMonitoringSignificantLocationChanges()
        
    }
    
    func locationAuthCheck() {
        switch CLLocationManager().authorizationStatus {
        case .restricted, .denied, .notDetermined:
            locationManager.requestWhenInUseAuthorization()  // Take Permission from the user again
            locationAuthCheck()  // Make a check
        default:
            currentLocation = locationManager.location
            CLLocationManager().location?.coordinate.latitude
            CLLocationManager().location?.coordinate.longitude
            // Pass the location coord to our API
            Location.sharedInstance.latitude = currentLocation?.coordinate.latitude ?? 0.0
            Location.sharedInstance.longitude = currentLocation?.coordinate.longitude ?? 0.0
            
            // Download the API Data
            currentWeather.downloadCurrentWeather {
                // Update the UI after download is completed.
                self.updateUI()
            }
        }
        
    }
    
    /// Эта фукция обновляет текущий пользовательский интерфейс погоды в нашем приложении
    func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    /// Эта функция загружает данные о прогнозируемой погоде
    ///
    /// - Parameter completed: We are using Alamofire with Forecast API url to download the weather forecast data.
    func downloadForecastWeather(completed: @escaping DownloadComplete) {
        Alamofire.request(FORECAST_API_URL).responseJSON { (response) in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    for item in list {
                        let forecast = ForecastWeather(weatherDict: item)
                        self.forecastArray.append(forecast)
                    }
            
                    self.forecastArray.remove(at: 0)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
            completed()
        }
    }
}




