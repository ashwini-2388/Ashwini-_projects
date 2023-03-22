interface fifo_inf(input logic clk, rst_a);
    logic[3:0]  data_out;
    logic[3:0] data_in;
	logic       rd_en;
    logic       wr_en;
    logic full;
    logic empty;
	
	clocking driver_cb @(posedge clk);
	   input  data_out;
       input full;
       input empty;
	   output data_in;
	   output wr_en;
       output rd_en;
	  
	endclocking
	
	clocking monitor_cb @(posedge clk);
	   input data_out;
       input full;
       input empty;
	   input data_in;
	   input wr_en;
       input rd_en;
	endclocking
	
    modport DRIVER(clocking driver_cb, input clk, rst_a);
      modport MONITOR(clocking monitor_cb, input clk, rst_a);
	
endinterface
