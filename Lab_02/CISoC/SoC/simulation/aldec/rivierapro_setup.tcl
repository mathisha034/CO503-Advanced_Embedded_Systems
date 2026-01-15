
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

# ACDS 13.1 162 win32 2025.12.21.14:27:36

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
ensure_lib                          ./libraries/pll                     
vmap       pll                      ./libraries/pll                     
ensure_lib                          ./libraries/mm_clock_crossing_bridge
vmap       mm_clock_crossing_bridge ./libraries/mm_clock_crossing_bridge
ensure_lib                          ./libraries/led_out                 
vmap       led_out                  ./libraries/led_out                 
ensure_lib                          ./libraries/sysid                   
vmap       sysid                    ./libraries/sysid                   
ensure_lib                          ./libraries/timer                   
vmap       timer                    ./libraries/timer                   
ensure_lib                          ./libraries/jtag_uart               
vmap       jtag_uart                ./libraries/jtag_uart               
ensure_lib                          ./libraries/cpu                     
vmap       cpu                      ./libraries/cpu                     
ensure_lib                          ./libraries/sdram_controller        
vmap       sdram_controller         ./libraries/sdram_controller        

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
  vlog "$QSYS_SIMDIR/submodules/SoC_pll.vo"                               -work pll                     
  vlog "$QSYS_SIMDIR/submodules/altera_avalon_mm_clock_crossing_bridge.v" -work mm_clock_crossing_bridge
  vlog "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                  -work mm_clock_crossing_bridge
  vlog "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"      -work mm_clock_crossing_bridge
  vlog "$QSYS_SIMDIR/submodules/SoC_led_out.v"                            -work led_out                 
  vlog "$QSYS_SIMDIR/submodules/SoC_sysid.vo"                             -work sysid                   
  vlog "$QSYS_SIMDIR/submodules/SoC_timer.v"                              -work timer                   
  vlog "$QSYS_SIMDIR/submodules/SoC_jtag_uart.v"                          -work jtag_uart               
  vlog "$QSYS_SIMDIR/submodules/SoC_cpu.v"                                -work cpu                     
  vlog "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_sysclk.v"       -work cpu                     
  vlog "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_tck.v"          -work cpu                     
  vlog "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_wrapper.v"      -work cpu                     
  vlog "$QSYS_SIMDIR/submodules/SoC_cpu_oci_test_bench.v"                 -work cpu                     
  vlog "$QSYS_SIMDIR/submodules/SoC_cpu_test_bench.v"                     -work cpu                     
  vlog "$QSYS_SIMDIR/submodules/SoC_sdram_controller.v"                   -work sdram_controller        
  vlog "$QSYS_SIMDIR/SoC.v"                                                                             
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L pll -L mm_clock_crossing_bridge -L led_out -L sysid -L timer -L jtag_uart -L cpu -L sdram_controller -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L pll -L mm_clock_crossing_bridge -L led_out -L sysid -L timer -L jtag_uart -L cpu -L sdram_controller -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
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
