
module clk_gen (
    input wire clk,

    input wire apbactive,

    output wire pclkg,
    output wire pclkgen
);

wire 

cmsdk_clock_gate
    #(.CLKGATE_PRESENT(1))
    u_cmsdk_clock_gate_pclkg(
    .CLK       (clk),
    .CLKENABLE (i_pclkgen),
    .DISABLEG  (CGBYPASS),
    .GATEDCLK  (PCLKG));

endmodule: clk_gen

module cmsdk_clock_gate #(
  parameter CLKGATE_PRESENT = 0)
 (
  input  wire CLK,
  input  wire CLKENABLE,
  input  wire DISABLEG,

  output wire GATEDCLK);
  wire   i_clk;
  wire   clk_en;
  reg    clk_en_t2;
  wire   i_gated_clk;
  wire   mst_clk_en;
  wire   mst_disable;

  assign GATEDCLK     = (CLKGATE_PRESENT != 0) ? i_gated_clk : 1'b0;
  assign mst_clk_en   = (CLKGATE_PRESENT != 0) ? CLKENABLE : 1'b0;
  assign mst_disable  = (CLKGATE_PRESENT != 0) ? DISABLEG  : 1'b0;
  assign i_clk        = (CLKGATE_PRESENT != 0) ? CLK       : 1'b0;

  assign clk_en = mst_clk_en | mst_disable;

  always @(i_clk or clk_en)
    if (i_clk == 1'b0)
      clk_en_t2 <= clk_en;

  assign i_gated_clk = i_clk & clk_en_t2;
endmodule
