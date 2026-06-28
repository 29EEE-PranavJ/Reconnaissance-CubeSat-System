# AegisSat: Autonomous Reconnaissance CubeSat for Energy-Aware Mission Management

## Overview

AegisSat is a multi-domain CubeSat prototype designed to demonstrate autonomous energy-aware mission management for reconnaissance based missions. The project combines embedded hardware implementation with MATLAB-based mission simulations to emulate how modern small satellites intelligently manage power, thermal conditions, payload activity, and system health across multiple operational domains.

The system was developed as a proof-of-concept using a PICUNO microcontroller platform. Since PICUNO is not available in Tinkercad, the hardware logic was validated using an Arduino Uno simulation while preserving the intended functionality.

---

## Project Objectives

* To develop an autonomous CubeSat prototype capable of simulating defence reconnaissance missions by integrating power management, telemetry, thermal monitoring, communication, and fault detection into a single embedded system.
* To implement an energy-aware power management system that harvests energy from a mini solar panel, safely stores it in a Li-ion battery, and intelligently manages power distribution to ensure efficient operation during both sunlight and eclipse conditions.
* To design a reliable battery charging and protection system using a TP4056 charging module with overcharge and over-discharge protection, enabling safe solar charging, improved battery lifespan, and uninterrupted power availability for critical onboard subsystems.
* To continuously monitor critical system parameters including battery voltage, charging/discharging current, temperature, and overall system health using onboard sensors, thereby ensuring reliable spacecraft operation and timely detection of abnormal conditions.
* To establish a real-time telemetry and communication system that transmits battery status, temperature, power mode, attitude data, and fault information to a MATLAB-based ground station for continuous monitoring, visualization, and mission analysis.
* To incorporate autonomous fault detection and protection mechanisms capable of identifying conditions such as low battery, overheating, and communication failures, while automatically activating alarms and isolating affected subsystems to enhance system reliability.
* To simulate spacecraft attitude parameters including pitch, roll, and yaw to represent spacecraft orientation and provide a platform for future integration of an MPU6050-based Attitude Determination and Control System (ADCS).
* To validate the CubeSat's mission performance through MATLAB simulations by modelling orbital solar energy availability, battery charging and discharging behaviour, thermal dynamics, payload activation, and overall mission health under realistic operating conditions.
* To demonstrate the CubeSat's applicability across multiple mission domains, including Geological Survey, Renewable Energy Assessment, Defence Reconnaissance, Aerospace Missions

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

* PICUNO Microcontroller
* Mini Solar Panel
* TP4056 Li-ion Charging Module (with overcharge/over-discharge protection)
* Li-ion Battery
* Voltage Sensor
* Current Sensor
* LM35 Temperature Sensor (or DHT11 Temperature Sensor)
* NRF24L01 Wireless Transceiver Module
* MATLAB Ground Station Dashboard
* 0.96-inch OLED Display
* Status LEDs
* Buzzer
* Relay Module
* MPU6050 IMU (Gyroscope + Accelerometer)

---

## Software Stack

* MATLAB
* Tinkercad
* Arduino IDE (PICUNO Compatible)
* Embedded C/C++

---

## System Operation

* Good (Normal) Condition: Battery level is sufficient, temperature is within the safe operating range, and communication is active. The solar panel charges the Li-ion battery (when sunlight is available), and all subsystems and the reconnaissance payload operate normally.
* Warning Condition: Battery level decreases or temperature approaches the upper safe limit. The system enters a power-saving mode by reducing non-essential operations while transmitting a warning to the MATLAB ground station.
* Critical Condition: Battery level falls below the critical threshold, temperature exceeds the safe limit, or communication fails. The payload is disabled, the relay isolates selected loads, the buzzer and LEDs indicate a fault, and a critical alert is transmitted to the ground station.
* Sunlight (Charging) Condition: The mini solar panel generates electrical power to operate the CubeSat and safely charge the Li-ion battery through the TP4056 charging module.
* Eclipse (Discharging) Condition: During eclipse or the absence of sunlight, the CubeSat operates using stored battery energy while optimizing power consumption to maximize mission duration.
* Thermal Monitoring Condition: The LM35/DHT11 sensor continuously monitors the onboard temperature. If overheating is detected, protective actions are initiated to prevent subsystem damage.
* Telemetry and Fault Monitoring Condition: Battery voltage, current, temperature, communication status, and system faults are continuously monitored and transmitted to the MATLAB ground station for real-time health assessment.
* Attitude Simulation Condition: Simulated pitch, roll, and yaw represent the spacecraft's orientation, with future integration of an MPU6050 IMU for real-time attitude determination and control (ADCS).

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
OLED    LEDs       Buzzer
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
