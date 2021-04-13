//
//  Music.swift
//  210305_Kate_Classes_Begin
//
//  Created by Siarhei Siliukou on 29.03.21.
//

import Foundation
import AudioToolbox

class MusicPlayerManager {
    let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    static let sharedInstance = MusicPlayerManager()
    private init() {}
    
    var musicPlayer : MusicPlayer? = nil
    var sequence : MusicSequence? = nil
    var track : MusicTrack? = nil
    var time = MusicTimeStamp(1.0)
    var player: OSStatus? = nil
    var musicTrack: OSStatus? = nil
    
    func playNotes(notes linkedList: LinkedList<Int>) {
        _ = NewMusicSequence(&self.sequence)
        self.player = NewMusicPlayer(&self.musicPlayer)
        self.player = MusicPlayerSetSequence(self.musicPlayer!, self.sequence)
        self.player = MusicPlayerStart(self.musicPlayer!)
        self.musicTrack = MusicSequenceNewTrack(self.sequence!, &self.track)
        
        var currentNode: Node? = linkedList.head
        
        repeat {
            if let value = currentNode?.value {
                var midiNote = MIDINoteMessage(channel: 0,
                                               note: UInt8(value),
                                               velocity: 64,
                                               releaseVelocity: 0,
                                               duration: 1.0)
                
                guard let track = self.track else { fatalError() }
                self.musicTrack = MusicTrackNewMIDINoteEvent(track, self.time, &midiNote)
                self.time += 1
            }
            
            currentNode = currentNode?.next
        } while currentNode != nil
        
        self.player = MusicPlayerSetSequence(self.musicPlayer!, self.sequence)
        self.player = MusicPlayerStart(self.musicPlayer!)

    }
    
}
