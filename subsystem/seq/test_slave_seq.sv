//------------------------------------------------------------------------------
// 对test_slave进行测试
// 检查点：
// + 对不同的DATA寄存器写入数据时，pready线上低电平的持续时间不同，即写入成功前的等待周期不同

class test_slave_seq extends base_seq;

    `uvm_object_utils(test_slave_seq)

    extern function new(string name="test_slave_seq");
    extern virtual task body();

endclass: test_slave_seq

/**************************************************
* implement
**************************************************/
function test_slave_seq::new(string name="test_slave_seq");
    super.new(name);
endfunction: new

task test_slave_seq::body();
    ahbl_single_w32_seq ahbl_sw32_seq;

    ahbl_sw32_seq = ahbl_single_w32_seq::type_id::create("ahbl_sw32_seq");
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `APB_TEST_SLAVE_DATA0_OFFSET; ahbl_sw32_seq.seq_data == 32'd0;})
    #200ns;
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `APB_TEST_SLAVE_DATA1_OFFSET; ahbl_sw32_seq.seq_data == 32'd0;})
    #200ns;
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `APB_TEST_SLAVE_DATA2_OFFSET; ahbl_sw32_seq.seq_data == 32'd0;})
    #200ns;
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `APB_TEST_SLAVE_DATA3_OFFSET; ahbl_sw32_seq.seq_data == 32'd0;})
    #200ns;
endtask: body