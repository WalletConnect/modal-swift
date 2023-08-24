import SwiftUI
import Web3Modal
import WCModal

struct ContentView: View {
    var body: some View {
        VStack {
            Web3ModalHelloWorld()
            
            Button("WalletConnectModal") {
 
                let metadata = AppMetadata(
                    name: "Demo Dapp",
                    description: "WalletConnectModal DApp sample",
                    url: "wallet.connect",
                    icons: ["https://avatars.githubusercontent.com/u/37784886"]
                )
                
                Networking.configure(
                    projectId: "9bfe94c9cbf74aaa0597094ef561f703",
                    socketFactory: WebSocketClientFactory()
                )
                
                WalletConnectModal.configure(
                    projectId: "9bfe94c9cbf74aaa0597094ef561f703",
                    metadata: metadata
                )
                
                WalletConnectModal.present()
            }
        }
    }
}

#Preview {
    ContentView()
}
