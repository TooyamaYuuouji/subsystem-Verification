
class apb3_adapter extends uvm_reg_adapter;

    `uvm_object_utils(apb3_adapter)

    extern function new(string name="apb3_adapter");
    extern function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    extern function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);

endclass: apb3_adapter

/**************************************************
* implement
**************************************************/
function apb3_adapter::new(string name="apb3_adapter");
    super.new(name);
endfunction: new

function uvm_sequence_item apb3_adapter::reg2bus(const ref uvm_reg_bus_op rw);
    apb3_transaction tr;

    tr = new("tr");
    tr.addr = rw.addr;
    tr.wen = (rw.kind == UVM_READ) ? 0 : 1;
    if(tr.wen == 1) begin
        tr.wdata = rw.data;
    end

    return tr;
endfunction: reg2bus

function void apb3_adapter::bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    apb3_transaction tr;

    if(!$cast(tr, bus_item)) begin
        `uvm_fatal("CASTERR", "Provided bus_item is not a correct type!")
        return;
    end
    rw.kind = (tr.wen == 0) ? UVM_READ : UVM_WRITE;
    rw.addr = tr.addr;
    rw.byte_en = 'h3;
    rw.data = (tr.wen == 0) ? tr.rdata : tr.wdata;
    rw.status = UVM_IS_OK;
endfunction: bus2reg
