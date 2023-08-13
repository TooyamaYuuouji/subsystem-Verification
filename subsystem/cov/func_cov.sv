
class func_cov extends uvm_object;

    `uvm_object_utils(func_cov)

    covergroup timer0_cg with function sample(ahbl_transaction ahbl_tr);
        option.per_instance = 1;

        addr_check : coverpoint ahbl_tr.addr {
            bins ctrl_offset = {`TIMER0_CTRL_OFFSET};
            bins value_offset = {`TIMER0_VALUE_OFFSET};
            bins reload_offset = {`TIMER0_RELOAD_OFFSET};
            bins intclear_offset = {`TIMER0_INTCLEAR_OFFSET};
        }
    endgroup: timer0_cg

    extern function new(string name="func_cov");

endclass: func_cov

/**************************************************
* implement
**************************************************/
function func_cov::new(string name="func_cov");
    super.new(name);

    timer0_cg = new();

    timer0_cg.set_inst_name({get_full_name(), ".cg"});
endfunction: new