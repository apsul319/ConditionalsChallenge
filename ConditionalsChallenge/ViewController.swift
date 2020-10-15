//
//  ViewController.swift
//  ConditionalsChallenge
//
//  Created by Bob Marley
//  Copyright © 2020 MobileMakersEdu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    var firstChoiceCost = 0
    var secondChoiceCost = 0
    var thirdChoiceCost = 0
    var fourthChoiceCost = 0
    
    var totalMoney = Int()
    var stringToReturn = ""
    
    var clothingItemArray = [ClothingItems]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clothingItemArray.append(ClothingItems(Description: "Jacket", Price: 80))
        clothingItemArray.append(ClothingItems(Description: "Jeans", Price: 60))
        clothingItemArray.append(ClothingItems(Description: "Shirt", Price: 40))
        clothingItemArray.append(ClothingItems(Description: "Hat", Price: 20))
        
        myTableView.isEditing = true
    }
    
    func determineOutputMVP() -> String
    {
        setInfo()
        // MARK: - MVP
        if totalMoney >= firstChoiceCost {
            
            stringToReturn = "You can purchase this item!"
        }
        else {
            stringToReturn = "You cannot purchase this item."
        }
        
        
        return stringToReturn
    }
    
    func determineOutput1() -> String
    {
        setInfo()
        // MARK: - Stretch #1
        if totalMoney == firstChoiceCost {
            stringToReturn = "You have just enough money for your first choice!"
        }
       else if totalMoney >= firstChoiceCost+80  {
            stringToReturn = "You have plenty of money (over than or equal to $80 remaining) for your first choice!"
        }
        else if totalMoney > firstChoiceCost {
            stringToReturn = "You can purchase this item!"
        }
        else {
            stringToReturn = "You cannot purchase this item."
        }
        
        return stringToReturn
    }
    
    func determineOutput2() -> String
    {
        setInfo()
        // MARK: - Stretch #2
        if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost {
            stringToReturn = "You can purchase your first choice, second choice, third choice and fourth choice!"
        }
        else if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost {
            stringToReturn = "You can purchase your first, second and third choice!"
        }
        else if totalMoney >= firstChoiceCost + secondChoiceCost {
            stringToReturn = "You can purchase your first and second choice!"
        }
        else if totalMoney >= firstChoiceCost {
            stringToReturn = "You can purchase your first choice!"
        }
        else {
        }
        return stringToReturn
    }
    
    func determineOutput3() -> String
    {
        setInfo()
        // MARK: - Stretch #3
        if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost {
                   stringToReturn = "You can purchase your first choice, second choice, third choice and fourth choice!"
               }
               else if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost {
                   stringToReturn = "You can purchase your first, second and third choice! You cannot purchase your fourth choice."
               }
               else if totalMoney >= firstChoiceCost + secondChoiceCost {
                   stringToReturn = "You can purchase your first and second choice! You cannot purchase your third choice."
               }
               else if totalMoney >= firstChoiceCost {
                   stringToReturn = "You can purchase your first choice! You cannot purchase your second choice."
               }
               else {
                stringToReturn = "You do not have enough money to purchase your perferred choices."
               }
        
        
        return stringToReturn
    }
    
    func determineOutput4() -> String
    {
        setInfo()
        // MARK: - Stretch #4
        if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost {
                stringToReturn = "You can purchase all four items!"
                      }
                      else if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost {
                          stringToReturn = "You can purchase your top three items, but not all of them in the order displayed."
                      }
                      else if totalMoney >= firstChoiceCost + secondChoiceCost {
                          stringToReturn = "You can purchase your top two items, but not all of them in the order displayed."
                      }
                      else if totalMoney >= firstChoiceCost {
                          stringToReturn = "You can purchase your first item, but not all of them in the order displayed."
                      }
                      else {
                       stringToReturn = "Sorry, you cannot purchase any of the items in order."
                      }
               
        return stringToReturn
    }
    
    func determineOutput5() -> String
    {
        setInfo()
        // MARK: - Stretch #5
        if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost {
                  stringToReturn = "You can purchase all four items! You spent $200 dollars and have $0 remaining."
                        }
                        else if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost {
                            stringToReturn = "You can purchase your top three items, but not all of them in the order displayed. You spent $\(firstChoiceCost + secondChoiceCost + thirdChoiceCost) and have $\(totalMoney - (firstChoiceCost + secondChoiceCost + thirdChoiceCost)) remaining."
                        }
                        else if totalMoney >= firstChoiceCost + secondChoiceCost {
                            stringToReturn = "You can purchase your top two items, but not all of them in the order displayed. You spent $\(firstChoiceCost + secondChoiceCost) and have $\(totalMoney - (firstChoiceCost + secondChoiceCost)) remaining."
                        }
                        else if totalMoney >= firstChoiceCost {
                            stringToReturn = "You can purchase your first item, but not all of them in the order displayed. You spent $\(firstChoiceCost) and have $\(totalMoney - firstChoiceCost) remaining."
                        }
                        else {
                         stringToReturn = "Sorry, you cannot purchase any of the items in order."
                        }
                 
        
        
        return stringToReturn
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let selectedItem = clothingItemArray[sourceIndexPath.row]
        clothingItemArray.remove(at: sourceIndexPath.row)
        clothingItemArray.insert(selectedItem, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        let selectedClothingItem = clothingItemArray[indexPath.row]
        cell.textLabel!.text = selectedClothingItem.description + " $\(selectedClothingItem.price)"
        return cell
    }
    
    @IBAction func whenRefreshPressed(_ sender: UIBarButtonItem)
    {
        setInfo()
        onSegmentChosenPressed()
    }
    
    func setInfo()
    {
        totalMoney = (Int)(arc4random_uniform(10)*20 + 20)
        stringToReturn = ""
        navigationItem.title = "You have $\(totalMoney)"
        firstChoiceCost = clothingItemArray[0].price
        secondChoiceCost = clothingItemArray[1].price
        thirdChoiceCost = clothingItemArray[2].price
        fourthChoiceCost = clothingItemArray[3].price
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return clothingItemArray.count
    }
    
    func onSegmentChosenPressed()
    {
        switch mySegmentedControl.selectedSegmentIndex
        {
        case 0:
            myTextView.text = determineOutputMVP()
        case 1:
            myTextView.text = determineOutput1()
        case 2:
            myTextView.text = determineOutput2()
        case 3:
            myTextView.text = determineOutput3()
        case 4:
            myTextView.text = determineOutput4()
        case 5:
            myTextView.text = determineOutput5()
        default:
            print("Error")
        }
    }
}

