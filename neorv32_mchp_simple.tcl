puts "TCL_BEGIN: [info script]"

if { [lindex $tcl_platform(os) 0]  == "Windows" } {
    if {[string length [pwd]] < 90} {
        puts "Project path length ok."
    } else {
        error "Path to project is too long, please reduce the path and try again."
    }
}

if { $::argc > 0 } {
    set i 1
    foreach arg $::argv {
        if {[string match "*:*" $arg]} {
            set var [string range $arg 0 [string first ":" $arg]-1]
            set val [string range $arg [string first ":" $arg]+1 end]
            puts "Setting parameter $var to $val"
            set $var "$val"
        } else {
            set $arg 1
            puts "set $arg to 1"
        }
        incr i
    }
} else {
    puts "no command line argument passed"
}

set local_dir [pwd]
set project_name "neorv32_disco"
set project_dir "$local_dir/neorv32_disco"	

new_project \
	-location $project_dir \
	-name $project_name \
	-project_description {} \
	-block_mode 0 \
	-standalone_peripheral_initialization 0 \
	-instantiate_in_smartdesign 1 \
	-ondemand_build_dh 1 \
	-use_relative_path 0 \
	-linked_files_root_dir_env {} \
	-hdl {VERILOG} \
	-family {PolarFireSoC} \
	-die {MPFS095T} \
	-package {FCSG325} \
	-speed {-1} \
	-die_voltage {1.0} \
	-part_range {EXT} \
	-adv_options {IO_DEFT_STD:LVCMOS 1.8V} \
	-adv_options {RESTRICTPROBEPINS:1} \
	-adv_options {RESTRICTSPIPINS:0} \
	-adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} \
	-adv_options {TEMPR:EXT} \
	-adv_options {VCCI_1.2_VOLTR:EXT} \
	-adv_options {VCCI_1.5_VOLTR:EXT} \
	-adv_options {VCCI_1.8_VOLTR:EXT} \
	-adv_options {VCCI_2.5_VOLTR:EXT} \
	-adv_options {VCCI_3.3_VOLTR:EXT} \
	-adv_options {VOLTR:EXT}

smartdesign \
	-memory_map_drc_change_error_to_warning 1 \
	-bus_interface_data_width_drc_change_error_to_warning 1 \
	-bus_interface_id_width_drc_change_error_to_warning 1 
	
#exec git submodule init
#exec git submodule update

cd "./neorv32/rtl/system_integration/"
source "./neorv32_libero_ip.tcl"
build_design_hierarchy
cd $local_dir

cd "./script"
source "./base_recursive.tcl"
cd $local_dir
save_project 
set_root -module {base::work} 
save_project 
derive_constraints_sdc 
import_files \
         -convert_EDN_to_HDL 0 \
         -sdc {../neorv32_mchp_simple/script/constaints/jtag.sdc} 
organize_tool_files -tool {SYNTHESIZE} -file {../neorv32_mchp_simple/neorv32_disco/constraint/base_derived_constraints.sdc} -file {../neorv32_mchp_simple/neorv32_disco/constraint/jtag.sdc} -module {base::work} -input_type {constraint} 
organize_tool_files -tool {PLACEROUTE} -file {../neorv32_mchp_simple/neorv32_disco/constraint/base_derived_constraints.sdc} -file {../neorv32_mchp_simple/neorv32_disco/constraint/jtag.sdc} -module {base::work} -input_type {constraint} 
organize_tool_files -tool {VERIFYTIMING} -file {../neorv32_mchp_simple/neorv32_disco/constraint/base_derived_constraints.sdc} -file {../neorv32_mchp_simple/neorv32_disco/constraint/jtag.sdc} -module {base::work} -input_type {constraint} 
import_files \
         -convert_EDN_to_HDL 0 \
         -io_pdc {../neorv32_mchp_simple/script/constaints/user.pdc} 
organize_tool_files -tool {PLACEROUTE} -file {../neorv32_mchp_simple/neorv32_disco/constraint/base_derived_constraints.sdc} -file {../neorv32_mchp_simple/neorv32_disco/constraint/jtag.sdc} -file {../neorv32_mchp_simple/neorv32_disco/constraint/io/user.pdc} -module {base::work} -input_type {constraint} 
save_project 