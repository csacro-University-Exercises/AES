# AES Exercise SoSe2020
These are my chapterwise and exercisewise notes and comments.
Steps taken for each Quartus task
* create new project (DE2-115 is Cyclone IV E EP4CE115F29C7)
* import pin assignment and set unused pins to tri-state input
* implement and compile vhd file
* simulation: functional and timing
* programming FPGA and test

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
logs2(50 000 000) = 25.5754... -> 25 Stellen reichen aus um 50 000 000 binär darzustellen  
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