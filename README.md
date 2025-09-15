
# MacBeacon

A simple macOS SwiftUI app that turns your Mac into an **iBeacon transmitter** using CoreBluetooth and CoreLocation.
This is useful for **testing iBeacon apps** without needing physical beacon hardware.

---

## 🚀 Features

* Broadcasts a custom **UUID, Major, Minor** as iBeacon.
* Appears in **nRF Connect** and other BLE scanner apps.
* Lets you change beacon identifiers easily.
* Adds a **custom local name** (`RodynaBeacon`) so it’s easier to identify.

---

## 📦 Requirements

* macOS 12+ (tested on Apple Silicon MacBook Air).
* Xcode 14+.
* Bluetooth hardware (built-in on MacBook).

---

## ⚙️ Installation & Run

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/MacBeacon.git
   cd MacBeacon
   ```

2. Open `MacBeacon.xcodeproj` in **Xcode**.

3. In **Info.plist**, add:

   ```xml
   <key>NSBluetoothAlwaysUsageDescription</key>
   <string>This app uses Bluetooth to broadcast as an iBeacon.</string>
   ```

4. Build & run on your Mac.

---

## 🧩 Code Overview

### `MacBeaconApp.swift`

* Entry point of the app.
* Instantiates `BeaconManager`.

### `BeaconManager.swift`

* Uses `CBPeripheralManager` to broadcast BLE.
* Defines iBeacon region:

  ```swift
  let uuid = UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
  let major: CLBeaconMajorValue = 1
  let minor: CLBeaconMinorValue = 1
  ```
* Converts it into advertisement data.
* Adds `CBAdvertisementDataLocalNameKey = "RodynaBeacon"` for easy identification.

---

## 🔍 Testing with nRF Connect

1. Install [nRF Connect](https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-mobile) on iOS or Android.
2. Run the app on your Mac.
3. In nRF Connect, scan for devices:

   * **Device Name** → `RodynaBeacon`
   * **Manufacturer Data** → Contains iBeacon UUID, Major, Minor, TxPower

---

## 📖 References

* [CoreBluetooth](https://developer.apple.com/documentation/corebluetooth)
* [CoreLocation iBeacon](https://developer.apple.com/ibeacon/)
* [nRF Connect](https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-mobile)

---

✨ Now your Mac behaves like an iBeacon — great for quick prototyping without buying hardware.

