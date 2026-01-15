
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
# vcsmx - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="SoC"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera/13.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/pll/
mkdir -p ./libraries/mm_clock_crossing_bridge/
mkdir -p ./libraries/led_out/
mkdir -p ./libraries/sysid/
mkdir -p ./libraries/timer/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/cpu/
mkdir -p ./libraries/sdram_controller/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneive_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/SoC_cpu_rf_ram_b.mif ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  vlogan +v2k -sverilog "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_pll.vo"                               -work pll                     
  vlogan +v2k "$QSYS_SIMDIR/submodules/altera_avalon_mm_clock_crossing_bridge.v" -work mm_clock_crossing_bridge
  vlogan +v2k "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                  -work mm_clock_crossing_bridge
  vlogan +v2k "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"      -work mm_clock_crossing_bridge
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_led_out.v"                            -work led_out                 
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_sysid.vo"                             -work sysid                   
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_timer.v"                              -work timer                   
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_jtag_uart.v"                          -work jtag_uart               
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_cpu.v"                                -work cpu                     
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_sysclk.v"       -work cpu                     
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_tck.v"          -work cpu                     
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_cpu_jtag_debug_module_wrapper.v"      -work cpu                     
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_cpu_oci_test_bench.v"                 -work cpu                     
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_cpu_test_bench.v"                     -work cpu                     
  vlogan +v2k "$QSYS_SIMDIR/submodules/SoC_sdram_controller.v"                   -work sdram_controller        
  vlogan +v2k "$QSYS_SIMDIR/SoC.v"                                                                             
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
