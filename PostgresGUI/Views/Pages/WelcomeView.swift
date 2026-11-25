//
//  WelcomeView.swift
//  PostgresGUI
//
//  Created by ghazi on 11/28/25.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        VStack(spacing: Constants.Spacing.large) {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)

            Text("Hello, and welcome!")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("welcomeText")
            
            Button(action: showConnectionForm) {
                HStack {
                    Text("Connect to Server...")
                    Spacer()
                    Image(systemName: "server.rack")
                }
                .frame(minWidth: 160, maxWidth: 200)
                .padding(.vertical, 6)
            }
            .buttonStyle(.glass)
            .tint(.primary)
            .controlSize(.large)
            .accessibilityIdentifier("connectToServerButton")

            Spacer().frame(height: 8)

            VStack(spacing: 12) {
                Button(action: {
                    if let url = URL(string: "https://neotechsolutions.mx/") {
                        NSWorkspace.shared.open(url)
                    }
                }) {
                    Image("NeoLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 34)
                }
                .buttonStyle(.plain)
                .help("Neotech Solutions - https://neotechsolutions.mx/")

                Button(action: {
                    if let url = URL(string: "https://github.com/JernelOlart") {
                        NSWorkspace.shared.open(url)
                    }
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "link")
                            .font(.system(size: 11, weight: .semibold))
                        Text("Git: JernelOlart")
                            .font(.system(size: 12, weight: .medium))
                    }
                    .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
                .help("GitHub: JernelOlart")
            }
        }
        .frame(minWidth: 500, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
        .padding(.horizontal)
        .padding(.vertical)
        .padding(.bottom, 24)
    }
    
    private func showConnectionForm() {
        appState.showConnectionForm()
    }
}
