# Exporting Component Description of bootrom to TCL
# Family: PolarFireSoC
# Part Number: MPFS095T-1FCSG325E
# Create and Configure the core component bootrom
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:1.2.111} -component_name {bootrom} -params {\
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:32" \
"AXI4_IDWIDTH:4" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:F" \
"AXI4_WRAP_SUPPORT:F" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:4" \
"B_REN_POLARITY:2" \
"CASCADE:1" \
"ECC_OPTIONS:0" \
"FABRIC_INTERFACE_TYPE:1" \
"IMPORT_FILE:../script/neorv32-bootloader.hex" \
"INIT_RAM:T" \
"LPM_HINT:0" \
"PIPELINE_OPTIONS:1" \
"RDEPTH:4096" \
"RWIDTH:40" \
"USE_NATIVE_INTERFACE:F" \
"WDEPTH:4096" \
"WWIDTH:40" }
# Exporting Component Description of bootrom to TCL done
