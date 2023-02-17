class spi_seq_item extends uvm_sequence_item;
  
 
  rand bit [7:0]data_in;
  
  bit load_master;
  bit load_slave;
  bit read_master;
  bit read_slave;
  bit [7:0]data_out_master;
  bit [7:0]data_out_slave;
  bit cs;
  
  //---------------------------------------
  //Utility and Field macros
  //---------------------------------------
  `uvm_object_utils_begin(spi_seq_item)
  
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name="spi_seq_item");
    super.new();
  endfunction
  
  function string convert2string();
    return $psprintf("data_in=%0h h" data_in);
  endfunction
  
endclass
