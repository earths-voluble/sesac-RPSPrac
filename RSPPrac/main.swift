//
//  main.swift
//  RSPPrac
//
//  Created by 이보한 on 2023/11/21.
//

import Foundation

while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    if let input = readLine(), let enumValue = Selection(rawValue: input) {
        handleSelection(enumValue)
    } else {
        print("")
    }
}

func handleSelection(_ enumValue: Selection) {
    switch enumValue {
    case .scissors:
        runningGame(myChoice: 1)
    case .rock:
        runningGame(myChoice: 2)
    case .paper:
        runningGame(myChoice: 3)
    case .exit:
        exit(0)
    }
    
}

func runningGame(myChoice: Int) {
    var comChoice = Int.random(in: 1...3)
    if comChoice == myChoice {
        print("\(comChoice):\(myChoice)")
        print("비겼습니다.")
    } else if comChoice == 1 && myChoice == 2 {
        print("\(comChoice):\(myChoice)")
        print("이겼습니다")
    } else if comChoice == 2 && myChoice == 3 {
        print("\(comChoice):\(myChoice)")
        print("이겼습니다")
    } else if comChoice == 3 && myChoice == 1 {
        print("\(comChoice):\(myChoice)")
        print("이겼습니다")
    } else { print("졌습니다") }
        
}

