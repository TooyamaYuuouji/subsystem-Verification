
class timer_start_seq extends apb3_master_base_seq;

    rand logic[31:0] count_num;

    `uvm_object_utils(timer_start_seq)

    extern function new(string name="timer_start_seq");
    extern task body();

endclass: timer_start_seq

/**************************************************
* implement
**************************************************/
function timer_start_seq::new(string name="timer_start_seq");
    super.new(name);
endfunction: new

task timer_start_seq::body();
    super.body();

    // if(starting_phase != null) begin
    //     starting_phase.raise_objection(this);
    // end
    // disable timer
    // `uvm_do_with(req, {
    //     addr == 10'h000;
    //     wen == 1;
    //     wdata == 4'b1000;
    // })
    // load data
    `uvm_do_with(req, {
        addr == 10'h008;
        wen == 1;
        wdata == count_num;
        // wdata == 32'h0000_0014;
    })
    // enable timer
    `uvm_do_with(req, {
        addr == 10'h000;
        wen == 1;
        wdata == 4'b1001;
    })
    // #1us; // 必须有这个延时，同时必须将phase传递给sequence的starting_phase，以控制timer_test中的main_phase（如果test中没有挂起）
    // if(starting_phase != null) begin
    //     starting_phase.drop_objection(this);
    // end
endtask: body