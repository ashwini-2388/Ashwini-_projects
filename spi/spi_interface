

`include "spi_seq_item.sv"
`include "spi_sequence.sv"
`include "spi_sequencer.sv"
`include "spi_driver.sv"
`include "spi_interface.sv"
`include "spi_monitor.sv"
`include "spi_agent.sv"
`include "spi_scoreboard.sv"
`include "spi_env.sv"
`include "spi_test.sv"


module top_tb;
  
 
  bit clk;
  bit reset;
  
  
  always #5 clk = ~clk;
  
 
  initial begin
    reset = 0;
    #5 reset =1;
  end
  
  spi_interface intf(clk,reset);
  
  
  spi_slave DUT(.sclk(intf.sclk),
                .reset(intf.reset),
                .cs(intf.cs),
                .mosi(intf.mosi),
                .miso(intf.miso),
                .data_in(intf.data_in),
                .data_out(intf.data_out),
                .read(intf.read),
                .load(intf.load),
                .count(intf.count),
                .shift_reg(intf.shift_reg),
                .miso_reg(intf.miso_reg),
                .data_out_reg(intf.data_out_reg)
  
                intf.data_out_master,
                intf.data_out_slave);
  
   initial begin 
     uvm_config_db#(virtual spi_interface)::set(uvm_root::get(),"*","vif",intf);
    //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test("spi_test");
  end
  
endmodule
