//
//  RMCharacterListView.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 15/03/2023.
//

import UIKit
///View that handles showing list of characters, loader, etc.
final class RMCharacterListView: UIView {

    private let viewModel = RMCharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(collectionView, spinner)
        
        addConstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        setUpCollectionView()
        viewModel.fetchCharacters()
        
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        print("setUp CollectionView with dataSource, delegate")
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
//            self.spinner.stopAnimating()
//
//            self.collectionView.isHidden = false
//
//            UIView.animate(withDuration: 0.4, animations: {
//                self.collectionView.alpha = 1
//            })
//        })
    }
    
}

extension RMCharacterListView: RMCharactersListViewViewModelDelegate {
    func didLoadInitialCharacters() {
//        setUpCollectionView()
        print("Data from API is ready to reload data for CollectionView")
        self.spinner.stopAnimating()
        
        self.collectionView.isHidden = false
        collectionView.reloadData() // Initial fetch
        UIView.animate(withDuration: 0.4, animations: {
            self.collectionView.alpha = 1
        })
    }
}
