# AegisSat: Autonomous Reconnaissance CubeSat for Energy-Aware Mission Management

## Overview

AegisSat is a multi-domain CubeSat prototype designed to demonstrate autonomous energy-aware mission management for reconnaissance based missions. The project combines embedded hardware implementation with MATLAB-based mission simulations to emulate how modern small satellites intelligently manage power, thermal conditions, payload activity, and system health across multiple operational domains.

The system was developed as a proof-of-concept using a PICUNO microcontroller platform. Since PICUNO is not available in Tinkercad, the hardware logic was validated using an Arduino Uno simulation while preserving the intended functionality.

---

## Project Objectives

* Develop an autonomous energy-aware CubeSat prototype.
* Monitor onboard temperature and environmental lighting conditions.
* Dynamically switch operating modes based on available energy.
* Display real-time telemetry and mission status.
* Generate mission-level analytical simulations in MATLAB.
* Demonstrate multi-domain satellite applications including:

  * Geological Survey
  * Renewable Energy Assessment
  * Defence Reconnaissance
  * Aerospace Missions

---

## Key Features

* Autonomous power-aware mission management
* Eclipse detection using light sensing
* Thermal monitoring
* Mission health monitoring
* Telemetry visualization
* Status indication using LEDs
* Audible fault alerts
* MATLAB-based mission simulation
* Multi-domain operational capability

---

## Hardware Components

* PICUNO Development Board
* LM35 Temperature Sensor
* LDR (Light Dependent Resistor)
* 16×2 LCD Display
* Piezo Buzzer
* Red LED
* Yellow LED
* Green LED
* 220 Ω Resistors
* 10 kΩ Resistor
* Breadboard
* Jumper Wires
* USB Power Supply

### Proposed Future Hardware

* MPU6050 IMU
* NRF24L01 Wireless Module
* OLED Display
* Mini Solar Panel
* TP4056 Charging Module
* Li-ion Battery
* Current & Voltage Sensors
* Relay Protection Module

---

## Software Stack

* MATLAB
* Tinkercad
* Arduino IDE (PICUNO Compatible)
* Embedded C/C++

---

## System Operation

Good (Normal) Condition: Battery level is sufficient, temperature is within the safe operating range, and communication is active. The solar panel charges the Li-ion battery (when sunlight is available), and all subsystems and the reconnaissance payload operate normally.
Warning Condition: Battery level decreases or temperature approaches the upper safe limit. The system enters a power-saving mode by reducing non-essential operations while transmitting a warning to the MATLAB ground station.
Critical Condition: Battery level falls below the critical threshold, temperature exceeds the safe limit, or communication fails. The payload is disabled, the relay isolates selected loads, the buzzer and LEDs indicate a fault, and a critical alert is transmitted to the ground station.
Sunlight (Charging) Condition: The mini solar panel generates electrical power to operate the CubeSat and safely charge the Li-ion battery through the TP4056 charging module.
Eclipse (Discharging) Condition: During eclipse or the absence of sunlight, the CubeSat operates using stored battery energy while optimizing power consumption to maximize mission duration.
Thermal Monitoring Condition: The LM35/DHT11 sensor continuously monitors the onboard temperature. If overheating is detected, protective actions are initiated to prevent subsystem damage.
Telemetry and Fault Monitoring Condition: Battery voltage, current, temperature, communication status, and system faults are continuously monitored and transmitted to the MATLAB ground station for real-time health assessment.
Attitude Simulation Condition: Simulated pitch, roll, and yaw represent the spacecraft's orientation, with future integration of an MPU6050 IMU for real-time attitude determination and control (ADCS).

---

## MATLAB Mission Simulation

The MATLAB environment models complete satellite mission behaviour through dynamic simulations.

Mission analytics include:

* Orbital Solar Energy Profile
* Energy–Thermal Behaviour Analysis
* Payload Activity Timeline
* Operational Behaviour Scatter Analysis
* Mission Health Index

Additional animated mission demonstrations include:

### Aerospace Mission

* Earth orbit visualization
* Satellite trajectory
* Solar charging
* Eclipse transition
* Telemetry dashboard

### Geological & Renewable Energy Survey

* Terrain mapping
* Renewable resource assessment
* Wind farm monitoring
* Solar farm observation
* Geothermal hotspot detection
* Satellite scanning visualization

### Defence Reconnaissance

* Target surveillance
* Threat monitoring
* Reconnaissance payload activation
* Intelligent decision support
* Mission status monitoring

---

## Project Architecture

```
Environmental Sensors
        │
        ▼
PICUNO Flight Computer
        │
 ┌──────┼────────────┐
 │      │            │
 ▼      ▼            ▼
LCD    LEDs       Buzzer
        │
        ▼
Mission Decision Engine
        │
        ▼
MATLAB Mission Analytics
```
---

## Applications

* CubeSat Research
* Earth Observation
* Renewable Energy Mapping
* Geological Survey
* Disaster Monitoring
* Defence Reconnaissance
* Embedded Systems Education
* Aerospace Engineering

---

## Current Limitations

* Prototype-level implementation
* Simulated satellite environment
* Simplified orbital mechanics
* Basic energy model
* Single-node architecture
* No wireless ground station communication
* Limited onboard sensing

---

## Future Enhancements

* Solar-powered autonomous operation
* NRF24L01 telemetry communication
* Edge AI for onboard decision making
* Multi-satellite constellation support
* FPGA/VLSI hardware acceleration
* Renewable energy optimization algorithms
* High-fidelity orbital dynamics
* Real-time ground station integration

---

## Contributors

* Satvika Gobi
* Pranav J

---

> *"The most capable spacecraft are not those with the greatest power, but those that use every watt with intelligence."*
