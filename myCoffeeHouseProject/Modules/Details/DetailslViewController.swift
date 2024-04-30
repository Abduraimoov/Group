//
//  DetailslViewController.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/30/24.
//

import UIKit
import SnapKit

protocol DetailslViewControllerDelegate: AnyObject {
    func didBuyButton()
}

class DetailslViewController: UIViewController {
    
    private let detailsView = DetailsView(frame: .zero)
    
    var idMeal: String!
    
    private let netWorkLayer = NetworkLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadMealDetails(idMeal: idMeal)
        setupConstraints()
        detailsView.delegate = self
    }
    
    private func setupConstraints() {
        view.addSubview(detailsView)
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func loadMealDetails(idMeal: String) {
        netWorkLayer.fetchMealDetails(by: idMeal) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let mealDetails):
                DispatchQueue.main.async {
                    self.detailsView.fill(with: mealDetails)
                }
            case .failure(let error):
                print("Ошибка: \(error)")
            }
        }
    }
}

extension DetailslViewController: DetailslViewControllerDelegate {
    func didBuyButton() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
