//------------------------------------------------------------------------------
// 系统接口，除AHB和APB之外的部分

interface system_interface(input bit sys_clk, input bit sys_rstn);

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
    * function and task
    **************************************************/
    // 打印当前时刻，中断线上的情况
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

    // 仿真rx波形，供uart模块接收时使用
    task simulate_rx(input int clk_count);
        logic[7:0] rx_value;
        int index;

        index = 8;
        void'(std::randomize(rx_value));
        $display({"[DEBUG]", $sformatf("in system_interface, %t generating rx_value=%b", $realtime, rx_value)});
        uart0_rxd <= 0;
        uart1_rxd <= 0;
        uart2_rxd <= 0;
        repeat(clk_count) begin
            @(posedge sys_clk);
        end
        while(index) begin
            index --;
            uart0_rxd <= rx_value[7-index];
            uart1_rxd <= rx_value[7-index];
            uart2_rxd <= rx_value[7-index];
            repeat(clk_count) begin
                @(posedge sys_clk);
            end
        end
        uart0_rxd <= 1;
        uart1_rxd <= 1;
        uart2_rxd <= 1;
        repeat(clk_count) begin
            @(posedge sys_clk);
        end
    endtask: simulate_rx

endinterface: system_interface