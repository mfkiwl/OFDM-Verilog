// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Create_Control_Bus_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Create_Control_Bus_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Create Control Bus
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Create_Control_Bus_block
          (dataIn,
           startIn,
           endIn,
           validIn,
           dataOut,
           ctrlOut_start,
           ctrlOut_end,
           ctrlOut_valid);


  input   dataIn;
  input   startIn;
  input   endIn;
  input   validIn;
  output  dataOut;
  output  ctrlOut_start;
  output  ctrlOut_end;
  output  ctrlOut_valid;


  wire Sample_Control_Bus_Creator_out1_start;
  wire Sample_Control_Bus_Creator_out1_end;
  wire Sample_Control_Bus_Creator_out1_valid;


  assign dataOut = dataIn;

  whdlOFDMTx_Sample_Control_Bus_Creator_block u_Sample_Control_Bus_Creator (.In1(startIn),
                                                                            .In2(endIn),
                                                                            .In3(validIn),
                                                                            .Out1_start(Sample_Control_Bus_Creator_out1_start),
                                                                            .Out1_end(Sample_Control_Bus_Creator_out1_end),
                                                                            .Out1_valid(Sample_Control_Bus_Creator_out1_valid)
                                                                            );

  assign ctrlOut_start = Sample_Control_Bus_Creator_out1_start;

  assign ctrlOut_end = Sample_Control_Bus_Creator_out1_end;

  assign ctrlOut_valid = Sample_Control_Bus_Creator_out1_valid;

endmodule  // whdlOFDMTx_Create_Control_Bus_block
