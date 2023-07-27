
class apb3_configuration extends uvm_object;

    // apb3_transaction tran;
    virtual apb3_interface apb3_vif;

    `uvm_object_utils_begin(apb3_configuration)
    `uvm_object_utils_end

    extern function new(string name="apb3_configuration");

endclass: apb3_configuration

/**************************************************
* implement
**************************************************/
function apb3_configuration::new(string name="apb3_configuration");
    super.new(name);
endfunction: new