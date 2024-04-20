//
//  OnBoardingView.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/20/24.
//

import UIKit

class OnBoardingView: UIViewController  {
    
    private lazy var onBoardingCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(OnBoardCell.self, forCellWithReuseIdentifier: OnBoardCell.reuseID)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var uiPageControl: UIPageControl = {
        let view = UIPageControl()
        view.currentPage = 0
        view.numberOfPages = 4
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var skipButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("skip", for: .normal)
        view.setTitleColor(.red, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(skipbuttonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Next", for: .normal)
        view.setTitleColor(.label, for: .normal)
        view.backgroundColor = UIColor().rgb(r: 251,
                                             g: 222,
                                             b: 63,
                                             alpha: 100)
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return view
    }()
    
    var currentPage = 0
    
    var StructBoarding: [structBoarding] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrains()
        setupButtons()
        setupParamets()
        onBoardingCollectionView.reloadData()
        DispatchQueue.main.async {
            self.scrollToCurrentPage(animated: false)
        }
    }
    
    func test() {
        guard StructBoarding.count > currentPage + 0 else { return }
        
        onBoardingCollectionView.isPagingEnabled = false
        onBoardingCollectionView.scrollToItem(at: IndexPath(item: currentPage + 0, section: 0), at: .centeredHorizontally, animated: true)
        onBoardingCollectionView.isPagingEnabled = true
    }
    
    private func setupConstrains() {
        view.addSubview(onBoardingCollectionView)
        view.addSubview(uiPageControl)
        NSLayoutConstraint.activate([
            onBoardingCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            onBoardingCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            onBoardingCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            onBoardingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            uiPageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            uiPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupParamets() {
        StructBoarding = [
            structBoarding(image: "Image1",
                            label: "Trending Foods",
                            secondLabel: "Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam."),
            structBoarding(image: "Image2",
                            label: "Fast Delivery",
                            secondLabel: "Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam."),
            structBoarding(image: "Image3",
                            label: "Find Nearby Restaurants",
                           secondLabel: "Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam."),
            structBoarding(image: "Image4",
                            label: "Easy Ordering",
                            secondLabel: "Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam.")
        ]
        onBoardingCollectionView.reloadData()
    }
    
    
    private func setupButtons() {
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            skipButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            skipButton.heightAnchor.constraint(equalToConstant: 42),
            skipButton.widthAnchor.constraint(equalToConstant: 173),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 42),
            nextButton.widthAnchor.constraint(equalToConstant: 173)
        ])
    }
    
    @objc private func nextButtonTapped() {
        UserDefaults.standard.set(true, forKey: "One_Board_cell")
        if currentPage < StructBoarding.count - 1 {
            currentPage += 1
            scrollToCurrentPage(animated: true)
        } else {
            transitionToHomeView()
        }
    }
    
    private func scrollToCurrentPage(animated: Bool) {
        let indexPath = IndexPath(item: currentPage, section: 0)
        onBoardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: animated)
        uiPageControl.currentPage = currentPage
    }
    
    private func transitionToHomeView() {
        let vc = StartingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func skipbuttonTapped() {
        let vc = StartingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension OnBoardingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StructBoarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardCell.reuseID, for: indexPath) as! OnBoardCell
        cell.configure(with: StructBoarding[indexPath.row])
        return cell
    }
    
    
}

extension OnBoardingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffSet = scrollView.contentOffset.x
        
        let page = (contentOffSet / view.frame.width)
        
        switch page {
        case 0.0:
            uiPageControl.currentPage = 0
            currentPage = 0
        case 1.0:
            uiPageControl.currentPage = 1
            currentPage = 1
        case 2.0:
            uiPageControl.currentPage = 2
            currentPage = 2
        default:
            ()
        }
    }
}


