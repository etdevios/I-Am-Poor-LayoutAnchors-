//
//  ViewController.swift
//  I Am Poor (LayoutAnchors)
//
//  Created by Eduard Tokarev on 22.01.2023.
//

import UIKit

class ViewController: UIViewController {
    private let mainStackView = UIStackView()
    private let label = UILabel()
    private let bottomPaddingView = UIView()
    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        applyLayout()
    }
    
    func applyStyle() {
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
    }
    
    func applyLayout() {
        applyStyleLabel(label)
        applyStyleImageView(imageView)
        
        arrangeStackView(
            mainStackView,
            subviews: [
                label,
                bottomPaddingView
            ])
        
        [imageView, mainStackView].forEach() { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 270),
            imageView.heightAnchor.constraint(equalToConstant: 270),
        ])
    }
    
    func arrangeStackView(
        _ stackView: UIStackView,
        subviews: [UIView],
        spacing: CGFloat = 0,
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fillEqually,
        alignment: UIStackView.Alignment = .center
    ){
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        
        subviews.forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
        }
    }
    
    func applyStyleLabel(
        _ label: UILabel,
        text: String = "I Am Poor",
        font: UIFont? = UIFont.systemFont(ofSize: 40)
    ){
        label.text = text
        label.font = font
    }
    
    func applyStyleImageView(
        _ imageView: UIImageView,
        image: UIImage? = UIImage(named: "coal")
    ){
        imageView.image = image
    }
}

