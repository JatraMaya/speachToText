//
//  ContentView.swift
//  SpeechToText
//
//  Created by Ahmad Fadly Iksan on 11/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var isRecording: Bool = false

    var body: some View {
        VStack {
            Text("Text to speech")

            Button {
                if !isRecording{
                    speechRecognizer.transcribe()
                }else {
                    speechRecognizer.stopTranscribing()
                }

                isRecording.toggle()

            }label: {
                Image(systemName: isRecording ? "mic.circle" : "mic.slash.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
            }

            Text(speechRecognizer.transcript)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
