interface perips_interface(input bit pclk, input bit presetn);

    logic[31:0] paddr;
    logic pwrite;
    logic penable;
    logic[31:0] pwdata;
    logic psel;
    logic pready;
    logic[31:0] prdata;
    logic pslverr;

endinterface : perips_interface