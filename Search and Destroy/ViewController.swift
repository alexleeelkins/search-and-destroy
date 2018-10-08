//
//  ViewController.swift
//  Search and Destroy
//
//  Created by Alex Elkins on 10/2/18.
//  Copyright © 2018 Alex Elkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var filteredSongs = [SearchResult]()
    let songs = [
        Song(title: "12-Bar Original"),
        Song(title: "A Day in the Life"),
        Song(title: "A Hard Day's Night"),
        Song(title: "A Shot of Rhythm and Blues"),
        Song(title: "A Taste of Honey"),
        Song(title: "Across the Universe"),
        Song(title: "Act Naturally"),
        Song(title: "Ain't She Sweet"),
        Song(title: "All I've Got to Do"),
        Song(title: "All My Loving"),
        Song(title: "All Things Must Pass"),
        Song(title: "All Together Now"),
        Song(title: "All You Need Is Love"),
        Song(title: "And I Love Her"),
        Song(title: "And Your Bird Can Sing"),
        Song(title: "Anna (Go to Him)"),
        Song(title: "Another Girl"),
        Song(title: "Any Time at All"),
        Song(title: "Ask Me Why"),
        Song(title: "Baby It's You"),
        Song(title: "Baby, You're a Rich Man"),
        Song(title: "Baby's in Black"),
        Song(title: "Back in the U.S.S.R"),
        Song(title: "Bad Boy"),
        Song(title: "Bad to Me"),
        Song(title: "Beautiful Dreamer"),
        Song(title: "Because I Know You Love Me So"),
        Song(title: "Because"),
        Song(title: "Being for the Benefit of Mr. Kite!"),
        Song(title: "Bésame Mucho"),
        Song(title: "Birthday"),
        Song(title: "Blackbird"),
        Song(title: "Blue Jay Way"),
        Song(title: "Boys"),
        Song(title: "Can't Buy Me Love"),
        Song(title: "Carol"),
        Song(title: "Carry That Weight"),
        Song(title: "Catswalk"),
        Song(title: "Cayenne"),
        Song(title: "Chains"),
        Song(title: "Child of Nature"),
        Song(title: "Christmas Time (Is Here Again)"),
        Song(title: "Circles"),
        Song(title: "Clarabella"),
        Song(title: "Come and Get It"),
        Song(title: "Come Together"),
        Song(title: "Cry Baby Cry"),
        Song(title: "Cry for a Shadow"),
        Song(title: "Crying, Waiting, Hoping"),
        Song(title: "Day Tripper"),
        Song(title: "Dear Prudence"),
        Song(title: "Devil in Her Heart"),
        Song(title: "Dig a Pony"),
        Song(title: "Dig It"),
        Song(title: "Dizzy, Miss Lizzy"),
        Song(title: "Do You Want to Know a Secret?"),
        Song(title: "Doctor Robert"),
        Song(title: "Don't Bother Me"),
        Song(title: "Don't Ever Change"),
        Song(title: "Don't Let Me Down"),
        Song(title: "Don't Pass Me By"),
        Song(title: "Drive My Car"),
        Song(title: "Eight Days a Week"),
        Song(title: "Eleanor Rigby"),
        Song(title: "Etcetera"),
        Song(title: "Every Little Thing"),
        Song(title: "Everybody's Got Something to Hide Except Me and My Monkey"),
        Song(title: "Everybody's Trying to Be My Baby"),
        Song(title: "Fancy My Chances with You"),
        Song(title: "Fixing a Hole"),
        Song(title: "Flying"),
        Song(title: "For No One"),
        Song(title: "For You Blue"),
        Song(title: "Free as a Bird"),
        Song(title: "From Me to You"),
        Song(title: "From Us to You"),
        Song(title: "Get Back"),
        Song(title: "Getting Better"),
        Song(title: "Girl"),
        Song(title: "Glad All Over"),
        Song(title: "Glass Onion"),
        Song(title: "Golden Slumbers"),
        Song(title: "Good Day Sunshine"),
        Song(title: "Good Morning Good Morning"),
        Song(title: "Good Night"),
        Song(title: "Goodbye"),
        Song(title: "Got to Get You into My Life"),
        Song(title: "Hallelujah, I Love Her So"),
        Song(title: "Happiness Is a Warm Gun"),
        Song(title: "Heather"),
        Song(title: "Hello Little Girl"),
        Song(title: "Hello, Goodbye"),
        Song(title: "Help!"),
        Song(title: "Helter Skelter"),
        Song(title: "Her Majesty"),
        Song(title: "Here Comes the Sun"),
        Song(title: "Here, There and Everywhere"),
        Song(title: "Hey Bulldog"),
        Song(title: "Hey Jude"),
        Song(title: "Hippy Hippy Shake"),
        Song(title: "Hold Me Tight"),
        Song(title: "Honey Don't"),
        Song(title: "Honey Pie"),
        Song(title: "How Do You Do It?"),
        Song(title: "I Am the Walrus"),
        Song(title: "I Call Your Name"),
        Song(title: "I Don't Want to Spoil the Party"),
        Song(title: "I Feel Fine"),
        Song(title: "I Forgot to Remember to Forget"),
        Song(title: "I Got a Woman"),
        Song(title: "I Got to Find My Baby"),
        Song(title: "I Just Don't Understand"),
        Song(title: "I Lost My Little Girl"),
        Song(title: "I Me Mine"),
        Song(title: "I Need You"),
        Song(title: "I Saw Her Standing There"),
        Song(title: "I Should Have Known Better"),
        Song(title: "I Wanna Be Your Man"),
        Song(title: "I Want to Hold Your Hand"),
        Song(title: "I Want to Tell You"),
        Song(title: "I Want You (She's So Heavy)"),
        Song(title: "I Will"),
        Song(title: "I'll Be Back"),
        Song(title: "I'll Be on My Way"),
        Song(title: "I'll Cry Instead"),
        Song(title: "I'll Follow the Sun"),
        Song(title: "I'll Get You"),
        Song(title: "I'm a Loser"),
        Song(title: "I'm Down"),
        Song(title: "I'm Gonna Sit Right Down and Cry (Over You)"),
        Song(title: "I'm Happy Just to Dance with You"),
        Song(title: "I'm In Love"),
        Song(title: "I'm Looking Through You"),
        Song(title: "I'm Only Sleeping"),
        Song(title: "I'm So Tired"),
        Song(title: "I'm Talking About You"),
        Song(title: "I've Got a Feeling"),
        Song(title: "I've Just Seen a Face"),
        Song(title: "If I Fell"),
        Song(title: "If I Needed Someone"),
        Song(title: "If You've Got Trouble"),
        Song(title: "In My Life"),
        Song(title: "In Spite of All the Danger"),
        Song(title: "It Won't Be Long"),
        Song(title: "It's All Too Much"),
        Song(title: "It's Only Love"),
        Song(title: "Jazz Piano Song"),
        Song(title: "Jessie's Dream"),
        Song(title: "Johnny B. Goode"),
        Song(title: "Julia"),
        Song(title: "Junk"),
        Song(title: "Kansas City/Hey-Hey-Hey-Hey!"),
        Song(title: "Keep Your Hands Off My Baby"),
        Song(title: "Komm, gib mir deine Hand"),
        Song(title: "Lady Madonna"),
        Song(title: "Leave My Kitten Alone"),
        Song(title: "Lend Me Your Comb"),
        Song(title: "Let It Be"),
        Song(title: "Like Dreamers Do"),
        Song(title: "Little Child"),
        Song(title: "Lonesome Tears in My Eyes"),
        Song(title: "Long Tall Sally"),
        Song(title: "Long, Long, Long"),
        Song(title: "Looking Glass"),
        Song(title: "Love Me Do"),
        Song(title: "Love of the Loved"),
        Song(title: "Love You To"),
        Song(title: "Lovely Rita"),
        Song(title: "Lucille"),
        Song(title: "Lucy in the Sky with Diamonds"),
        Song(title: "Madman"),
        Song(title: "Maggie Mae"),
        Song(title: "Magical Mystery Tour"),
        Song(title: "Mailman, Bring Me No More Blues"),
        Song(title: "Martha My Dear"),
        Song(title: "Matchbox"),
        Song(title: "Maxwell's Silver Hammer"),
        Song(title: "Mean Mr. Mustard"),
        Song(title: "Memphis, Tennessee"),
        Song(title: "Michelle"),
        Song(title: "Misery"),
        Song(title: "Money (That's What I Want)"),
        Song(title: "Moonlight Bay"),
        Song(title: "Mother Nature's Son"),
        Song(title: "Mr. Moonlight"),
        Song(title: "No Reply"),
        Song(title: "Norwegian Wood (This Bird Has Flown)"),
        Song(title: "Not a Second Time"),
        Song(title: "Not Guilty"),
        Song(title: "Nothin' Shakin' (But the Leaves on the Trees)"),
        Song(title: "Now and Then"),
        Song(title: "Nowhere Man"),
        Song(title: "Ob-La-Di, Ob-La-Da"),
        Song(title: "Octopus's Garden"),
        Song(title: "Oh! Darling"),
        Song(title: "Old Brown Shoe"),
        Song(title: "One After 909"),
        Song(title: "One and One Is Two"),
        Song(title: "Only a Northern Song"),
        Song(title: "Ooh! My Soul"),
        Song(title: "P.S. I Love You"),
        Song(title: "Paperback Writer"),
        Song(title: "Penny Lane"),
        Song(title: "Piggies"),
        Song(title: "Please Mr. Postman"),
        Song(title: "Please Please Me"),
        Song(title: "Polythene Pam"),
        Song(title: "Rain"),
        Song(title: "Real Love"),
        Song(title: "Revolution 1"),
        Song(title: "Revolution 9"),
        Song(title: "Revolution"),
        Song(title: "Rip It Up/Shake, Rattle, and Roll/Blue Suede Shoes"),
        Song(title: "Rock and Roll Music"),
        Song(title: "Rocky Raccoon"),
        Song(title: "Roll Over Beethoven"),
        Song(title: "Run for Your Life"),
        Song(title: "Savoy Truffle"),
        Song(title: "Searchin'"),
        Song(title: "September in the Rain"),
        Song(title: "Sexy Sadie"),
        Song(title: "Sgt. Pepper's Lonely Hearts Club Band (Reprise)"),
        Song(title: "Sgt. Pepper's Lonely Hearts Club Band"),
        Song(title: "Shakin' in the Sixties"),
        Song(title: "She Came in Through the Bathroom Window"),
        Song(title: "She Loves You"),
        Song(title: "She Said She Said"),
        Song(title: "She's a Woman"),
        Song(title: "She's Leaving Home"),
        Song(title: "Shout"),
        Song(title: "Sie liebt dich"),
        Song(title: "Slow Down"),
        Song(title: "So How Come (No One Loves Me)"),
        Song(title: "Soldier of Love (Lay Down Your Arms)"),
        Song(title: "Some Other Guy"),
        Song(title: "Something"),
        Song(title: "Sour Milk Sea"),
        Song(title: "Step Inside Love/Los Paranoias"),
        Song(title: "Strawberry Fields Forever"),
        Song(title: "Sun King"),
        Song(title: "Sure to Fall (in Love with You)"),
        Song(title: "Sweet Little Sixteen"),
        Song(title: "Take Good Care of My Baby"),
        Song(title: "Taking a Trip to Carolina"),
        Song(title: "Taxman"),
        Song(title: "Teddy Boy"),
        Song(title: "Tell Me What You See"),
        Song(title: "Tell Me Why"),
        Song(title: "Thank You Girl"),
        Song(title: "That Means a Lot"),
        Song(title: "That'll Be the Day"),
        Song(title: "That’s All Right (Mama)"),
        Song(title: "The Ballad of John and Yoko"),
        Song(title: "The Continuing Story of Bungalow Bill"),
        Song(title: "The End"),
        Song(title: "The Fool on the Hill"),
        Song(title: "The Honeymoon Song"),
        Song(title: "The Inner Light"),
        Song(title: "The Long and Winding Road"),
        Song(title: "The Night Before"),
        Song(title: "The Sheik of Araby"),
        Song(title: "The Word"),
        Song(title: "There's a Place"),
        Song(title: "Things We Said Today"),
        Song(title: "Think for Yourself"),
        Song(title: "This Boy"),
        Song(title: "Three Cool Cats"),
        Song(title: "Ticket to Ride"),
        Song(title: "Till There Was You"),
        Song(title: "Tip of My Tongue"),
        Song(title: "To Know Her is to Love Her"),
        Song(title: "Tomorrow Never Knows"),
        Song(title: "Too Much Monkey Business"),
        Song(title: "Twist and Shout"),
        Song(title: "Two of Us"),
        Song(title: "Wait"),
        Song(title: "Watching Rainbows"),
        Song(title: "We Can Work It Out"),
        Song(title: "What Goes On"),
        Song(title: "What You're Doing"),
        Song(title: "What's The New Mary Jane"),
        Song(title: "When I Get Home"),
        Song(title: "When I'm Sixty-Four"),
        Song(title: "While My Guitar Gently Weeps"),
        Song(title: "Why Don't We Do It in the Road?"),
        Song(title: "Wild Honey Pie"),
        Song(title: "With a Little Help from My Friends"),
        Song(title: "Within You Without You"),
        Song(title: "Woman"),
        Song(title: "Words of Love"),
        Song(title: "Yellow Submarine"),
        Song(title: "Yer Blues"),
        Song(title: "Yes It Is"),
        Song(title: "Yesterday"),
        Song(title: "You Can't Do That"),
        Song(title: "You Know My Name (Look Up the Number)"),
        Song(title: "You Know What to Do"),
        Song(title: "You Like Me Too Much"),
        Song(title: "You Never Give Me Your Money"),
        Song(title: "You Won't See Me"),
        Song(title: "You'll Be Mine"),
        Song(title: "You're Going to Lose That Girl"),
        Song(title: "You've Got to Hide Your Love Away"),
        Song(title: "You've Really Got a Hold on Me"),
        Song(title: "Young Blood"),
        Song(title: "Your Mother Should Know")
    ]
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Songs"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentFor(searchText: String) {
        filteredSongs = SearchService.search(forString: searchText, inSearchable: songs)
        tableView.reloadData()
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering() ? filteredSongs.count : songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let song: Song
        let filteredSong: SearchResult
        if isFiltering() {
            filteredSong = filteredSongs[indexPath.row]
            cell.textLabel?.text = filteredSong.song?.title
            cell.detailTextLabel?.text = {
                if filteredSong.weight > 0 {
                    return String(filteredSong.weight)
                }
                return ""
            }()
        } else {
            song = songs[indexPath.row]
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = ""
        }
        return cell
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        filterContentFor(searchText: searchText)
    }
}
