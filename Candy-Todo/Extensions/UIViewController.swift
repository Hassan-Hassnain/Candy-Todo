//
//  UIViewController.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 28/10/2020.
//

import UIKit
import SideMenu

extension UIViewController
{
    
    class func initVC(_ name: String = "Main") -> Self
    {
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
    
    func setUpSidMenu( menu: inout SideMenuNavigationController?) {
        menu = SideMenuNavigationController(rootViewController: MenuVC())
        menu?.leftSide = true
        menu?.menuWidth = 325
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
}
