
interface dut_interface(input logic PCLK, input logic PRESETn);

    logic timer_int;

    clocking mon_pcb @(posedge PCLK);
        input timer_int;
    endclocking: mon_pcb

endinterface: dut_interface