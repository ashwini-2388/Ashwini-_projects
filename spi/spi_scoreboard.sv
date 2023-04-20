class spi_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(spi_scoreboard)
  
  //---------------------------------------
  //Analysis import declaration
  //---------------------------------------
  uvm_analysis_imp#(spi_seq_item, spi_scoreboard) mon_imp;
  
  spi_seq_item trans;
  
  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name,parent);
    mon_imp = new("mon_imp", this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  //---------------------------------------
  //Write function implemetation
  //---------------------------------------
  function void write(spi_seq_item trans);
   // trans.print();
    `uvm_info("APB_SCOREBOARD",$sformatf("------::RESULT:: ------"),UVM_LOW)
    `uvm_info("",$sformatf("data_in:%0h",trans.data_in),UVM_LOW)
    `uvm_info("",$sformatf("data_out:%0h ,trans.data_out),UVM_LOW)
      if(trans.data_in==trans.data_out)
         `uvm_info("APB_SCOREBOARD",$sformatf("------ ::DATA TRANSACTION FROM MASTER TO SLAVE SUCCESSFUL:: ------"),UVM_LOW)
      else
        `uvm_info("APB_SCOREBOARD",$sformatf("------ ::DATA TRANSACTION FROM MASTER TO SLAVE FAILED:: ------"),UVM_LOW)
      if(trans.data_in==trans.data_out)
        `uvm_info("APB_SCOREBOARD",$sformatf("------ ::DATA TRANSACTION FROM SLAVE TO MASTER SUCCESSFUL:: ------"),UVM_LOW)
      else
        `uvm_info("APB_SCOREBOARD",$sformatf("------ ::DATA TRANSACTION FROM SLAVE TO MASTER FAILED::------"),UVM_LOW);
  endfunction 
        
endclass
