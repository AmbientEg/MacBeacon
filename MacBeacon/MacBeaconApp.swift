import SwiftUI
import CoreBluetooth
import CoreLocation

@main
struct MacBeaconApp: App {
    @StateObject private var beaconManager = BeaconManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(beaconManager)
        }
    }
}

class BeaconManager: NSObject, ObservableObject, CBPeripheralManagerDelegate {
    private var peripheralManager: CBPeripheralManager?

    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            startBeacon()
        } else {
            print("⚠️ Bluetooth not available: \(peripheral.state.rawValue)")
        }
    }

    private func startBeacon() {
        let uuid = UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
        let major: CLBeaconMajorValue = 1
        let minor: CLBeaconMinorValue = 1
        let identifier = "com.rodyna.MacBeacon"

        // Create a CLBeaconRegion
        let region = CLBeaconRegion(uuid: uuid, major: major, minor: minor, identifier: identifier)

        // Convert to peripheral data
        let peripheralData = region.peripheralData(withMeasuredPower: nil) as NSDictionary

        // Add a custom local name so it shows in nRF Connect
        var advertisement = peripheralData as! [String: Any]
        advertisement[CBAdvertisementDataLocalNameKey] = "RodynaBeacon"

        peripheralManager?.startAdvertising(advertisement)

        print("✅ Beacon started: \(uuid) major: \(major) minor: \(minor)")
    }
}
