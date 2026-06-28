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

The CubeSat continuously monitors ambient light and onboard temperature.

Based on sensor readings, the onboard controller automatically determines the spacecraft operating condition:

* Normal Operation
* Solar Charging Mode
* Eclipse Mode
* Thermal Protection Mode
* Fault Condition

Visual indications are provided through LEDs while critical warnings activate an onboard buzzer. The LCD continuously displays system telemetry.

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
