//
//  HomeViewController.swift
//  Cproject
//
//  Created by 곽서방 on 6/24/24.
//

import UIKit

class HomeViewController: UIViewController {
    enum Section {
        case banner
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    //dataSource를 만들 때는 colletionView가 필요하다. 근데 collectionView는 HomeViewController가 생성된 이후에 가지고 있는 변수이기에 변수를 생성할때는 collectionView룰 이용할 수 없다.
    private var dataSource: UICollectionViewDiffableDataSource<Section,UIImage>?
    //closer 로 셋팅 다른 변수를 설정할 것이 없어 뷰 컨트롤러 초기화될 떄 같이 초기화.
    private var compositionalLayout: UICollectionViewCompositionalLayout = {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(165 / 393))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging // 스크롤 설정 넘어가는 페이지로. 안하면 그냥 3행이 나옴
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dataSource 셋팅
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            // cell 생성인데 스토리보드에 있는 cell을 가져올건데 그거는 재사용을 위해서 자동으로 dequeue가 되어있다.
            //로직 -> 컬렉션뷰에 있는 저장되어있는 설정한 cell을 가져옴
            let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as! HomeBannerCollectionViewCell
            // 밑에 item에서 받아온 것이 itemIdentifier로 넘어온다.
            //itemIdentifier에서 받아온 이미지를 imagecell에 넣어주는 작업
            cell.setImage(itemIdentifier)
            return cell
        })
        
        var snapshot: NSDiffableDataSourceSnapshot<Section,UIImage> =
        NSDiffableDataSourceSnapshot<Section,UIImage>()
        
        snapshot.appendSections([.banner])
        // itemIdentifier로 들어감
        snapshot.appendItems([UIImage(resource: .slide1),UIImage(resource: .slide2),UIImage(resource: .slide3)], toSection: .banner)
        //스냅샷 적용
        dataSource?.apply(snapshot)
        // 레이아웃 적용
        collectionView.collectionViewLayout = compositionalLayout
    }
    
    
    
}
