import Foundation

// Variables to store the current state of the thermostat
var currentTemperature: Float = 72.0 // Default temperature in Fahrenheit
var thermostatOn: Bool = false // Thermostat is initially off

// Function to display the current status
func displayStatus() {
    if thermostatOn {
        print("Thermostat is ON. Current Temperature: \(Int(currentTemperature))°F")
    } else {
        print("Thermostat is OFF.")
    }
}

// Function to turn the thermostat ON
func turnOnThermostat() {
    thermostatOn = true
    print("Thermostat is now ON.")
}

// Function to turn the thermostat OFF
func turnOffThermostat() {
    thermostatOn = false
    print("Thermostat is now OFF.")
}

// Function to set a new temperature
func setTemperature(to temp: Float) {
    if thermostatOn {
        currentTemperature = temp
        print("Temperature set to \(Int(currentTemperature))°F.")
    } else {
        print("Please turn on the thermostat first.")
    }
}

// Function to simulate simple Alexa commands
func handleAlexaCommand(_ command: String) {
    if command.lowercased().contains("turn on") {
        turnOnThermostat()
    } else if command.lowercased().contains("turn off") {
        turnOffThermostat()
    } else if command.lowercased().contains("set temperature to") {
        let components = command.split(separator: " ")
        if let tempStr = components.last, let temp = Float(tempStr) {
            setTemperature(to: temp)
        } else {
            print("Invalid temperature.")
        }
    } else {
        print("Unknown Alexa command.")
    }
}

// Main loop to simulate the thermostat controller
var isRunning = true
while isRunning {
    print("\nSmart Thermostat Controller (Fahrenheit)")
    print("1. Use Alexa command")
    print("2. Turn ON thermostat")
    print("3. Turn OFF thermostat")
    print("4. Set Temperature manually")
    print("5. Display Status")
    print("6. Exit")
    print("Choose an option (1-6): ", terminator: "")

    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print("Enter Alexa command (e.g., 'Alexa, set temperature to 75'): ", terminator: "")
            if let alexaCommand = readLine() {
                handleAlexaCommand(alexaCommand)
            }
        case 2:
            turnOnThermostat()
        case 3:
            turnOffThermostat()
        case 4:
            print("Enter the temperature (60°F to 86°F): ", terminator: "")
            if let tempStr = readLine(), let temp = Float(tempStr), temp >= 60 && temp <= 86 {
                setTemperature(to: temp)
            } else {
                print("Please enter a valid temperature between 60°F and 86°F.")
            }
        case 5:
            displayStatus()
        case 6:
            print("Goodbye!")
            isRunning = false
        default:
            print("Invalid option. Please choose between 1 and 6.")
        }
    }
}
