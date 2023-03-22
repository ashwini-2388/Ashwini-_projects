`include "fifo_intf.sv"
`include "fifo_pkg.sv"
//`include "fifo_base_test.sv"
module fifo_tb0;
  bit clk;
  bit rst_a;
  
  always #10 clk = ~clk;
  
  initial begin 
    rst_a = 1;
    #5 rst_a = 0;
  end
  
  fifo_inf intf(clk,rst_a);
  
  sync_fifo U0(.data_out(intf.data_out),
               .full(intf.full),
               .empty(intf.empty),
               .data_in(intf.data_in),
               .clk(clk),
               .rst_a(rst_a),
               .wr_en(intf.wr_en),
               .rd_en(intf.rd_en));
  
  initial begin 
    uvm_config_db#(virtual fifo_inf)::set(uvm_root::get(),"*","intf",intf);
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  initial begin
    run_test();
     
  end
endmodule
