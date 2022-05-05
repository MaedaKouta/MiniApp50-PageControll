//
//  PageViewController.swift
//  MiniApp50-PageControll
//
//  Created by 前田航汰 on 2022/04/30.
//

import UIKit

class PageViewController: UIPageViewController {

    // ViewControllerを管理する
    var controllers: [UIViewController] = []
    var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 赤いViewController
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red

        // 青いViewController
        let blueVC = UIViewController()
        blueVC.view.backgroundColor = .blue

        // 青いViewController
        let greenVC = UIViewController()
        greenVC.view.backgroundColor = .green


        controllers = [redVC, blueVC, greenVC]

        // 最初のViewControllerを赤色のViewControllerを設定
        setViewControllers([controllers[0]], direction: .forward, animated: true, completion: nil)
        self.dataSource = self

        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.height - 100, width:self.view.frame.width, height:50))
        pageControl.numberOfPages = controllers.count
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = controllers.firstIndex(of: viewController)!
        pageControl.currentPage = index
        index = index - 1

        if index < 0 {
            return nil
        }

        return controllers[index]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = controllers.firstIndex(of: viewController)!
        pageControl.currentPage = index

        if index == controllers.count - 1 {
            return nil
        }

        index = index + 1
        return controllers[index]
    }

}
