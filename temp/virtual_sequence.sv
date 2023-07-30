
class virtual_seq extends uvm_sequence;

//     timer_seq t_seq;
//     // apb3_master_sequencer apb3_mst_sqr;

    `uvm_object_utils(virtual_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    function new(string name="virtual_seq");
        super.new(name);
    endfunction: new

//     task body();
//         // apb3_mst_sqr = p_sequencer.apb3_mst_sqr;

//         `uvm_do_on(t_seq, p_sequencer.apb3_mst_sqr)
//     endtask: body

//     virtual task pre_body();
//         if(starting_phase != null) begin
//             starting_phase.raise_objection(this);
//         end
//     endtask: pre_body

//     virtual task post_body();
//         if(starting_phase != null) begin
//             starting_phase.drop_objection(this);
//         end
//     endtask: post_body

endclass: virtual_seq