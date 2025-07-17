# Creating SmartDesign "clk_gen"
set sd_name {clk_gen}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ref_clk_50MHz} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_100MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_150MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_200MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_250MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {resetn_clk_100MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {resetn_clk_150MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {resetn_clk_200MHz} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {resetn_clk_250MHz} -port_direction {OUT}



# Add CLKINT_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {CLKINT} -instance_name {CLKINT_0}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_INIT_MONITOR_C0} -instance_name {PF_INIT_MONITOR_C0_0}



# Add RESET_CLK_150MHz instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RESET_WRAPPER} -instance_name {RESET_CLK_100MHz}



# Add RESET_CLK_150MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RESET_WRAPPER} -instance_name {RESET_CLK_150MHz}



# Add RESET_CLK_200MHz instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RESET_WRAPPER} -instance_name {RESET_CLK_200MHz}



# Add RESET_CLK_250MHz instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RESET_WRAPPER} -instance_name {RESET_CLK_250MHz}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:A" "ref_clk_50MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:Y" "PF_CCC_C0_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EXT_RST_N" "RESET_CLK_100MHz:EXT_RST_N" "RESET_CLK_150MHz:EXT_RST_N" "RESET_CLK_200MHz:EXT_RST_N" "RESET_CLK_250MHz:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:OUT0_FABCLK_0" "RESET_CLK_250MHz:CLK" "clk_250MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:OUT1_FABCLK_0" "RESET_CLK_200MHz:CLK" "clk_200MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:OUT2_FABCLK_0" "RESET_CLK_150MHz:CLK" "clk_150MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:OUT3_FABCLK_0" "RESET_CLK_100MHz:CLK" "clk_100MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:PLL_LOCK_0" "RESET_CLK_100MHz:PLL_LOCK" "RESET_CLK_150MHz:PLL_LOCK" "RESET_CLK_200MHz:PLL_LOCK" "RESET_CLK_250MHz:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:PLL_POWERDOWN_N_0" "RESET_CLK_250MHz:POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" "RESET_CLK_100MHz:INIT_DONE" "RESET_CLK_150MHz:INIT_DONE" "RESET_CLK_200MHz:INIT_DONE" "RESET_CLK_250MHz:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_INIT_MONITOR_C0_0:FABRIC_POR_N" "RESET_CLK_100MHz:FPGA_POR_N" "RESET_CLK_150MHz:FPGA_POR_N" "RESET_CLK_200MHz:FPGA_POR_N" "RESET_CLK_250MHz:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_100MHz:FABRIC_RESET_N" "resetn_clk_100MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_150MHz:FABRIC_RESET_N" "resetn_clk_150MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_200MHz:FABRIC_RESET_N" "resetn_clk_200MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_CLK_250MHz:FABRIC_RESET_N" "resetn_clk_250MHz" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "clk_gen"
generate_component -component_name ${sd_name}
