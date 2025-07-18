# Creating SmartDesign "axi4_2_apb3"
set sd_name {axi4_2_apb3}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_M_0x000_0000_PREADYS0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_M_0x000_0000_PSLVERRS0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_M_0x100_0000_PREADYS1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_M_0x100_0000_PSLVERRS1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave10_PREADYS10} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave10_PSLVERRS10} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave11_PREADYS11} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave11_PSLVERRS11} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave12_PREADYS12} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave12_PSLVERRS12} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave13_PREADYS13} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave13_PSLVERRS13} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave14_PREADYS14} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave14_PSLVERRS14} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PREADYS15} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PSLVERRS15} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PREADYS2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PSLVERRS2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PREADYS3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PSLVERRS3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave4_PREADYS4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave4_PSLVERRS4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave5_PREADYS5} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave5_PSLVERRS5} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave6_PREADYS6} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave6_PSLVERRS6} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave7_PREADYS7} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave7_PSLVERRS7} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave8_PREADYS8} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave8_PSLVERRS8} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave9_PREADYS9} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave9_PSLVERRS9} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_M_0x000_0000_PSELS0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_M_0x100_0000_PSELS1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave10_PSELS10} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave11_PSELS11} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave12_PSELS12} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave13_PSELS13} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave14_PSELS14} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave15_PSELS15} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PSELS2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PSELS3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave4_PSELS4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave5_PSELS5} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave6_PSELS6} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave7_PSELS7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave8_PSELS8} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave9_PSELS9} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_WREADY} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_M_0x000_0000_PRDATAS0} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_M_0x100_0000_PRDATAS1} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave10_PRDATAS10} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave11_PRDATAS11} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave12_PRDATAS12} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave13_PRDATAS13} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave14_PRDATAS14} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave15_PRDATAS15} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave2_PRDATAS2} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave3_PRDATAS3} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave4_PRDATAS4} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave5_PRDATAS5} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave6_PRDATAS6} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave7_PRDATAS7} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave8_PRDATAS8} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave9_PRDATAS9} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_ARADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_ARID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_AWADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_AWID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_WDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_WSTRB} -port_direction {IN} -port_range {[3:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave2_PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave2_PWDATAS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_BID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_RDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_RID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4SlaveIF_RRESP} -port_direction {OUT} -port_range {[1:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4_S} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWID:AXI4SlaveIF_AWID" \
"AWADDR:AXI4SlaveIF_AWADDR" \
"AWLEN:AXI4SlaveIF_AWLEN" \
"AWSIZE:AXI4SlaveIF_AWSIZE" \
"AWBURST:AXI4SlaveIF_AWBURST" \
"AWVALID:AXI4SlaveIF_AWVALID" \
"AWREADY:AXI4SlaveIF_AWREADY" \
"WDATA:AXI4SlaveIF_WDATA" \
"WSTRB:AXI4SlaveIF_WSTRB" \
"WLAST:AXI4SlaveIF_WLAST" \
"WVALID:AXI4SlaveIF_WVALID" \
"WREADY:AXI4SlaveIF_WREADY" \
"BID:AXI4SlaveIF_BID" \
"BRESP:AXI4SlaveIF_BRESP" \
"BVALID:AXI4SlaveIF_BVALID" \
"BREADY:AXI4SlaveIF_BREADY" \
"ARID:AXI4SlaveIF_ARID" \
"ARADDR:AXI4SlaveIF_ARADDR" \
"ARLEN:AXI4SlaveIF_ARLEN" \
"ARSIZE:AXI4SlaveIF_ARSIZE" \
"ARBURST:AXI4SlaveIF_ARBURST" \
"ARVALID:AXI4SlaveIF_ARVALID" \
"ARREADY:AXI4SlaveIF_ARREADY" \
"RID:AXI4SlaveIF_RID" \
"RDATA:AXI4SlaveIF_RDATA" \
"RRESP:AXI4SlaveIF_RRESP" \
"RLAST:AXI4SlaveIF_RLAST" \
"RVALID:AXI4SlaveIF_RVALID" \
"RREADY:AXI4SlaveIF_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x200_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave2_PSELS2" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave2_PRDATAS2" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave2_PREADYS2" \
"PSLVERR:APBmslave2_PSLVERRS2" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x300_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave3_PSELS3" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave3_PRDATAS3" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave3_PREADYS3" \
"PSLVERR:APBmslave3_PSLVERRS3" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x400_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave4_PSELS4" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave4_PRDATAS4" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave4_PREADYS4" \
"PSLVERR:APBmslave4_PSLVERRS4" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x500_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave5_PSELS5" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave5_PRDATAS5" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave5_PREADYS5" \
"PSLVERR:APBmslave5_PSLVERRS5" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x600_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave6_PSELS6" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave6_PRDATAS6" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave6_PREADYS6" \
"PSLVERR:APBmslave6_PSLVERRS6" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x700_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave7_PSELS7" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave7_PRDATAS7" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave7_PREADYS7" \
"PSLVERR:APBmslave7_PSLVERRS7" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x800_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave8_PSELS8" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave8_PRDATAS8" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave8_PREADYS8" \
"PSLVERR:APBmslave8_PSLVERRS8" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x900_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave9_PSELS9" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave9_PRDATAS9" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave9_PREADYS9" \
"PSLVERR:APBmslave9_PSLVERRS9" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0xA00_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave10_PSELS10" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave10_PRDATAS10" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave10_PREADYS10" \
"PSLVERR:APBmslave10_PSLVERRS10" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0xB00_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave11_PSELS11" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave11_PRDATAS11" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave11_PREADYS11" \
"PSLVERR:APBmslave11_PSLVERRS11" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0xC00_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave12_PSELS12" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave12_PRDATAS12" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave12_PREADYS12" \
"PSLVERR:APBmslave12_PSLVERRS12" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0xD00_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave13_PSELS13" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave13_PRDATAS13" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave13_PREADYS13" \
"PSLVERR:APBmslave13_PSLVERRS13" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0xE00_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave14_PSELS14" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave14_PRDATAS14" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave14_PREADYS14" \
"PSLVERR:APBmslave14_PSLVERRS14" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0xF00_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave15_PSELS15" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave15_PRDATAS15" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave15_PREADYS15" \
"PSLVERR:APBmslave15_PSLVERRS15" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x100_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APB_M_0x100_0000_PSELS1" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APB_M_0x100_0000_PRDATAS1" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APB_M_0x100_0000_PREADYS1" \
"PSLVERR:APB_M_0x100_0000_PSLVERRS1" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_M_0x000_0000} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APB_M_0x000_0000_PSELS0" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APB_M_0x000_0000_PRDATAS0" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APB_M_0x000_0000_PREADYS0" \
"PSLVERR:APB_M_0x000_0000_PSLVERRS0" } 

# Add CoreAHBLite_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAHBLite_C0} -instance_name {CoreAHBLite_C0_0}



# Add COREAHBTOAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAHBTOAPB3_C0} -instance_name {COREAHBTOAPB3_C0_0}



# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}



# Add COREAXITOAHBL_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXITOAHBL_C0} -instance_name {COREAXITOAHBL_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK" "COREAHBTOAPB3_C0_0:HCLK" "COREAXITOAHBL_C0_0:ACLK" "COREAXITOAHBL_C0_0:HCLK" "CoreAHBLite_C0_0:HCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:HRESETN" "COREAXITOAHBL_C0_0:ARESETN" "COREAXITOAHBL_C0_0:HRESETN" "CoreAHBLite_C0_0:HRESETN" "RESETN" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x000_0000" "CoreAPB3_C0_0:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x100_0000" "CoreAPB3_C0_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x200_0000" "CoreAPB3_C0_0:APBmslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x300_0000" "CoreAPB3_C0_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x400_0000" "CoreAPB3_C0_0:APBmslave4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x500_0000" "CoreAPB3_C0_0:APBmslave5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x600_0000" "CoreAPB3_C0_0:APBmslave6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x700_0000" "CoreAPB3_C0_0:APBmslave7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x800_0000" "CoreAPB3_C0_0:APBmslave8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0x900_0000" "CoreAPB3_C0_0:APBmslave9" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0xA00_0000" "CoreAPB3_C0_0:APBmslave10" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0xB00_0000" "CoreAPB3_C0_0:APBmslave11" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0xC00_0000" "CoreAPB3_C0_0:APBmslave12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0xD00_0000" "CoreAPB3_C0_0:APBmslave13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0xE00_0000" "CoreAPB3_C0_0:APBmslave14" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_M_0xF00_0000" "CoreAPB3_C0_0:APBmslave15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_S" "COREAXITOAHBL_C0_0:AXI4SlaveIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:AHBslave" "CoreAHBLite_C0_0:AHBmslave15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAHBTOAPB3_C0_0:APBmaster" "CoreAPB3_C0_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXITOAHBL_C0_0:AHBMasterIF" "CoreAHBLite_C0_0:AHBmmaster0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "axi4_2_apb3"
generate_component -component_name ${sd_name}
