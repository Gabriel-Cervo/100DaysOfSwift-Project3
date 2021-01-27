//
//  DetailViewController.swift
//  100DaysOfSwift-Project1
//
//  Created by João Gabriel Dourado Cervo on 24/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImageName: String?
    
    var selectedImageIndex: Int?
    var numberOfImages: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never // Titulo de tamanho normal, visto que herda o grande do viewController inicial
            
        guard let selectedImageNumber = selectedImageIndex else { return }
        guard let totalNumberOfImages = numberOfImages else { return }

        title = "Picture \(selectedImageNumber + 1) of \(totalNumberOfImages)"

        // Verifica se o nome de uma imagem foi passada, e coloca ela no imageView
        guard let imageToLoad = selectedImageName else { return }
        
        imageView.image = UIImage(named: imageToLoad)
    }
    
    // Esconde a barra de navegacao quando for aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // Mostra novamente assim que sair
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
