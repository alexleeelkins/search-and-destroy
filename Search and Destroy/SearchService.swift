//
//  SearchService.swift
//  Search and Destroy
//
//  Created by Alex Elkins on 10/3/18.
//  Copyright © 2018 Alex Elkins. All rights reserved.
//

import Foundation

class SearchService {
    static func search(forString: String, inSearchable: [Song]) -> [SearchResult] {
        guard forString.count > 0, inSearchable.count > 0 else {
            return [SearchResult]()
        }
        var results = [SearchResult]()
        inSearchable.forEach { (searchable) in
            let searchResult = SearchResult()
            searchResult.song = searchable
            if let searchableSong = searchResult.song {
                let searchableSongTitle = searchableSong.title.replacingOccurrences(of: "[^0-9a-zA-Z ]", with: "", options: .regularExpression).lowercased()
                for searchingForStringWord in forString.split(separator: " ") {
                    if searchableSongTitle.starts(with: searchingForStringWord.lowercased()) {
                        print("Searchable song title \"\(searchableSongTitle)\" starts with searching for string word \"\(searchingForStringWord.lowercased())\", +5")
                        searchResult.weight += 5
                    }
                    if searchableSongTitle == searchingForStringWord {
                        print("Searchable song title \"\(searchableSongTitle)\" is exactly searching for string word \"\(searchingForStringWord.lowercased())\", +5")
                        searchResult.weight += 5
                    }
                    for searchableSongTitleWord in searchableSongTitle.split(separator: " ") {
                        print(searchableSongTitleWord)
                        let searchingForStringWord = searchingForStringWord.replacingOccurrences(of: "[^0-9a-zA-Z ]", with: "", options: .regularExpression).lowercased()
                        if searchableSongTitleWord.contains(searchingForStringWord.lowercased()) {
                            print("Cleaned searchable song title word \"\(searchableSongTitleWord)\" contains searching for string word \"\(searchingForStringWord.lowercased())\", +1")
                            searchResult.weight += 1
                        }
                        if searchableSongTitleWord == searchingForStringWord.lowercased() {
                            print("Cleaned searchable song title word \"\(searchableSongTitleWord)\" is exactly searching for string word \"\(searchingForStringWord).lowercased()\", +1")
                            searchResult.weight += 1
                        }
                        if searchableSongTitleWord.starts(with: searchingForStringWord.lowercased()) {
                            if (searchingForStringWord.count > 1) {
                                print("Cleaned searchable song title word \"\(searchableSongTitleWord)\" starts with searching for string word \"\(searchingForStringWord.lowercased())\", +1")
                                searchResult.weight += 1
                            }
                        }
                        print(searchableSongTitleWord)
                    }
                }
            }
            results.append(searchResult)
        }
        results.sort { (a, b) -> Bool in
            if a.weight != b.weight {
                return a.weight > b.weight
            }
            return (a.song?.title ?? "") < (b.song?.title ?? "")
        }
        return results
    }
}
