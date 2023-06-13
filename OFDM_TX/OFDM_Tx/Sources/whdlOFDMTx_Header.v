// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Header.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Header
// Source Path: whdlOFDMTx/Frame Generator/Header
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Header
          (clk,
           reset,
           enb,
           enb_1_2_0,
           headerSet,
           modTypeIndex,
           codeRateIndex,
           fftLenIndex,
           header_re,
           header_im,
           headerValid);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1_2_0;
  input   headerSet;
  input   [1:0] modTypeIndex;  // ufix2
  input   [1:0] codeRateIndex;  // ufix2
  input   [2:0] fftLenIndex;  // ufix3
  output  signed [15:0] header_re;  // sfix16_En14
  output  signed [15:0] header_im;  // sfix16_En14
  output  headerValid;


  wire headerBits;
  wire startOut;
  wire endOut;
  wire validOut;
  wire General_CRC_Generator_HDL_Optimized_out1;
  wire General_CRC_Generator_HDL_Optimized_out2;
  wire General_CRC_Generator_HDL_Optimized_out3;
  wire General_CRC_Generator_HDL_Optimized_out4;
  wire Create_Control_Bus_out1;
  wire Create_Control_Bus_out2_start;
  wire Create_Control_Bus_out2_end;
  wire Create_Control_Bus_out2_valid;
  wire Convolutional_Encoder_out1_0;
  wire Convolutional_Encoder_out1_1;
  wire Convolutional_Encoder_out2_start;
  wire Convolutional_Encoder_out2_end;
  wire Convolutional_Encoder_out2_valid;
  wire Serializer_out1;
  wire Serializer_out2;
  wire Serializer_out3;
  wire Serializer_out4;
  wire Interleaver_out1;
  wire Interleaver_out4;
  wire signed [15:0] data_re;  // sfix16_En14
  wire signed [15:0] data_im;  // sfix16_En14
  wire valid;

  // Header bits are formed based on input modTypeIndex, codeRateIndex, and fftLenIndex values. Header bits are then 
  // processed through Header chain as shown below


  whdlOFDMTx_Header_Formation u_Header_Formation (.clk(clk),
                                                  .reset(reset),
                                                  .enb_1_2_0(enb_1_2_0),
                                                  .modType(modTypeIndex),  // ufix2
                                                  .codeRate(codeRateIndex),  // ufix2
                                                  .fftLen(fftLenIndex),  // ufix3
                                                  .validIn(headerSet),
                                                  .headerBits(headerBits),
                                                  .startOut(startOut),
                                                  .endOut(endOut),
                                                  .validOut(validOut)
                                                  );

  whdlOFDMTx_General_CRC_Generator_HDL_Optimized_block u_General_CRC_Generator_HDL_Optimized (.clk(clk),
                                                                                              .reset(reset),
                                                                                              .enb_1_2_0(enb_1_2_0),
                                                                                              .dataIn(headerBits),
                                                                                              .startIn(startOut),
                                                                                              .endIn(endOut),
                                                                                              .validIn(validOut),
                                                                                              .dataOut(General_CRC_Generator_HDL_Optimized_out1),
                                                                                              .startOut(General_CRC_Generator_HDL_Optimized_out2),
                                                                                              .endOut(General_CRC_Generator_HDL_Optimized_out3),
                                                                                              .validOut(General_CRC_Generator_HDL_Optimized_out4)
                                                                                              );

  whdlOFDMTx_Create_Control_Bus_block u_Create_Control_Bus (.dataIn(General_CRC_Generator_HDL_Optimized_out1),
                                                            .startIn(General_CRC_Generator_HDL_Optimized_out2),
                                                            .endIn(General_CRC_Generator_HDL_Optimized_out3),
                                                            .validIn(General_CRC_Generator_HDL_Optimized_out4),
                                                            .dataOut(Create_Control_Bus_out1),
                                                            .ctrlOut_start(Create_Control_Bus_out2_start),
                                                            .ctrlOut_end(Create_Control_Bus_out2_end),
                                                            .ctrlOut_valid(Create_Control_Bus_out2_valid)
                                                            );

  whdlOFDMTx_Convolutional_Encoder_block u_Convolutional_Encoder (.clk(clk),
                                                                  .reset(reset),
                                                                  .enb_1_2_0(enb_1_2_0),
                                                                  .in0(Create_Control_Bus_out1),
                                                                  .in1_start(Create_Control_Bus_out2_start),
                                                                  .in1_end(Create_Control_Bus_out2_end),
                                                                  .in1_valid(Create_Control_Bus_out2_valid),
                                                                  .out0_0(Convolutional_Encoder_out1_0),
                                                                  .out0_1(Convolutional_Encoder_out1_1),
                                                                  .out1_start(Convolutional_Encoder_out2_start),
                                                                  .out1_end(Convolutional_Encoder_out2_end),
                                                                  .out1_valid(Convolutional_Encoder_out2_valid)
                                                                  );

  whdlOFDMTx_Serializer u_Serializer (.clk(clk),
                                      .reset(reset),
                                      .enb(enb),
                                      .parallelIn_0(Convolutional_Encoder_out1_0),  // boolean
                                      .parallelIn_1(Convolutional_Encoder_out1_1),  // boolean
                                      .ctrlIn_start(Convolutional_Encoder_out2_start),
                                      .ctrlIn_end(Convolutional_Encoder_out2_end),
                                      .ctrlIn_valid(Convolutional_Encoder_out2_valid),
                                      .serialOut(Serializer_out1),
                                      .startOut(Serializer_out2),
                                      .endOut(Serializer_out3),
                                      .ValidOut(Serializer_out4)
                                      );

  whdlOFDMTx_Interleaver_block u_Interleaver (.clk(clk),
                                              .reset(reset),
                                              .enb(enb),
                                              .dataIn(Serializer_out1),
                                              .startIn(Serializer_out2),
                                              .endIn(Serializer_out3),
                                              .validIn(Serializer_out4),
                                              .dataOut(Interleaver_out1),
                                              .validOut(Interleaver_out4)
                                              );

  whdlOFDMTx_LTE_Symbol_Modulator_block u_LTE_Symbol_Modulator (.clk(clk),
                                                                .reset(reset),
                                                                .enb(enb),
                                                                .data(Interleaver_out1),
                                                                .valid(Interleaver_out4),
                                                                .data1_re(data_re),  // sfix16_En14
                                                                .data1_im(data_im),  // sfix16_En14
                                                                .valid1(valid)
                                                                );

  assign header_re = data_re;

  assign header_im = data_im;

  assign headerValid = valid;

endmodule  // whdlOFDMTx_Header
