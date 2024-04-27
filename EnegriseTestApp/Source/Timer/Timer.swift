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
    
    var lapDelta: CMTime?
    
    private var startTime: CMTime?
    
    private let clock: CMClock = CMClockGetHostTimeClock()
    
    // MARK: -
    // MARK: Public Functions
    
    func start() {
        self.startTime = CMClockGetTime(self.clock)
    }
    
    func fixLap() -> (Int, Int, Int)? {
        guard let startTime else { return nil }
        let current: CMTime = CMClockGetTime(self.clock)
        
        defer {
            self.startTime = nil
            self.lapDelta = nil
        }
        
        self.lapDelta = CMTimeSubtract(current, startTime)
        
        if let lapDelta {
            let seconds = CMTimeGetSeconds(lapDelta)
            return self.formatted(seconds: seconds)
        } else {
            return nil
        }
    }
    
    func formattedTime() -> (Int, Int, Int)? {
        guard let startTime else { return nil }
        let current: CMTime = CMClockGetTime(self.clock)
        let difference: CMTime = CMTimeSubtract(current, startTime)
        
        let seconds = CMTimeGetSeconds(difference)
        
        return self.formatted(seconds: seconds)
    }
    
    // MARK: -
    // MARK: Private Functions
    
    private func formatted(seconds: Float64) -> (Int, Int, Int) {
        let min = Int(seconds) / 60
        let sec = Int(seconds) % 60
        let msec = Int((seconds - seconds.rounded(.down)) * 100)
        
        return (min, sec, msec)
    }
}
