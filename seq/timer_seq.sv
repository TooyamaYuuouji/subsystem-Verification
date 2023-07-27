
class timer_seq extends apb3_master_base_seq;

    `uvm_object_utils(timer_seq)

    function new(string name="timer_seq");
        super.new(name);
    endfunction: new

    task body();
        // disable timer
        `uvm_do_with(req, {
            addr == 10'h000;
            wen == 1;
            wdata == 4'b1000;
        })
        // load data
        `uvm_do_with(req, {
            addr == 10'h008;
            wen == 1;
            wdata == 32'h0000_0014;
        })
        // enable timer
        `uvm_do_with(req, {
            addr == 10'h000;
            wen == 1;
            wdata == 4'b1001;
        })
        #0.5us;
    endtask: body

endclass: timer_seq