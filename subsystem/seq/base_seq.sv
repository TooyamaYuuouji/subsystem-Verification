
class base_seq extends uvm_sequence #(ahbl_transaction);

    `uvm_object_utils(base_seq)

    ahbl_transaction ahbl_tr;

    extern function new(string name="base_seq");

endclass: base_seq

/**************************************************
* implement
**************************************************/
function base_seq::new(string name="base_seq");
    super.new(name);
endfunction: new