
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

    covergroup timer1_cg with function sample(ahbl_transaction ahbl_tr);
        option.per_instance = 1;

        addr_check : coverpoint ahbl_tr.addr {
            bins ctrl_offset = {`TIMER1_CTRL_OFFSET};
            bins value_offset = {`TIMER1_VALUE_OFFSET};
            bins reload_offset = {`TIMER1_RELOAD_OFFSET};
            bins intclear_offset = {`TIMER1_INTCLEAR_OFFSET};
        }
    endgroup: timer1_cg

    covergroup dualtimer_cg with function sample(ahbl_transaction ahbl_tr);
        option.per_instance = 1;

        addr_check : coverpoint ahbl_tr.addr {
            bins timer1load_offset = {`DUALTIMER_TIMER1LOAD_OFFSET};
            bins timer1value_offset = {`DUALTIMER_TIMER1VALUE_OFFSET};
            bins timer1control_offset = {`DUALTIMER_TIMER1CONTROL_OFFSET};
            bins timer1intclr_offset = {`DUALTIMER_TIMER1INTCLR_OFFSET};
            bins timer1bgload_offset = {`DUALTIMER_TIMER1BGLOAD_OFFSET};
            bins timer2load_offset = {`DUALTIMER_TIMER2LOAD_OFFSET};
            bins timer2value_offset = {`DUALTIMER_TIMER2VALUE_OFFSET};
            bins timer2control_offset = {`DUALTIMER_TIMER2CONTROL_OFFSET};
            bins timer2intclr_offset = {`DUALTIMER_TIMER2INTCLR_OFFSET};
            bins timer2bgload_offset = {`DUALTIMER_TIMER2BGLOAD_OFFSET};
        }
    endgroup: dualtimer_cg

    extern function new(string name="func_cov");
    extern function cg_sample(ref ahbl_transaction ahbl_tr);

endclass: func_cov

/**************************************************
* implement
**************************************************/
function func_cov::new(string name="func_cov");
    super.new(name);

    timer0_cg = new();
    timer1_cg = new();
    dualtimer_cg = new();

    timer0_cg.set_inst_name({get_full_name(), ".timer0_cg"});
    timer1_cg.set_inst_name({get_full_name(), ".timer1_cg"});
    dualtimer_cg.set_inst_name({get_full_name(), ".dualtimer_cg"});
endfunction: new

function func_cov::cg_sample(ref ahbl_transaction ahbl_tr);
    timer0_cg.sample(ahbl_tr);
    timer1_cg.sample(ahbl_tr);
    dualtimer_cg.sample(ahbl_tr);
endfunction: cg_sample