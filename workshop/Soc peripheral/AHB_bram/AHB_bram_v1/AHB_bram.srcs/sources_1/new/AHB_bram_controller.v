`timescale 1ns/1ps
module AHB_bram #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
    )(
    // AHB-Lite slave interface
    //global signals
    // Clock and reset signals
    input  wire HCLK,        // AHB system clock input
    input  wire HRESETn,     // AHB system reset input, active low

    // Slave select signal
    input  wire HSELx,       // Slave select signal, asserted when this slave is selected

    // Address and control signals
    input wire     [ADDR_WIDTH-1:0] HADDR,      // Address bus, specifies the address for the current transfer
    input wire                      HWRITE,     // Transfer direction; 1 = write, 0 = read
    input wire     [2:0]            HSIZE,      // Transfer size; indicates the size of the transfer (byte0, halfword1, word2 etc.)
    input wire     [2:0]            HBURST,     // Burst type; indicates if the transfer is single, incrementing, or wrapping burst
    // input wire     [3:0]            HPROT,      //not use now// Protection control signals; provides information about the bus access type
    input wire     [1:0]            HTRANS,     // Transfer type; indicates the type of the current transfer (IDLE, BUSY, NONSEQ, SEQ)
    // input wire                      HMASTLOCK,  //not use now// Locked transfer signal; indicates if the current transfer is part of a locked sequence
    input wire                      HREADY,     // Transfer ready input; indicates if the previous transfer has finished

    // Write data bus
    input wire     [DATA_WIDTH-1:0] HWDATA,     // Write data bus; carries data from master to slave during write operations

    // Transfer response signals
    output wire    HREADYOUT,                   // Transfer ready output; indicates if the slave is ready to complete the transfer
    output wire    HRESP,                       // Transfer response; indicates the status of the transfer (OKAY, ERROR)

    // Read data bus
    output wire    [DATA_WIDTH-1:0] HRDATA,     // Read data bus; carries data from slave to master during read operations
    // AHB-Lite slave interface

    // single port ram BRAM interface
    output wire [ADDR_WIDTH-1:0]       bram_addra,
    output wire [DATA_WIDTH-1:0]       bram_dina,
    input  wire [DATA_WIDTH-1:0]       bram_douta,
    output wire                        bram_ena,
    output wire [(DATA_WIDTH/8)-1 : 0] bram_wea
    // BRAM interface
    // ports
);



endmodule