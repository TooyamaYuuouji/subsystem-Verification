interface apb3_interface(input logic PCLK, input logic PRESETn);

    // logic                PCLK;
    // logic                PRESETn;
    logic                PSEL;
    logic                PENABLE;
    logic                PWRITE;
    logic[31:0]    PADDR;
    logic[31:0]    PWDATA;
    logic[31:0]    PRDATA;
    logic                PREADY;
    logic                PSLVERR;

    logic                PCLKG;

    clocking mst_drv_pcb @(posedge PCLK);
        output PSEL, PENABLE, PWRITE, PADDR, PWDATA;
        input PRDATA, PREADY, PSLVERR;

        output PCLKG;
    endclocking: mst_drv_pcb

    clocking mst_drv_ncb @(negedge PCLK);
        output PCLKG;
    endclocking: mst_drv_ncb

    clocking slave_drv_pcb @(posedge PCLK);
        input PSEL, PENABLE, PWRITE, PADDR, PWDATA;
        output PRDATA, PREADY, PSLVERR;
    endclocking: slave_drv_pcb

    clocking slave_drv_ncb @(negedge PCLK);
        input PCLKG;
    endclocking: slave_drv_ncb

    clocking mon_pcb @(posedge PCLK);
        input PSEL, PENABLE, PWRITE, PADDR, PWDATA;
        input PRDATA, PREADY, PSLVERR;

        input PCLKG;
    endclocking: mon_pcb

endinterface: apb3_interface