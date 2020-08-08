# AES Exercise SoSe2020
These are my chapterwise and exercisewise notes and comments.  
Steps taken for each Quartus task
* create new project (DE2-115 is Cyclone IV E EP4CE115F29C7)
* import pin assignment and set unused pins to tri-state input
* implement and compile vhd file
* simulation: functional and timing
* programming FPGA and test

Steps taken for each NIOS II task
* Quartus
	* create new project (DE2-115 is Cyclone IV E EP4CE115F29C7)
	* import pin assignment and set unused pins to tri-state input
* Qsys Tool
	* specify and connect components
	* generate HDL
* Quartus
	* implement vhd file
	* add nios_system/synthesis/*.qip file to project
	* compile project
* Altera Monitor Program
	* create *.c file
	* create new project
	* Compile & Load and click run

## Chapter 1
just read through

## Chapter 2
just read through

## Chapter 3
### Exercise 1
light
* used Tim Köhler's Description in Moodle for setup plus driver installation
* followed tutorial step by step  
unused pins can be set to tri-state input via Assignments > Device > Device and Pin Options ... > Unused Pins > click arrow and select "as input tri-state"
### Exercise 2
inputoutput
* simulation was done for all pins but to verfiy the circuit only one ouptut pin has to be looked at as all vector elements are treated the same
inputANDoutput
* simulation was done for all pins but to verfiy the circuit only one ouput pin has to be looked at as all vector elements are treated the same (AND is commutative)

## Chapter 4
### Exercise 1
mux1bit
* simulation as founding for mux8bit
mux8bit
* used code from mux1bit and modified
* simulation does not take all vector combinations into account but is ok as each vector element (for the two input vectors) is treated the same
### Exercise 2
mux3bit
* realised with construct WITH...SELECT...WHEN...  
therefore intermediate signals were not needed
### Exercise 3
switchestosegmentdisplay
* extra file "segmentdisplay.vhd" to be able to reuse later  
looked up how to access seven segment display in DE2-115 user manual (chapter 4.4)  
take care with segment display: 0 in vector means on, 1 means off
### Exercise 4
carryrippleadder
* extra file "fulladder.vhd" to be able to use fulladder components for carryrippleadder  
formulas for fulladder: s = a XOR b XOR ci, co = (ci AND (a XOR b)) OR (a AND b)
* helper signal c in "carryrippleadder.vhd" to safe carries while adding
* simulation not for all combinations but when one fulladder works all fulladders are working correctly

## Chapter 5
### Exercise 1
part1
* followed tutorial step by step  
Viewers are found under Tools > Netlist Viewers

part2_1
* followed tutorial step by step

part2_2
* followed tutorial step by step  
copied "part2.vhd" from part2_1 into "d_latch.vhd" (take care: dlatch entity does already exist)  
simulation of dlatch already done in part2_1

part3
* followed tutorial step by step  
copied "d_latch.vhd" from part2_2

## Chapter 6
### Exercise 1
counter
* "htb.vhd" equals "segmentdisplay.vhd" from chapter4 exercise3 (take care: output vector is the wrong way round here)
* 50MHz -> 50 000 000 times per second  
logs2(50 000 000) = 25.5754... -> 25 positions are enough to represent 50 000 000 binary 
50 000 000 decimal is 10111110101111000010000000 binary  
as it says approximately one second we can just let the counter overflow
* on rising clock edge add one to counter  
before counter overlows manipulate number
* no simulation for this exercise, tried directly on board
### Exercise 2
counter
* copied "*.vhd" files from exercise1  
added two more numbers and two more seven segment displays and therefore two more htb components  
adapted implementation of number manipulation
* no simulation for this exercise, tried directly on board

## Chapter 7
### Exercise 1
applied crc approach whith shift register to given example by hand to get familiar with algorithm  
crc
* counter tracks number of shifts and has to count from 0 to (32-7) -> 5 positions are enough to represent 25 binary  -> "11001"
* no simulation for this exercise, tried directly on board in chapter 8

## Chapter 8
crc_wrapper
* copied "crc.vhd" file from chapter 7
* output  
positive check -> no LED is on  
check sum -> bits to be append to message (LEDR7 downto LEDR0)
* input  
generator polynom -> SW from 7 downto 0  
message
	* split into four parts
	* input from SW7 downto SW0
	* select part with SW11 and SW10 (11 | 10 | 01 | 00)
* no simulation for this exercise, tried directly on board  

crc_wrapper_debug
* used LEDG as debug pins to know in which case "crc.vhd" is  
* hard-coded message and generator in "crc.vhd"  
* used SW as clock

-> problem was that values are not set/updated directly but after process finished (-> do not shift and xor in the same case)
* removed hard-coding for message and generator in "crc.vhd"

-> same problem for input between "crc.vhd" and "crc_wrapper.vhd" (-> trigger on falling edge in "crc_wrapper.vhd")

## Chapter 9
### Exercise 1
lights
* followed tutorial step by step  
decided to use vhdl and C  
had to install altera monitor program  

## Chapter 10
### Exercise 1
lights
* copied files from chapter 9
* followed tutorial step by step  
there was only a .text section in Memory Settings (no .data section)
### Exercise 2
helloworld
* copied files from above exercise and renamed to helloworld
* modified nios_system.qsys and helloworld.c accoring to exercise description
* modified helloworld.vhd
	* removed switches_export and leds_export from nios_system component and port map of NiosII
	* removed SW and LEDG from ports of helloworld entitiy
* on execution it is printed "Hello World!" in the terminal

## Chapter 11
### Exercise 1
crc
* copied files from Chapter10 Exercise2 and renamed to crc
* modified crc.c to calculate crc
	* see Chapter7 and "crc.vhd" for thoughts
	* input and output using terminal
* issues with scanf  
-> problem was `while scanf("%32s", ...) != 1` (-> instead use `scanf("%s", ...)` which is not so safe...)   
-> use getchar instead of scanf to have save C code and additionally check for binary input

## Chapter 12
### Exercise 1
component_tutorial
* followed tutorial step by step  
### Exercise 2
crc_codesign
* copied "crc.vhd" from Chapter7 Exercise1
used files and tutorial from above exercise as template
### Exercise 3
TODO

## Chapter 13
### Exercise 1
TODO
### Exercise 2
TODO