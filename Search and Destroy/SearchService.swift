//
//  SearchService.swift
//  Search and Destroy
//
//  Created by Alex Elkins on 10/3/18.
//  Copyright © 2018 Alex Elkins. All rights reserved.
//

import Foundation

class SearchService {
    static func search(forString: String, inSearchable: [Song], completion: ([SearchResult]) -> ()) {
        guard forString.count > 0, inSearchable.count > 0 else {
            completion([SearchResult]())
            return
        }
        var results = [SearchResult]()
        inSearchable.forEach { (searchable) in
            let searchResult = SearchResult()
            searchResult.song = searchable
            if let searchableSong = searchResult.song {
                for searchingForStringWord in forString.split(separator: " ") {
                    searchResult.weight += process(rule: .startsWith, needle: String(searchingForStringWord), haystack: searchableSong.title).rawValue
                    searchResult.weight += process(rule: .isExactly, needle: String(searchingForStringWord), haystack: searchableSong.title).rawValue
                    for searchableSongTitleWord in searchableSong.title.split(separator: " ") {
                        searchResult.weight += process(rule: .contains, needle: String(searchingForStringWord), haystack: String(searchableSongTitleWord)).rawValue
                        searchResult.weight += process(rule: .isExactly, needle: String(searchingForStringWord), haystack: String(searchableSongTitleWord)).rawValue
                        searchResult.weight += process(rule: .startsWith, needle: String(searchingForStringWord), haystack: String(searchableSongTitleWord)).rawValue
                    }
                }
            }
            results.append(searchResult)
        }
        results.sort { (a, b) -> Bool in
            return a.weight > b.weight
        }
        completion(results)
    }

    private static func process(rule: SearchRule, needle: String, haystack: String) -> SearchRuleWeight {
        let needleString = needle.lowercased()
        let needleStringCleaned = needleString.replacingOccurrences(of: "[^0-9a-zA-Z]", with: "", options: .regularExpression)
        let haystackString = haystack.lowercased()
        let haystackStringCleaned = haystackString.replacingOccurrences(of: "[^0-9a-zA-Z]", with: "", options: .regularExpression)
        switch rule {
        case .contains:
            if haystackString.contains(needleString) || haystackStringCleaned.contains(needleString) || haystackString.contains(needleStringCleaned) || haystackStringCleaned.contains(needleStringCleaned) {
//                print("Rule matched. Adding \(SearchRuleWeight.contains.rawValue) weight.")
                return .contains
            }
        case .startsWith:
            if haystackString.starts(with: needleString) || haystackStringCleaned.starts(with: needleString) || haystackString.starts(with: needleStringCleaned) || haystackStringCleaned.starts(with: needleStringCleaned) {
//                print("Rule matched. Adding \(SearchRuleWeight.startsWith.rawValue) weight.")
                return .startsWith
            }
            break;
        case .isExactly:
            if haystackString == needleString || haystackStringCleaned == needleString || haystackString == needleStringCleaned || haystackStringCleaned == needleStringCleaned {
//                print("Rule matched. Adding \(SearchRuleWeight.isExactly.rawValue) weight.")
                return .isExactly
            }
            break;
        default:
            return .none;
        }
        return .none;
    }

    enum SearchRule {
        case contains
        case startsWith
        case isExactly
        case none
    }

    enum SearchRuleWeight: Int {
        case contains = 1
        case startsWith = 2
        case isExactly = 3
        case none = 0
    }
}
