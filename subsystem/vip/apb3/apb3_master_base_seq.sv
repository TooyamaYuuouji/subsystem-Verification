
class apb3_master_base_seq extends uvm_sequence #(apb3_transaction);

    apb3_transaction req;

    `uvm_object_utils(apb3_master_base_seq)

    function new(string name="apb3_master_base_seq");
        super.new(name);
    endfunction: new

    virtual task pre_body();
        if(starting_phase != null) begin
            starting_phase.raise_objection(this);
        end
    endtask: pre_body

    virtual task post_body();
        if(starting_phase != null) begin
            starting_phase.drop_objection(this);
        end
    endtask: post_body

endclass: apb3_master_base_seq