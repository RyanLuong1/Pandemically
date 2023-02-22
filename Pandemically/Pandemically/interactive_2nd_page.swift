  
//
//  interactive_2nd_page.swift
//  Pandemically
//
//  Created by Ryan Luong on 10/29/20.
//  Copyright © 2020 Ryan Luong. All rights reserved.
//
import UIKit

class interactive_2nd_page: UIViewController {
    var activities = [String]()
    var emoji = ""
    var maxActivitiesAllowed = 0
    @IBOutlet var financebtnImage: UIButton! {
        didSet {
            financebtnImage.setImage(UIImage(named: "finance"), for: .normal)
        }
    }
     
    @IBOutlet var healthbtnImage: UIButton! {
        didSet {
            healthbtnImage.setImage(UIImage(named: "health"), for: .normal)
        }
    }
     
    @IBOutlet var leisurebtnImage: UIButton! {
        didSet {
            leisurebtnImage.setImage(UIImage(named: "leisure"), for: .normal)
        }
    }
     
    @IBOutlet var lovedonesbtnImage: UIButton! {
        didSet {
            lovedonesbtnImage.setImage(UIImage(named: "lovedones"), for: .normal)
        }
    }
     
    @IBOutlet var randombtnImage: UIButton! {
        didSet {
            randombtnImage.setImage(UIImage(named: "random"), for: .normal)
        }
    }
     
    @IBOutlet var schoolbtnImage: UIButton! {
        didSet {
            schoolbtnImage.setImage(UIImage(named: "school"), for: .normal)
        }
    }
     
    @IBOutlet var socialmediabtnImage: UIButton! {
        didSet {
            socialmediabtnImage.setImage(UIImage(named: "socialmedia"), for: .normal)
        }
    }
     
    @IBOutlet var workbtnImage: UIButton! {
        didSet {
            workbtnImage.setImage(UIImage(named: "work"), for: .normal)
        }
    }
     
    func setBtnImageToBlackAndWhite(outlet: UIButton, imageName: String, activityName: String) {
        outlet.setImage(UIImage(named: imageName), for: .normal)
        activities.append(activityName)
        maxActivitiesAllowed += 1
    }
     
    func setBtnImageToOriginal(outlet: UIButton, imageName: String, activityName: String) {
        outlet.setImage(UIImage(named: imageName), for: .normal)
        activities.removeAll(where: { $0 == activityName })
        maxActivitiesAllowed -= 1
    }
     
    func appendEmptyActivities() {
        let start = activities.count
        for index in start ..< 4 {
            activities.append("")
        }
    }
     
    @IBAction func financebtnImage(_ sender: Any) {
        let currentBtnImage = financebtnImage.image(for: .normal)
        let financeImage = UIImage(named: "finance")
        guard currentBtnImage == financeImage else {
            setBtnImageToOriginal(outlet: financebtnImage, imageName: "finance", activityName: "finance")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: financebtnImage, imageName: "financebw", activityName: "finance")
    }

    @IBAction func healthbtnImage(_ sender: Any) {
        let currentBtnImage = healthbtnImage.image(for: .normal)
        let healthImage = UIImage(named: "health")
        guard currentBtnImage == healthImage else {
            setBtnImageToOriginal(outlet: healthbtnImage, imageName: "health", activityName: "health")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: healthbtnImage, imageName: "healthbw", activityName: "health")
    }

    @IBAction func leisurebtnImage(_ sender: Any) {
        let currentBtnImage = leisurebtnImage.image(for: .normal)
        let leisureImage = UIImage(named: "leisure")
        guard currentBtnImage == leisureImage else {
            setBtnImageToOriginal(outlet: leisurebtnImage, imageName: "leisure", activityName: "leisure")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: leisurebtnImage, imageName: "leisurebw", activityName: "leisure")
    }

    @IBAction func lovedonesbtnImage(_ sender: Any) {
        let currentBtnImage = lovedonesbtnImage.image(for: .normal)
        let lovedonesImage = UIImage(named: "lovedones")
        guard currentBtnImage == lovedonesImage else {
            setBtnImageToOriginal(outlet: lovedonesbtnImage, imageName: "lovedones", activityName: "lovedones")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: lovedonesbtnImage, imageName: "lovedonesbw", activityName: "lovedones")
    }

    @IBAction func randombtnImage(_ sender: Any) {
        let currentBtnImage = randombtnImage.image(for: .normal)
        let randomImage = UIImage(named: "random")
        guard currentBtnImage == randomImage else {
            setBtnImageToOriginal(outlet: randombtnImage, imageName: "random", activityName: "random")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: randombtnImage, imageName: "randombw", activityName: "random")
    }

    @IBAction func schoolbtnImage(_ sender: Any) {
        let currentBtnImage = schoolbtnImage.image(for: .normal)
        let schoolImage = UIImage(named: "school")
        guard currentBtnImage == schoolImage else {
            setBtnImageToOriginal(outlet: schoolbtnImage, imageName: "school", activityName: "school")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: schoolbtnImage, imageName: "schoolbw", activityName: "school")
    }

    @IBAction func socialmediabtnImage(_ sender: Any) {
        let currentBtnImage = socialmediabtnImage.image(for: .normal)
        let socialmediaImage = UIImage(named: "socialmedia")
        guard currentBtnImage == socialmediaImage else {
            setBtnImageToOriginal(outlet: socialmediabtnImage, imageName: "socialmedia", activityName: "socialmedia")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: socialmediabtnImage, imageName: "socialmediabw", activityName: "socialmedia")
    }

    @IBAction func workbtnImage(_ sender: Any) {
        let currentBtnImage = workbtnImage.image(for: .normal)
        let workImage = UIImage(named: "work")
        guard currentBtnImage == workImage else {
            setBtnImageToOriginal(outlet: workbtnImage, imageName: "work", activityName: "work")
            return
        }
         
        guard maxActivitiesAllowed < 4 else {
            return
        }
        setBtnImageToBlackAndWhite(outlet: workbtnImage, imageName: "workbw", activityName: "work")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var dataForThirdPage = segue.destination as! interactive_3rd_page
        if activities.count < 4 {
            appendEmptyActivities()
        }
        dataForThirdPage.emoji = emoji
        dataForThirdPage.activities = activities
    }
}
