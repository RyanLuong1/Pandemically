// first: make 10 journal objects and the date should be different for each of them

// second: put the 10 journal objects to a list or an array

// third: sort the array based on the date

// fourth: at the end print the date

// note- use this format for the date: dd/mm/yyyy or mm/dd/yyyy or Month Day, Year
// (when making the journal object, make sure the date is the mm/dd/yyyy format)
import UIKit

class storage_page: UIViewController {
    @IBOutlet var storageScrollView: UIScrollView!
    var journalTitle: String = ""
    var journalMessage: String = ""
    var emoji: String = ""
    var activities: [String] = []
    var dateForJournal: String = ""
    var sortedJournalList: [Journal] = []

    func buttonCreation(journal: Journal, index: Int) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: index * 45, width: 350, height: 45)
        button.setTitle(journal.title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Menlo-Bold", size: 17)
        return button
    }

    func getIndexForJournalList(button: UIButton) -> Int {
        let y = Int(button.frame.origin.y)
        let index = y / 45
        return index
    }

    override func viewDidLoad() {
        var journalList = read()
        sortedJournalList = journalList.sorted(by: {
            $0.date.compare($1.date) == .orderedAscending
        })
        print(sortedJournalList)
        for (index, journal) in sortedJournalList.enumerated() {
            let button = buttonCreation(journal: journal, index: index)
            storageScrollView.addSubview(button)
            button.addTarget(self, action: #selector(segueAction), for: .touchUpInside)
        }
    }

    @objc func segueAction(sender: UIButton!) {
        let index = getIndexForJournalList(button: sender)
        journalTitle = sortedJournalList[index].title
        journalMessage = sortedJournalList[index].message
        emoji = sortedJournalList[index].feeling
        activities = sortedJournalList[index].activities
        dateForJournal = sortedJournalList[index].date
        performSegue(withIdentifier: "toPopUpView", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var dataForPopUp = segue.destination as! pop_up_page
        dataForPopUp.journalTitle = journalTitle
        dataForPopUp.journalMessage = journalMessage
        dataForPopUp.emoji = emoji
        dataForPopUp.activities = activities
        dataForPopUp.dateForJournal = dateForJournal
    }
}
