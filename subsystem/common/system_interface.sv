interface system_interface();

    logic uart0_rxd;
    logic uart0_txd;
    logic uart0_txen;
    logic uart1_rxd;
    logic uart1_txd;
    logic uart1_txen;
    logic uart2_rxd;
    logic uart2_txd;
    logic uart2_txen;
    logic timer0_extin;
    logic timer1_extin;
    logic[31:0] apbsubsys_interrupt;
    logic watchdog_interrupt;
    logic watchdog_reset;

    /**************************************************
    * report current interrupts situation
    **************************************************/
    function void report_int();
        string str = "";

        str = {str, $sformatf("UART 0 receive interrupt\t: %b\n", apbsubsys_interrupt[0])};
        str = {str, $sformatf("UART 0 transmit interrupt\t: %b\n", apbsubsys_interrupt[1])};
        str = {str, $sformatf("UART 1 receive interrupt\t: %b\n", apbsubsys_interrupt[2])};
        str = {str, $sformatf("UART 1 transmit interrupt\t: %b\n", apbsubsys_interrupt[3])};
        str = {str, $sformatf("UART 2 receive interrupt\t: %b\n", apbsubsys_interrupt[4])};
        str = {str, $sformatf("UART 2 transmit interrupt\t: %b\n", apbsubsys_interrupt[5])};
        str = {str, $sformatf("Timer 0\t\t\t\t: %b\n", apbsubsys_interrupt[8])};
        str = {str, $sformatf("Timer 1\t\t\t\t: %b\n", apbsubsys_interrupt[9])};
        str = {str, $sformatf("Dual-input timer\t\t: %b\n", apbsubsys_interrupt[10])};
        str = {str, $sformatf("UART 0 overflow interrupt\t: %b\n", apbsubsys_interrupt[12])};
        str = {str, $sformatf("UART 1 overflow interrupt\t: %b\n", apbsubsys_interrupt[13])};
        str = {str, $sformatf("UART 2 overflow interrupt\t: %b\n", apbsubsys_interrupt[14])};

        $display(str);
    endfunction: report_int

endinterface: system_interface