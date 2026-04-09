# 1-bit-4-1-Multiplexer
4:1 Mux (mux4t1) using 2:1 Mux (mux2t1), structural representation, enable port.
<br>DESIGN:
<br>//////////////////////////////////////////////////////////////////////////////////
<br>//
<br>// Create Date: 08.04.2026 13:42:20
<br>// Design Name: 1-bit 4:1 Multiplexer
<br>// Module Name: mux4t1
<br>// Target Devices: Simulation Only
<br>// Tool Versions: Vivado 2025.2
<br>// Description: 
<br>//     4:1 Mux (mux4t1) using 2:1 Mux (mux2t1), structural representation, enable port.
<br>// Dependencies: 
<br>//     mux4t1.v, mux2t1.v
<br>// Revision:
<br>//     Revision 0.01 - File Created
<br>//     Revision 0.02 - fixed unknown behaviour encountered during simulation (at enable=0, any input undefined)
<br>
<br>// Additional Comments:
<br>// I[0]-I[2] as mux-1 inputs, I[1]-I[3] as mux-2 inputs. This order is chosen so that: sel=00 -> I[0], sel=01 -> I[1], sel=10 -> I[2], sel=11 -> I[3].
<br>// When Enable is 0, Output is: X when any input is undefined, 0 when all inputs are defined
<br>//////////////////////////////////////////////////////////////////////////////////
<br>
<br>TESTBENCH:
<br>//////////////////////////////////////////////////////////////////////////////////
<br>// Author: Ritav
<br>//
<br>// Create Date: 08.04.2026 13:42:40
<br>// Design Name: 1-bit 4:1 MUX testbench
<br>// Module Name: tb_mux4t1
<br>// Project Name: MUX Implementation
<br>// Target Devices: Simulation Only
<br>// Tool Versions: Vivado 2025.2
<br>// Description: 
<br>//     Testbench for 1-bit 4:1 multiplexer (mux4t1), verifies functionality with all input combinations and enable states.
<br>// Dependencies: 
<br>//     Modules: mux4t1, mux2t1
<br>// Revision:
<br>//     Revision 0.01 - File Created
<br>// Additional Comments:
<br>//     Simulation includes undefined inputs to test X-propagation and enable behavior.
<br>//////////////////////////////////////////////////////////////////////////////////
<br>
<br>Author- Ritav
