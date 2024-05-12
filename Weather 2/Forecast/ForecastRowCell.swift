//
//  ForecastRowCell.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 27.04.2024.
//

import UIKit
import SnapKit

class ForecastRowCell: UICollectionViewCell {
    
    lazy var conditionImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "earth")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //location
    lazy var locationView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "city_name"
        label.textColor = .white
        label.backgroundColor = .brown
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentCityTempLabel: UILabel = {
        let label = UILabel()
        label.text = "teperature"
        label.textColor = .white
        label.backgroundColor = .green
        label.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sun")
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description of the weather\nmax:;min:"
        label.numberOfLines = 2
        label.backgroundColor = .yellow
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
   
    
    func  setupLayouts() {
        
        addSubview(conditionImageView)
        conditionImageView.snp.makeConstraints { make  in
            make.top.left.right.bottom.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        addSubview(locationView)
        locationView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        locationView.addSubview(cityNameLabel)
        cityNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        locationView.addSubview(currentCityTempLabel)
        currentCityTempLabel.snp.makeConstraints { make in
            make.top.equalTo(cityNameLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        locationView.addSubview(weatherImageView)
        weatherImageView.snp.makeConstraints { make in
            make.top.equalTo(currentCityTempLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.size.equalTo(70)
        }
        
        locationView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



