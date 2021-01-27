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
        // Cria um UIBarButtonItem e coloca na navbar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped)) // o selector diz que metodo deve ser chamado

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
    
    // Faz com que seja possivel compartilhar a imagem
    // sempre que chamar por um selector, por @objc
    @objc func shareTapped() {
        // Pega a img do imageView e transforma em data jpeg
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        guard let imageName = selectedImageName else {
            print("Can't get the image name!")
            return
        }

        // Cria e chama o UIActivityViewController -> Método do iOS para compartilhar conteúdo
        let activityViewController = UIActivityViewController(activityItems: [imageName, image], applicationActivities: []) // Aqui se passa um array de itens para compartilhar, e um array de servicos do app que devem estar na lista
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // Aqui diz de onde ele deve aparecer, mas como no iOS é full screen, só tem efeito no ipad
        present(activityViewController, animated: true)
    }
}
