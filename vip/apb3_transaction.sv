class apb3_transaction extends uvm_sequence_item;

    rand logic[31:0] addr;
    rand logic wen;
    rand logic[31:0] wdata;
    logic[31:0] rdata;

    `uvm_object_utils_begin(apb3_transaction)
        `uvm_field_int(addr, UVM_ALL_ON)
        `uvm_field_int(wdata, UVM_ALL_ON)
        `uvm_field_int(rdata, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name="apb3_transaction");
        super.new(name);
    endfunction: new
    
endclass: apb3_transaction