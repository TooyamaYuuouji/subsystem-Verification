
class apb3_master_base_seq extends uvm_sequence #(apb3_transaction);

    apb3_transaction req;

    `uvm_object_utils(apb3_master_base_seq)

    extern function new(string name="apb3_master_base_seq");
    extern virtual task pre_body();
    extern virtual task post_body();

endclass: apb3_master_base_seq

/**************************************************
* implement
**************************************************/
function apb3_master_base_seq::new(string name="apb3_master_base_seq");
    super.new(name);
endfunction: new

task apb3_master_base_seq::pre_body();
    if(starting_phase != null) begin
        starting_phase.raise_objection(this);
    end
endtask: pre_body

task apb3_master_base_seq::post_body();
    if(starting_phase != null) begin
        starting_phase.drop_objection(this);
    end
endtask: post_body