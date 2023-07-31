
interface dut_interface(input logic PCLK, input logic PRESETn);

    // timer
    logic timer_int;
    // dualtimer
    logic dualtimer_clk;
    logic dualtimer_clken1;
    logic dualtimer_clken2;
    logic dualtimer_int1;
    logic dualtimer_int2;
    logic dualtimer_intc;
    // watchdog
    logic watchdog_clk;
    logic watchdog_clken;
    logic watchdog_rstn;
    logic watchdog_int;
    logic watchdog_res;

    clocking mst_drv_pcb @(posedge PCLK);
        output dualtimer_clk, dualtimer_clken1, dualtimer_clken2;
        output watchdog_clk, watchdog_clken, watchdog_rstn;
    endclocking: mst_drv_pcb

    clocking mon_pcb @(posedge PCLK);
        input timer_int;
        input dualtimer_clk, dualtimer_clken1, dualtimer_clken2, dualtimer_int1, dualtimer_int2, dualtimer_intc;
        input watchdog_clk, watchdog_clken, watchdog_rstn, watchdog_int, watchdog_res;
    endclocking: mon_pcb

endinterface: dut_interface