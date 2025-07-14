create_clock -name {TCK}\
-period 166.67 \
-waveform {0 83.33} \ [ get_ports {TCK}]
set_clock_groups -name {async1}\
-asynchronous\
-group [ get_clocks {clk_gen_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1}]\
-group [ get_clocks {TCK}]
