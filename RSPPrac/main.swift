import Foundation

// 가위바위보 열거형
enum RockScissorsPaper: String {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    
    static func randomChoice() -> RockScissorsPaper {
           let randomValue = Int.random(in: 1...3)
           return RockScissorsPaper(rawValue: "\(randomValue)")!
       }
    
    func stringValue() -> String {
            switch self {
            case .scissors:
                return "가위"
            case .rock:
                return "바위"
            case .paper:
                return "보"
            default:
                return ""
            }
        }
}

enum MukJjiBBa: String {
    case exit = "0"
    case muk = "1"
    case jji = "2"
    case bba = "3"
    
    static func randomChoice() -> MukJjiBBa {
           let randomValue = Int.random(in: 1...3)
           return MukJjiBBa(rawValue: "\(randomValue)")!
       }
    
    func stringValue() -> String {
            switch self {
            case .muk:
                return "묵"
            case .jji:
                return "찌"
            case .bba:
                return "빠"
            default:
                return ""
            }
        }
}


// 묵찌빠 게임 클래스
class Game {
    private var turn: Bool = true // 사용자 턴
    
    var userLose = 0
    var computerLose = 0
    
    func endGame() {
        print("<게임종료>")
        exit(0)
    }
    
    // 가위바위보 게임을 플레이하는 메서드
    func playRockScissorsPaperGame() {
        while true {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            if let input = readLine(),
               let userChoice = RockScissorsPaper(rawValue: input) {
                if userChoice == .exit {
                    endGame()
                } else {
                    handleRockScissorsPaperGame(userChoice)
                }
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
    
    // 가위바위보 게임 결과를 처리하는 메서드
    private func handleRockScissorsPaperGame(_ userChoice: RockScissorsPaper) {
        let comChoice = RockScissorsPaper.randomChoice()
        
        print("사용자 선택: \(userChoice.stringValue())")
        print("컴퓨터 선택: \(comChoice.stringValue())")
        
        if comChoice == userChoice {
            print("비겼습니다!")
        } else if (comChoice == .scissors && userChoice == .rock) ||
                    (comChoice == .rock && userChoice == .paper) ||
                    (comChoice == .paper && userChoice == .scissors) {
            print("이겼습니다!")
            print("\(turn ? "사용자" : "컴퓨터")의 턴입니다.")
            playMukJjiBBaGame()
        } else {
            print("졌습니다!")
            turn.toggle()
            print("\(turn ? "사용자" : "컴퓨터")의 턴입니다.")
            playMukJjiBBaGame() // 수정필요 컴퓨터턴일때!
        }
    }
    
    // 묵찌빠 게임을 플레이하는 메서드
    private func playMukJjiBBaGame() {
        if userLose > 0 && computerLose > 0, userLose == computerLose {
            // turn.toggle()
            print("🎉 \(turn ? "사용자" : "컴퓨터")의 승리!")
            endGame()
        } else {
            print("[\(turn ? "사용자" : "컴퓨터") 턴] 묵(1) 찌(2) 빠(3)! <종료: 0> : ", terminator: "")
            if let input = readLine(),
               let userChoice = MukJjiBBa(rawValue: input) {
                if userChoice == .exit {
                    endGame()
                } else {
                    handleMukJjiBBaGame(userChoice)
                }
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                print("(잘못입력했기때문에 턴 넘어감)")
                turn.toggle()
                playMukJjiBBaGame()
            }
        }
        
    }
    
    // 묵찌빠 게임 결과를 처리하는 메서드
    private func handleMukJjiBBaGame(_ userChoice: MukJjiBBa) {
        let comChoice = MukJjiBBa.randomChoice()
        
        print("사용자 선택: \(userChoice.stringValue())")
        print("컴퓨터 선택: \(comChoice.stringValue())")
        
        if comChoice == userChoice {
            // 이겼을경우
            print("✅\(turn ? "사용자" : "컴퓨터")이(가) 이겼습니다")
            turn.toggle()
            print("\(turn ? "사용자" : "컴퓨터")의 턴입니다.")
            playMukJjiBBaGame()
        } else {
            // 졌을경우
            loseCountUp()
            turn.toggle()
            print("\(turn ? "사용자" : "컴퓨터")의 턴입니다.")
            playMukJjiBBaGame()
        }
    }
    
    private func loseCountUp() {
        if turn == true {
            userLose += 1
            print("🔵 사용자 패배 +1 -> 사용자의 패배횟수: \(userLose)")
        } else {
            computerLose += 1
            print("🔴 컴퓨터 패배 +1 -> 컴퓨터의 패배횟수: \(computerLose)")
        }
    }
    
}

// 묵찌빠 게임 시작
let game = Game()
game.playRockScissorsPaperGame()


