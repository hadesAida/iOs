import UIKit

class LoadingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Simulate a loading delay (e.g., 2 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showMainApp()
        }
    }

    func showMainApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") // Set this identifier in Storyboard
        mainTabBarController.modalPresentationStyle = .fullScreen
        self.present(mainTabBarController, animated: true, completion: nil)
    }
}
