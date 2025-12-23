# 8x8 Array Multiplier
### Author: Evan Gilbert
### GitHub: e-tachyon

## Description
This repo contains the designs of the 8x8 multiplier. There is an HDL design in Verilog, a schematic design in Cadence, and a full layout design in Cadence.

![8x8 Layout](layouts/array_multiplier_layout.png)
## HDL
The Verilog code contains lays out the architecture of the multiplier.
## Schematic
### AND2
My AND2 design is made from a basic NAND2 with an inverter.

![AND2](schematics/and2.png)
### Half Adder
My half adder consists of a AOI22 functioning as a XOR for the sum with a NOR2 for the carry. There is also 2 inverters for the inputs which help create the logic for my XOR and NOR gates.

![Half Adder](schematics/half_adder.png)
### Full Adder
The adder is based on the Zimmermann97 design for a mirror adder. I chose to use this design since it cut down on the transistor count over a traditional design which lowers my overall area.

![Full Adder](schematics/full_adder.png)
### 8x8 Multiplier
Array based multplier design.

![8x8](schematics/array_mult.png)
## Layout
### AND2
![AND2](layouts/and2_layout.png)
### Half Adder
![Half Adder](layouts/half_adder_layout.png)
### Full Adder
![Full Adder](layouts/full_adder_layout.png)
### 8x8 Multiplier
![8x8 Layout](layouts/array_multiplier_layout.png)
## Simulations
### AND2
![AND2](simulations/and2_sim.png)
### Half Adder
![Half Adder](simulations/half_adder_sim.png)
### Full Adder
![Full Adder](simulations/full_adder_sim.png)
## LVS
Design Passed LVS.

![LVS](simulations/LVS.png)


