# 8x8 Array Multiplier
### Author: Evan Gilbert
### GitHub: e-tachyon

## Description
This repo contains the designs of the 8x8 multiplier. There is an HDL design in Verilog, a schematic design in Cadence, and a full layout design in Cadence. The designs in Cadence were built on a tsmc35 library as this was what I had access to at the University.

Transistor Count: 1854

Process: tsmc35

Core Logic: Zimmermann97 Mirror Adder

Target Operating Voltage: 3.3V

Area: 98,580um^2

| Logic  | Transistors | Total Blocks | Size (um^2) |
| ------------- | ------------- | ------------- | ------------- |
| AND2  | 6 | 64 | 106 |
| Half Adder | 16 | 8 | 416 |
| Full Adder | 28 | 48 | 584.48 |


![8x8 Layout](layouts/array_multiplier_layout.png)
## HDL
The Verilog code contains lays out the architecture of the multiplier. It verifies the logic and connections of my design to ensure it outputs correct bt values after multiplication.
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
This design does not have the same cell height as the other 2 designs, but this is due to it not connecting to either adder. The AND2 gates are in seperate strips so I can make them smaller so they take up less area.

Length: 10.6um
Height 10um
Area: 106um^2
VDD & GND: 2um Width
Interconnect: 0.6um Width

![AND2](layouts/and2_layout.png)
### Half Adder
This design was meant to match the height of my full adder as they would be connected in the strip so the rails needed to connect.

Length:20um
Height 20.8um
Area: 416um^2
VDD & GND: 2um Width
Interconnect: 0.8um Width

![Half Adder](layouts/half_adder_layout.png)
### Full Adder
Design based on Zimmermann97 Full Adder in CMOS VLSI Design 4th Edition (Neil H. E. Weste, David Money Harris).

Length: 28.1um
Height 20.8um
Area: 584.48um^2
VDD & GND: 2um Width
Interconnect: 0.8um Width

![Full Adder](layouts/full_adder_layout.png)
### 8x8 Multiplier
My layout condenses the array multiplier into a rectangualar shape. Inputs are on the left and top while outputs are on the right and bottom. I have AND2 strips on top which then flow into adder strips.

![8x8 Layout](layouts/array_multiplier_layout.png)
## Simulations
### AND2
Rise Time: 10.16ns
Fall Time: 6.979ns
Threshold (3.3 VDD): 1.42V


![AND2](simulations/and2_sim.png)
### Half Adder
Sum Rise Time: 9.621ns
Sum Fall Time: 7.002ns
Carry Rise Time: 9.486ns
Carry Fall Time: 6.994ns
Threshold (3.3 VDD):
1.63V for Sum 
1.44V for Carry

![Half Adder](simulations/half_adder_sim.png)
### Full Adder
s_out Rise Time: 10.27ns
s_out Fall Time: 7.035ns
c_out Rise Time: 10.15ns
c_out Fall Time: 7.0001ns
Threshold Sum: 1.25V
Threshold Carry: 1.68V

![Full Adder](simulations/full_adder_sim.png)
## LVS
Design Passed LVS.

![LVS](simulations/LVS.png)


