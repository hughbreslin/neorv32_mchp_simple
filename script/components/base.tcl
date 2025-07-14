# Creating SmartDesign "base"
set sd_name {base}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ext_rstn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ref_clk_50MHz} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {uart0_rxd_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {uart0_txd_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {pwm_o} -port_direction {OUT} -port_range {[6:0]}


# Add clk_gen_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {clk_gen} -instance_name {clk_gen_0}



# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add COREJTAGDEBUG_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREJTAGDEBUG_C0} -instance_name {COREJTAGDEBUG_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREJTAGDEBUG_C0_0:TGT_TRSTN_0}



# Add neorv32_libero_ip_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {neorv32_libero_ip} -instance_name {neorv32_libero_ip_0}
# Exporting Parameters of instance neorv32_libero_ip_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {neorv32_libero_ip_0} -params {\
"BOOT_ADDR_CUSTOM_LOWER:0" \
"BOOT_ADDR_CUSTOM_UPPER:0" \
"BOOT_MODE_SELECT:1" \
"CACHE_BLOCK_SIZE:64" \
"CLOCK_FREQUENCY:200000000" \
"CPU_FAST_MUL_EN_INT:0" \
"CPU_FAST_SHIFT_EN_INT:0" \
"CPU_RF_HW_RST_EN_INT:0" \
"DCACHE_EN_INT:0" \
"DCACHE_NUM_BLOCKS:4" \
"DMEM_EN_INT:0" \
"DMEM_OUTREG_EN_INT:0" \
"DMEM_SIZE:8192" \
"DUAL_CORE_EN_INT:0" \
"HPM_CNT_WIDTH:40" \
"HPM_NUM_CNTS:0" \
"ICACHE_EN_INT:0" \
"ICACHE_NUM_BLOCKS:4" \
"IMEM_EN_INT:0" \
"IMEM_OUTREG_EN_INT:0" \
"IMEM_SIZE:16384" \
"IO_CFS_EN_INT:0" \
"IO_CLINT_EN_INT:0" \
"IO_DMA_DSC_FIFO:4" \
"IO_DMA_EN_INT:0" \
"IO_GPIO_EN_INT:0" \
"IO_GPIO_IN_NUM:1" \
"IO_GPIO_OUT_NUM:1" \
"IO_GPTMR_EN_INT:0" \
"IO_NEOLED_EN_INT:0" \
"IO_NEOLED_TX_FIFO:1" \
"IO_ONEWIRE_EN_INT:0" \
"IO_PWM_EN_INT:1" \
"IO_PWM_NUM_CH:7" \
"IO_SDI_EN_INT:0" \
"IO_SDI_FIFO:1" \
"IO_SLINK_EN_INT:0" \
"IO_SLINK_RX_FIFO:1" \
"IO_SLINK_TX_FIFO:1" \
"IO_SPI_EN_INT:0" \
"IO_SPI_FIFO:1" \
"IO_TRNG_EN_INT:0" \
"IO_TRNG_FIFO:1" \
"IO_TWD_EN_INT:0" \
"IO_TWD_RX_FIFO:1" \
"IO_TWD_TX_FIFO:1" \
"IO_TWI_EN_INT:0" \
"IO_TWI_FIFO:1" \
"IO_UART0_EN_INT:1" \
"IO_UART0_RX_FIFO:1" \
"IO_UART0_TX_FIFO:1" \
"IO_UART1_EN_INT:0" \
"IO_UART1_RX_FIFO:1" \
"IO_UART1_TX_FIFO:1" \
"IO_WDT_EN_INT:0" \
"OCD_AUTHENTICATION_INT:0" \
"OCD_EN_INT:1" \
"OCD_HW_BREAKPOINT_INT:0" \
"OCD_JEDEC_ID_VAL:0" \
"PMP_MIN_GRANULARITY:4" \
"PMP_NAP_MODE_EN_INT:0" \
"PMP_NUM_REGIONS:0" \
"PMP_TOR_MODE_EN_INT:0" \
"RISCV_ISA_C_INT:1" \
"RISCV_ISA_E_INT:0" \
"RISCV_ISA_M_INT:0" \
"RISCV_ISA_U_INT:0" \
"RISCV_ISA_Zaamo_INT:0" \
"RISCV_ISA_Zalrsc_INT:0" \
"RISCV_ISA_Zba_INT:0" \
"RISCV_ISA_Zbb_INT:0" \
"RISCV_ISA_Zbkb_INT:0" \
"RISCV_ISA_Zbkc_INT:0" \
"RISCV_ISA_Zbkx_INT:0" \
"RISCV_ISA_Zbs_INT:0" \
"RISCV_ISA_Zfinx_INT:0" \
"RISCV_ISA_Zicntr_INT:0" \
"RISCV_ISA_Zicond_INT:0" \
"RISCV_ISA_Zihpm_INT:0" \
"RISCV_ISA_Zknd_INT:0" \
"RISCV_ISA_Zkne_INT:0" \
"RISCV_ISA_Zknh_INT:0" \
"RISCV_ISA_Zksed_INT:0" \
"RISCV_ISA_Zksh_INT:0" \
"RISCV_ISA_Zmmul_INT:0" \
"RISCV_ISA_Zxcfu_INT:0" \
"XBUS_EN_INT:1" \
"XBUS_REGSTAGE_EN_INT:1" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {neorv32_libero_ip_0}
sd_update_instance -sd_name ${sd_name} -instance_name {neorv32_libero_ip_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:uart0_ctsn_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:uart1_rxd_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:uart1_ctsn_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:spi_dat_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:sdi_clk_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:sdi_dat_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:sdi_csn_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:twi_sda_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:twi_scl_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:twd_sda_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:twd_scl_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:onewire_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:mtime_irq_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:msw_irq_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:mext_irq_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:gpio_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {neorv32_libero_ip_0:cfs_in_i} -value {GND}



# Add PF_SRAM_AHBL_AXI_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SRAM_AHBL_AXI_C0} -instance_name {PF_SRAM_AHBL_AXI_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:ACLK" "PF_SRAM_AHBL_AXI_C0_0:ACLK" "clk_gen_0:clk_200MHz" "neorv32_libero_ip_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:ARESETN" "PF_SRAM_AHBL_AXI_C0_0:ARESETN" "clk_gen_0:resetn_clk_200MHz" "neorv32_libero_ip_0:resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TCK_0" "neorv32_libero_ip_0:jtag_tck_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDI_0" "neorv32_libero_ip_0:jtag_tdi_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TDO_0" "neorv32_libero_ip_0:jtag_tdo_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TGT_TMS_0" "neorv32_libero_ip_0:jtag_tms_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREJTAGDEBUG_C0_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"clk_gen_0:EXT_RST_N" "ext_rstn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"clk_gen_0:ref_clk_50MHz" "ref_clk_50MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"neorv32_libero_ip_0:uart0_rxd_i" "uart0_rxd_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"neorv32_libero_ip_0:uart0_txd_o" "uart0_txd_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"neorv32_libero_ip_0:pwm_o" "pwm_o" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" "neorv32_libero_ip_0:axi4_m" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:AXI4mslave0" "PF_SRAM_AHBL_AXI_C0_0:AXI4_Slave" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "base"
generate_component -component_name ${sd_name}
