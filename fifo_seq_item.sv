class fifo_seq_item extends uvm_sequence_item;
	
  rand bit[3:0] data_in;
  rand bit      rd_en;
  rand bit      wr_en;
  bit[3:0]      data_out;
  bit           full;
  bit           empty;
		 
  `uvm_object_utils_begin(fifo_seq_item)
       `uvm_field_int(data_in, UVM_DEFAULT)
	   `uvm_field_int(wr_en,UVM_DEFAULT)
	   `uvm_field_int(rd_en,UVM_DEFAULT)
  `uvm_object_utils_end
	  
  function new(string name = "fifo_seq_item");
	   super.new(name);
  endfunction
endclass
