# AES Exercise SoSe2020
These are my chapterwise and exercisewise notes and comments.
Steps taken for each Quartus task
* create new project (DE2-115 is Cyclone IVE EP4CE115F29C7)
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
### Exercise2
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

