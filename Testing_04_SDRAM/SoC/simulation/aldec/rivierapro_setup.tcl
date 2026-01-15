
# (C) 2001-2025 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.1 162 win32 2025.12.20.20:41:14

# ----------------------------------------
# Auto-generated simulation script

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "SoC"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/13.1/quartus/"
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_b.mif ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                  ./libraries/altera_ver      
vmap       altera_ver       ./libraries/altera_ver      
ensure_lib                  ./libraries/lpm_ver         
vmap       lpm_ver          ./libraries/lpm_ver         
ensure_lib                  ./libraries/sgate_ver       
vmap       sgate_ver        ./libraries/sgate_ver       
ensure_lib                  ./libraries/altera_mf_ver   
vmap       altera_mf_ver    ./libraries/altera_mf_ver   
ensure_lib                  ./libraries/altera_lnsim_ver
vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver
ensure_lib                  ./libraries/cycloneive_ver  
vmap       cycloneive_ver   ./libraries/cycloneive_ver  
ensure_lib                                                                          ./libraries/rsp_xbar_mux_001                                                        
vmap       rsp_xbar_mux_001                                                         ./libraries/rsp_xbar_mux_001                                                        
ensure_lib                                                                          ./libraries/rsp_xbar_mux                                                            
vmap       rsp_xbar_mux                                                             ./libraries/rsp_xbar_mux                                                            
ensure_lib                                                                          ./libraries/rsp_xbar_demux_002                                                      
vmap       rsp_xbar_demux_002                                                       ./libraries/rsp_xbar_demux_002                                                      
ensure_lib                                                                          ./libraries/cmd_xbar_mux_002                                                        
vmap       cmd_xbar_mux_002                                                         ./libraries/cmd_xbar_mux_002                                                        
ensure_lib                                                                          ./libraries/cmd_xbar_mux                                                            
vmap       cmd_xbar_mux                                                             ./libraries/cmd_xbar_mux                                                            
ensure_lib                                                                          ./libraries/cmd_xbar_demux_001                                                      
vmap       cmd_xbar_demux_001                                                       ./libraries/cmd_xbar_demux_001                                                      
ensure_lib                                                                          ./libraries/cmd_xbar_demux                                                          
vmap       cmd_xbar_demux                                                           ./libraries/cmd_xbar_demux                                                          
ensure_lib                                                                          ./libraries/id_router_002                                                           
vmap       id_router_002                                                            ./libraries/id_router_002                                                           
ensure_lib                                                                          ./libraries/id_router                                                               
vmap       id_router                                                                ./libraries/id_router                                                               
ensure_lib                                                                          ./libraries/addr_router_001                                                         
vmap       addr_router_001                                                          ./libraries/addr_router_001                                                         
ensure_lib                                                                          ./libraries/addr_router                                                             
vmap       addr_router                                                              ./libraries/addr_router                                                             
ensure_lib                                                                          ./libraries/cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo
vmap       cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo ./libraries/cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo
ensure_lib                                                                          ./libraries/cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent         
vmap       cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent          ./libraries/cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent         
ensure_lib                                                                          ./libraries/cpu_instruction_master_translator_avalon_universal_master_0_agent       
vmap       cpu_instruction_master_translator_avalon_universal_master_0_agent        ./libraries/cpu_instruction_master_translator_avalon_universal_master_0_agent       
ensure_lib                                                                          ./libraries/cpu_jtag_debug_module_translator                                        
vmap       cpu_jtag_debug_module_translator                                         ./libraries/cpu_jtag_debug_module_translator                                        
ensure_lib                                                                          ./libraries/cpu_instruction_master_translator                                       
vmap       cpu_instruction_master_translator                                        ./libraries/cpu_instruction_master_translator                                       
ensure_lib                                                                          ./libraries/rst_controller                                                          
vmap       rst_controller                                                           ./libraries/rst_controller                                                          
ensure_lib                                                                          ./libraries/irq_mapper                                                              
vmap       irq_mapper                                                               ./libraries/irq_mapper                                                              
ensure_lib                                                                          ./libraries/mm_interconnect_0                                                       
vmap       mm_interconnect_0                                                        ./libraries/mm_interconnect_0                                                       
ensure_lib                                                                          ./libraries/led_out                                                                 
vmap       led_out                                                                  ./libraries/led_out                                                                 
ensure_lib                                                                          ./libraries/sysid                                                                   
vmap       sysid                                                                    ./libraries/sysid                                                                   
ensure_lib                                                                          ./libraries/timer                                                                   
vmap       timer                                                                    ./libraries/timer                                                                   
ensure_lib                                                                          ./libraries/jtag_uart                                                               
vmap       jtag_uart                                                                ./libraries/jtag_uart                                                               
ensure_lib                                                                          ./libraries/cpu                                                                     
vmap       cpu                                                                      ./libraries/cpu                                                                     
ensure_lib                                                                          ./libraries/new_sdram_controller                                                    
vmap       new_sdram_controller                                                     ./libraries/new_sdram_controller                                                    

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  vlog +define+SKIP_KEYWORDS_PRAGMA "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  vlog                              "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work rsp_xbar_mux_001                                                        
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_rsp_xbar_mux_001.sv"   -work rsp_xbar_mux_001                                                        
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work rsp_xbar_mux                                                            
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_rsp_xbar_mux.sv"       -work rsp_xbar_mux                                                            
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_rsp_xbar_demux_002.sv" -work rsp_xbar_demux_002                                                      
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work cmd_xbar_mux_002                                                        
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_cmd_xbar_mux_002.sv"   -work cmd_xbar_mux_002                                                        
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work cmd_xbar_mux                                                            
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_cmd_xbar_mux.sv"       -work cmd_xbar_mux                                                            
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_cmd_xbar_demux_001.sv" -work cmd_xbar_demux_001                                                      
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_cmd_xbar_demux.sv"     -work cmd_xbar_demux                                                          
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_id_router_002.sv"      -work id_router_002                                                           
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_id_router.sv"          -work id_router                                                               
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_addr_router_001.sv"    -work addr_router_001                                                         
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0_addr_router.sv"        -work addr_router                                                             
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                     -work cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                -work cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent         
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"         -work cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent         
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"               -work cpu_instruction_master_translator_avalon_universal_master_0_agent       
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"           -work cpu_jtag_debug_module_translator                                        
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"          -work cpu_instruction_master_translator                                       
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                   -work rst_controller                                                          
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                 -work rst_controller                                                          
  vlog  "$QSYS_SIMDIR/submodules/SoC_irq_mapper.sv"                           -work irq_mapper                                                              
  vlog  "$QSYS_SIMDIR/submodules/SoC_mm_interconnect_0.v"                     -work mm_interconnect_0                                                       
  vlog  "$QSYS_SIMDIR/submodules/SoC_led_out.v"                               -work led_out                                                                 
  vlog  "$QSYS_SIMDIR/submodules/SoC_sysid.vo"                                -work sysid                                                                   
  vlog  "$QSYS_SIMDIR/submodules/SoC_timer.v"                                 -work timer                                                                   
  vlog  "$QSYS_SIMDIR/submodules/SoC_jtag_uart.v"                             -work jtag_uart                                                               
  vlog  "$QSYS_SIMDIR/submodules/SoC_cpu.v"                                   -work cpu                                                                     
  vlog  "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_sysclk.v"          -work cpu                                                                     
  vlog  "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_tck.v"             -work cpu                                                                     
  vlog  "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_wrapper.v"         -work cpu                                                                     
  vlog  "$QSYS_SIMDIR/submodules/SoC_cpu_oci_test_bench.v"                    -work cpu                                                                     
  vlog  "$QSYS_SIMDIR/submodules/SoC_cpu_test_bench.v"                        -work cpu                                                                     
  vlog  "$QSYS_SIMDIR/submodules/SoC_new_sdram_controller.v"                  -work new_sdram_controller                                                    
  vlog  "$QSYS_SIMDIR/SoC.v"                                                                                                                                
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L rsp_xbar_mux_001 -L rsp_xbar_mux -L rsp_xbar_demux_002 -L cmd_xbar_mux_002 -L cmd_xbar_mux -L cmd_xbar_demux_001 -L cmd_xbar_demux -L id_router_002 -L id_router -L addr_router_001 -L addr_router -L cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -L cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent -L cpu_instruction_master_translator_avalon_universal_master_0_agent -L cpu_jtag_debug_module_translator -L cpu_instruction_master_translator -L rst_controller -L irq_mapper -L mm_interconnect_0 -L led_out -L sysid -L timer -L jtag_uart -L cpu -L new_sdram_controller -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L rsp_xbar_mux_001 -L rsp_xbar_mux -L rsp_xbar_demux_002 -L cmd_xbar_mux_002 -L cmd_xbar_mux -L cmd_xbar_demux_001 -L cmd_xbar_demux -L id_router_002 -L id_router -L addr_router_001 -L addr_router -L cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -L cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent -L cpu_instruction_master_translator_avalon_universal_master_0_agent -L cpu_jtag_debug_module_translator -L cpu_instruction_master_translator -L rst_controller -L irq_mapper -L mm_interconnect_0 -L led_out -L sysid -L timer -L jtag_uart -L cpu -L new_sdram_controller -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
