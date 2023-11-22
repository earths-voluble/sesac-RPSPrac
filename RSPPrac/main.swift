//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum Selection: String {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

var turn: Bool = true // 사용자턴

func RPSGame(_ myChoice: Selection) {
    let myChoice = Int(myChoice.rawValue)
    let comChoice = Int.random(in: 1...3)
    if myChoice == 0 {
        exit(0)
    } else if comChoice == myChoice {
        print("비겼습니다!")
    } else if (comChoice == 1 && myChoice == 2) || (comChoice == 2 && myChoice == 3) || (comChoice == 3 && myChoice == 1) {
        print("이겼습니다!")
        while true {
            print("[\(turn ? "사용자" : "컴퓨터") 턴] 묵(1) 찌(2) 빠(3)! <종료: 0> : ")
            if let input = readLine(),
               let select = Selection(rawValue: input) {
                MJBGame(select)
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    } else {
        print("졌습니다!")
        while true {
            turn.toggle()
            print("[\(turn ? "사용자" : "컴퓨터") 턴] 묵(1) 찌(2) 빠(3)! <종료: 0> : ")
            if let input = readLine(),
               let select = Selection(rawValue: input) {
                MJBGame(select)
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
}

func MJBGame(_ myChoice: Selection) {
    let myChoice = Int(myChoice.rawValue)
    let comChoice = Int.random(in: 1...3)
    if myChoice == 0 {
        exit(0)
    } else if myChoice == comChoice {
        print("사용자의 승리!")
        exit(0)
    } else {
        turn.toggle()
        // print("졌습니다.")
        print("\(turn ? "사용자의 " : "컴퓨터의 ")턴입니다.")
    }
}


while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
    if let input = readLine(),
       let select = Selection(rawValue: input) {
        RPSGame(select)
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}
