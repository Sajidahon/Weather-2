//
//  WeeklyForecastCell.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 27.04.2024.
//

import UIKit
import SnapKit

class WeeklyForecastCell: UICollectionViewCell {
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Monday"
        label.textColor = .white
        label.backgroundColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "27/04/2024"
        label.textColor = .white
        label.backgroundColor = .brown
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "temperatureC"
        label.textColor = .white
        label.backgroundColor = .brown
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(35)
            make.bottom.equalToSuperview().offset(-25)
        }
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(35)
            make.bottom.equalToSuperview().offset(-10)
        }
        addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(270)
            make.right.equalToSuperview().offset(-25)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    func configureCell(forecastData: ForecastWeather) {
        self.dayLabel.text = "\(forecastData.day)"
        self.dateLabel.text = "\(forecastData.date)"
        self.temperatureLabel.text = "\(Int(forecastData.temp))"
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

