# Smart Parking System with Ultrasonic Sensors

## Team Members
- **Jan Koníček**
- **Marek Klvaňa**
- **Martin Koplík**
- **Vojtěch Larva**

## Theoretical Description and Explanation
A **Smart Parking System** is designed to identify the presence or absence of an object in a designated space, simulating a parking slot. It uses an **ultrasonic sensor** to measure the distance between the sensor and the object. The sensor sends out an ultrasonic wave, which bounces back when it hits an object. By measuring the time it takes for the wave to return, the sensor can calculate the distance to the object.

The **Nexys A7 50T FPGA board** is used to process the signal from the sensor and determine whether a space is occupied. If the measured distance is less than a certain threshold, the system determines that an object is present. This information can then be displayed on a 7-segment display, which is controlled by the `display.vhd` component.

The **Arduino Uno** board is used to supply the 5V power needed by the HC-SR04 ultrasonic sensors, as the Nexys A7 50T FPGA board typically operates at a lower voltage level (around 3.3V).

## Hardware Description of Demo Application

This project is implemented using the following hardware components:

1. **Nexys A7 50T FPGA Board**: This is a complete, ready-to-use digital circuit development platform based on the latest Artix-7™ Field Programmable Gate Array (FPGA) from Xilinx. This board typically operates at a voltage level of around 3.3V.
![image](https://github.com/janKonicek/parking-git/assets/93183489/cbf24484-7c8d-4d5f-881c-a81818e93501)

2. **HC-SR04 Ultrasonic Sensor**: This is a commonly used sensor for distance measurement. It provides 2cm - 400cm non-contact measurement functionality with an accuracy of up to 3mm. The sensor includes an ultrasonic transmitter, a receiver, and a control circuit.

![image](https://github.com/janKonicek/parking-git/assets/93183489/2e5aff0d-3f97-40c2-8d31-db44c93f5ace)
![image](https://github.com/janKonicek/parking-git/assets/93183489/474df8db-e183-4e10-91af-cf07379e7d18)

The **Nexys A7 board** is used to implement the VHDL code for the Smart Parking System, and the HC-SR04 sensor is used to measure the distance to the nearest object, which is used to determine whether a parking space is occupied.
![IMG_20240412_102940~2](https://github.com/janKonicek/parking-git/assets/93183489/9468692e-0fee-4770-8775-8740f2afcc37)

3. **Arduino Uno**: This is a microcontroller board based on the ATmega328P. It has 14 digital input/output pins, 6 analog inputs, a 16 MHz quartz crystal, a USB connection, and a power jack. It contains everything needed to support the microcontroller and can be easily connected to a computer with a USB cable or powered by an AC-to-DC adapter or battery to get started. In this project, the Arduino Uno is used to supply the 5V power needed by the HC-SR04 ultrasonic sensors.
![image](https://github.com/janKonicek/parking-git/assets/93183489/d88f189f-c7eb-49b9-8463-163a6273231d)


## Software Description
The software for this project is written in VHDL and consists of several components. Here is a brief description of the main components:

- `bin2seg.vhd`: This component decodes binary input into a 7-segment display output for a Common Anode configuration.
- `clock_enable.vhd`: This component is a clock divider that generates a pulse every `PERIOD` clock cycle.
- `display.vhd`: This component displays the measured distance on a 7-segment display.
- `distance.vhd`: This component measures the distance using an ultrasonic sensor.
- `led.vhd`: This component is responsible for ...
- `sensor.vhd`: This component is responsible for ...
- `simple_counter.vhd`: This component is responsible for ...
- `top_level.vhd`: This is the top-level component that integrates all the other components.

## Component(s) Simulation
Write descriptive text and put simulation screenshots of your components. The testbenches for the components are:
- `tb_display.vhd`
- `tb_distance.vhd`
- `tb_led.vhd`
- `tb_sensor.vhd`

## Instructions
Write an instruction manual for your application, including photos and a link to a short app video.

## References
