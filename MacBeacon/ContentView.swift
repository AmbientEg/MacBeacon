//
//  ContentView.swift
//  MacBeacon
//
//  Created by Rodyna Amr on 15/09/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var beaconManager: BeaconManager

    var body: some View {
        VStack {
            Image(systemName: "antenna.radiowaves.left.and.right")
                .font(.system(size: 50))
                .foregroundStyle(.blue)
                .padding(.bottom, 10)

            Text("Beacon Advertising…")
                .font(.headline)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
