# FPGA-xs128plusplus

FPGA ready code for Xilinx FPGAs. Tested on xc7k420tffg901-2.

Code will be pipelined further in the future. Currently doing 20 billion+ seeds per cycle at 80w.

In mix64.vhd, two multiplication IPs are used. These IPs have been used since the multiplication done here is a constant coefficient multiplication. The IPs can be removed and the multiplication lines can be uncommented if needed.

The top level code is realxs.