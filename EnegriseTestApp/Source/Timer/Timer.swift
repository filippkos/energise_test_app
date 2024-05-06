//
//  ClockTimer.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import AVFoundation

final class Timer {
    
    // MARK: -
    // MARK: Variables
    
    private var startTime: CMTime?
    private let clock: CMClock = CMClockGetHostTimeClock()
    
    // MARK: -
    // MARK: Public
    
    func start() {
        self.startTime = self.clock.time
    }
    
    func formattedTime() -> (Int, Int, Int)? {
        guard let startTime else { return nil }
        let current: CMTime = self.clock.time
        let difference: CMTime = current - startTime
        
        let seconds = difference.seconds
        
        return self.formatted(seconds: seconds)
    }
    
    // MARK: -
    // MARK: Private
    
    private func formatted(seconds: Float64) -> (Int, Int, Int) {
        let min = Int(seconds) / 60
        let sec = Int(seconds) % 60
        let msec = Int((seconds - seconds.rounded(.down)) * 100)
        
        return (min, sec, msec)
    }
}
