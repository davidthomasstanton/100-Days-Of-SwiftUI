//
//  Game.swift
//  Flashlight
//
//  Created by David Stanton on 2/17/24.
//

import Foundation

@MainActor @Observable
class Game {
    enum GameState {
        case menu, playing, gameOver
    }
    
    let rowCount = 8
    let colCount = 14
    var rows: [[LightState]]
    var state = GameState.menu
    
    var timeOut = 3.0
    var gameOverTask: Task<Void, Error>?
    
    var hideLight = 0.75
    var hideLightTask: Task<Void, Error>?
    var score = 0
    
    var misdirectionCount = 0
    
    let correct = Bundle.main.audioPlayer(for: "correct.wav", volume: 0.25)
    let wrong = Bundle.main.audioPlayer(for: "wrong.wav", volume: 0.25)
    
    init() {
        let row = Array(repeating: LightState.off, count: colCount)
        rows = Array(repeating: row, count: rowCount)
    }
    
    func clearBoard() {
        for row in 0..<rowCount {
            for col in 0..<colCount {
                rows[row][col] = .off
            }
        }
    }
    
    func advance() {
        clearBoard()
        
        for _ in 0..<misdirectionCount {
            let newRow = Int.random(in: 0..<rowCount)
            let newCol = Int.random(in: 0..<colCount)
            rows[newRow][newCol] = .misdirection
        }
        let correctRow = Int.random(in: 0..<rowCount)
        let correctCol = Int.random(in: 0..<colCount)
        rows[correctRow][correctCol] = .on
        
        timeOut *= 0.99
        hideLight *= 0.98
        misdirectionCount += 1
        
        gameOverTask?.cancel()
        
        gameOverTask = Task {
            try await Task.sleep(for: .seconds(timeOut))
            state = .gameOver
        }
        
        hideLightTask?.cancel()
        
        hideLightTask = Task {
            try await Task.sleep(for: .seconds(hideLight))
            rows[correctRow][correctCol] = .hidden
        }
    }
    
    func press(_ row: Int, _ col: Int) {
        if rows[row][col] == .on || rows[row][col] == .hidden {
            score += 1
            advance()
            
            correct.play()
        } else {
            wrong.play()
        }
    }
    
    func restart() {
        clearBoard()
        
        score = 0
        timeOut = 3
        misdirectionCount = 0
        state = .playing

        
        Task {
            try await Task.sleep(for: .seconds(1))
            advance()
        }
    }
}
