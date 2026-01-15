module TopModule (
    input         clk_clk,       // PIN_Y2 (50MHz)
    input  [0:0]  KEY,           // PIN_M23 (Reset Button)

    // SDRAM Clock Pin (Must match your QSF name "c1")
    output        c1,            // PIN_AE5 (Shifted Clock)
    
    // SDRAM Control & Data Pins
    output [12:0] new_sdram_controller_wire_addr,
    output [1:0]  new_sdram_controller_wire_ba,
    output        new_sdram_controller_wire_cas_n,
    output        new_sdram_controller_wire_cke,
    output        new_sdram_controller_wire_cs_n,
    inout  [31:0] new_sdram_controller_wire_dq,
    output [3:0]  new_sdram_controller_wire_dqm,
    output        new_sdram_controller_wire_ras_n,
    output        new_sdram_controller_wire_we_n,
    
    // LED Output
    output [7:0]  led_out_external_connection_export
);

    // Internal wires
    wire sys_clk;      // 0 phase shift (for SoC)
    wire sdram_clk;    // -3.6ns phase shift (for external Pin)

    // =========================================================
    // 1. INSTANTIATE THE PLL
    // =========================================================
    sdramPLL u_pll (
        .inclk0 (clk_clk),      // 50MHz Input
        .c0     (sys_clk),      // Output 0: System Clock -> Goes to SoC
        .c1     (sdram_clk)     // Output 1: Shifted Clock -> Goes to SDRAM Pin
        // .locked port is removed because your PLL doesn't have it
    );

    // Connect the internal shifted clock to the output pin "c1"
    assign c1 = sdram_clk;

    // =========================================================
    // 2. INSTANTIATE THE SOC
    // =========================================================
    SoC u_soc (
        .clk_clk                            (sys_clk), 
        
        // Use the physical button KEY[0] for reset
        .reset_reset_n                      (KEY[0]), 
        
        // Wiring ports to pins
        .new_sdram_controller_wire_addr     (new_sdram_controller_wire_addr),
        .new_sdram_controller_wire_ba       (new_sdram_controller_wire_ba),
        .new_sdram_controller_wire_cas_n    (new_sdram_controller_wire_cas_n),
        .new_sdram_controller_wire_cke      (new_sdram_controller_wire_cke),
        .new_sdram_controller_wire_cs_n     (new_sdram_controller_wire_cs_n),
        .new_sdram_controller_wire_dq       (new_sdram_controller_wire_dq),
        .new_sdram_controller_wire_dqm      (new_sdram_controller_wire_dqm),
        .new_sdram_controller_wire_ras_n    (new_sdram_controller_wire_ras_n),
        .new_sdram_controller_wire_we_n     (new_sdram_controller_wire_we_n),
        .led_out_external_connection_export (led_out_external_connection_export)
    );

endmodule