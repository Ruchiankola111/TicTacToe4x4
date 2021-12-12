
import UIKit

class TicTacToeVC: UIViewController {
    
    private var state = [2,2,2,2,
                         2,2,2,2,
                         2,2,2,2,
                         2,2,2,2]
    
    private let winningCombination = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],
                                      [0,4,8,12],[1,5,9,13],[2,6,10,14],[3,7,11,15],
                                      [0,5,10,15],[3,6,9,12]]
    
    private var zeroFlag = false
    
    private let myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 120,left:20, bottom: 20, right:20)
        layout.itemSize = CGSize(width:75, height:75)
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "bg")!)

        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgg")!)
        view.addSubview(myCollectionView)
        setupCollectionView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myCollectionView.frame = view.bounds
    }
    
}
extension TicTacToeVC:UICollectionViewDataSource, UICollectionViewDelegate{
    
    private func setupCollectionView() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        myCollectionView.register(T4cell.self, forCellWithReuseIdentifier: "T4cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "T4cell", for: indexPath) as! T4cell
        cell.setupCell(with: state[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if state[indexPath.row] != 0 && state[indexPath.row] != 1 {
            
            state.remove(at: indexPath.row)
            if(zeroFlag) {
                state.insert(0, at: indexPath.row)
            }
            else {
                state.insert(1, at: indexPath.row)
            }
            
            zeroFlag = !zeroFlag
            collectionView.reloadSections(IndexSet(integer: 0))
            checkWinner()
            
        }
    }
    private func checkWinner() {
        if !state.contains(2)
        {
            resetState()
            print("Draw")
        }
        else {
            for i in winningCombination {
                if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state[ i[2] ] && state[ i[2] ] == state[ i[3] ] && state [ i[0] ]  != 2{
                    resetState()
                    print("\(state[ i[0] ]) won")
                    break
                }
                
                
                
            }
        }
    }
    private func resetState() {
        state = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
        zeroFlag = false
        myCollectionView.reloadSections(IndexSet(integer: 0))
    }
}
