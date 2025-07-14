#Sourcing the Tcl files for creating individual components under the top level
source components/COREAXI4INTERCONNECT_C0.tcl 
source components/COREJTAGDEBUG_C0.tcl 
source components/PF_SRAM_AHBL_AXI_C0.tcl 
source components/PF_CCC_C0.tcl 
source components/PF_INIT_MONITOR_C0.tcl 
source components/CORERESET_PF_C0.tcl 
source components/RESET_WRAPPER.tcl 
source components/clk_gen.tcl 
source components/base.tcl 
build_design_hierarchy
