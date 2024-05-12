//
//  LocationRowCell.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 27.04.2024.
//

import UIKit
import SnapKit

class LocationRowCell: UICollectionViewCell {
    
    lazy var conditionImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "city_name"
        label.textColor = .white
        label.backgroundColor = .brown
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
       let label = UILabel()
        label.text = "temp"
        label.textColor = .white
        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return  label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    
    func  setupLayouts() {
        
        addSubview(conditionImageView)
        conditionImageView.snp.makeConstraints { make  in
            make.top.left.equalToSuperview().offset(15)
            make.size.equalTo(60)
        }
        
        addSubview(temperatureLabel)
               temperatureLabel.snp.makeConstraints { make in
                   make.top.equalToSuperview().offset(15)
                   make.left.equalTo(conditionImageView.snp.right).offset(15)
                   make.height.equalTo(60)
               }
        
        addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(temperatureLabel.snp.right).offset(25)
            make.height.equalTo(60)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

