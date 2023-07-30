
class example_seq extends apb3_master_base_seq;

    `uvm_object_utils(example_seq)

    extern function new(string name="example_seq");
    extern task body();

endclass: example_seq

/**************************************************
* implement
**************************************************/
function example_seq::new(string name="example_seq");
    super.new(name);
endfunction: new

task example_seq::body();
    logic[11:0] addr;
    // if(starting_phase != null) begin
    //     starting_phase.raise_objection(this);
    // end

    std::randomize(addr);
    // write data
    `uvm_do_with(req, {
        addr == addr;
        wen == 1;
    })
    // read data
    `uvm_do_with(req, {
        addr == addr;
        wen == 1;
    })

    #1us;
    // if(starting_phase != null) begin
    //     starting_phase.drop_objection(this);
    // end
endtask: body