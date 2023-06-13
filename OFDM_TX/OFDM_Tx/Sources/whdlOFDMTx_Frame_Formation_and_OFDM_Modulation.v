// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Frame_Formation_and_OFDM_Modulation.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Frame_Formation_and_OFDM_Modulation
// Source Path: whdlOFDMTx/Frame Formation and OFDM Modulation
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Frame_Formation_and_OFDM_Modulation
          (clk,
           reset,
           enb_1_32_0,
           enb,
           enb_1_32_1,
           preambleData_re,
           preambleData_im,
           preambleValid,
           data_re,
           data_im,
           valid,
           ready,
           ofdmData_re,
           ofdmData_im,
           ofdmValid);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   enb;
  input   enb_1_32_1;
  input   signed [15:0] preambleData_re;  // sfix16_En14
  input   signed [15:0] preambleData_im;  // sfix16_En14
  input   preambleValid;
  input   signed [15:0] data_re;  // sfix16_En14
  input   signed [15:0] data_im;  // sfix16_En14
  input   valid;
  input   ready;
  output  signed [15:0] ofdmData_re;  // sfix16_En14
  output  signed [15:0] ofdmData_im;  // sfix16_En14
  output  ofdmValid;


  wire signed [15:0] Generate_RAM_Inputs_out1_re;  // sfix16_En14
  wire signed [15:0] Generate_RAM_Inputs_out1_im;  // sfix16_En14
  wire [11:0] Generate_RAM_Inputs_out2;  // ufix12
  wire Generate_RAM_Inputs_out3;
  wire signed [15:0] constant_out1_re;  // sfix16_En14
  wire signed [15:0] constant_out1_im;  // sfix16_En14
  reg  Downsample_bypass_reg;  // ufix1
  wire Downsample_out1;
  wire Data_Type_Conversion_out1;
  wire ready_1;
  reg  Delay3_out1;
  wire [11:0] Generate_OFDM_Modulator_Valid_out1;  // ufix12
  wire Generate_OFDM_Modulator_Valid_out2;
  wire signed [15:0] Dual_Rate_RAM_out1_re;  // sfix16_En14
  wire signed [15:0] Dual_Rate_RAM_out1_im;  // sfix16_En14
  wire signed [15:0] Dual_Rate_RAM_out2_re;  // sfix16_En14
  wire signed [15:0] Dual_Rate_RAM_out2_im;  // sfix16_En14
  wire signed [15:0] data_re_1;  // sfix16_En14
  wire signed [15:0] data_im_1;  // sfix16_En14
  wire valid_1;
  wire signed [15:0] Make_OFDM_Valid_Continuous_out1_re;  // sfix16_En14
  wire signed [15:0] Make_OFDM_Valid_Continuous_out1_im;  // sfix16_En14
  wire Make_OFDM_Valid_Continuous_out2;

  // ofdmModIn, ofdmModInValid, ofdmData, and ofdmValid signals output few extra samples than expected. 
  // Discard the extra samples at the end and use the remaining samples for validation.
  // din_B port is not used, so fed with zeros.
  // we_B port enables to read data from the dout_B port, so we_B port is set to 'false'.
  // The constant block is used to provide inputs to din_B and we_B ports to inherit sample time from the addr_B port.
  // Downsample from 61.44 MHz to 1.92 MHz. The OFDM Modulator block runs at 1.92 MHz.
  // The Dual Rate RAM block stores one frame of signals.


  whdlOFDMTx_Generate_RAM_Inputs u_Generate_RAM_Inputs (.clk(clk),
                                                        .reset(reset),
                                                        .enb(enb),
                                                        .preambleData_re(preambleData_re),  // sfix16_En14
                                                        .preambleData_im(preambleData_im),  // sfix16_En14
                                                        .enb_1(preambleValid),
                                                        .data_re(data_re),  // sfix16_En14
                                                        .data_im(data_im),  // sfix16_En14
                                                        .valid(valid),
                                                        .RAMData_re(Generate_RAM_Inputs_out1_re),  // sfix16_En14
                                                        .RAMData_im(Generate_RAM_Inputs_out1_im),  // sfix16_En14
                                                        .RAMAddress(Generate_RAM_Inputs_out2),  // ufix12
                                                        .RAMValid(Generate_RAM_Inputs_out3)
                                                        );

  assign constant_out1_re = 16'sb0000000000000000;
  assign constant_out1_im = 16'sb0000000000000000;



  // Downsample: Downsample by 32, Sample offset 0 
  // Downsample bypass register
  always @(posedge clk or posedge reset)
    begin : Downsample_bypass_process
      if (reset == 1'b1) begin
        Downsample_bypass_reg <= 1'b0;
      end
      else begin
        if (enb_1_32_1) begin
          Downsample_bypass_reg <= ready;
        end
      end
    end

  assign Downsample_out1 = (enb_1_32_1 == 1'b1 ? ready :
              Downsample_bypass_reg);



  assign Data_Type_Conversion_out1 = (constant_out1_re != 16'sb0000000000000000 ? 1'b1 :
              1'b0);



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          Delay3_out1 <= ready_1;
        end
      end
    end



  whdlOFDMTx_Generate_OFDM_Modulator_Valid u_Generate_OFDM_Modulator_Valid (.clk(clk),
                                                                            .reset(reset),
                                                                            .enb_1_32_0(enb_1_32_0),
                                                                            .generatedReady(Downsample_out1),
                                                                            .ofdmModReady(Delay3_out1),
                                                                            .RAMAddress(Generate_OFDM_Modulator_Valid_out1),  // ufix12
                                                                            .ofdmModValid(Generate_OFDM_Modulator_Valid_out2)
                                                                            );

  whdlOFDMTx_DualRateDualPortRAM_generic #(.AddrWidth(12),
                                           .DataWidth(16)
                                           )
                                         u_Dual_Rate_RAM (.clk(clk),
                                                          .enb_1_32_0(enb_1_32_0),
                                                          .enb(enb),
                                                          .din_A_re(Generate_RAM_Inputs_out1_re),
                                                          .din_A_im(Generate_RAM_Inputs_out1_im),
                                                          .addr_A(Generate_RAM_Inputs_out2),
                                                          .we_A(Generate_RAM_Inputs_out3),
                                                          .din_B_re(constant_out1_re),
                                                          .din_B_im(constant_out1_im),
                                                          .addr_B(Generate_OFDM_Modulator_Valid_out1),
                                                          .we_B(Data_Type_Conversion_out1),
                                                          .doutA_re(Dual_Rate_RAM_out1_re),
                                                          .doutA_im(Dual_Rate_RAM_out1_im),
                                                          .doutB_re(Dual_Rate_RAM_out2_re),
                                                          .doutB_im(Dual_Rate_RAM_out2_im)
                                                          );

  whdlOFDMTx_OFDM_Modulator u_OFDM_Modulator (.clk(clk),
                                              .reset(reset),
                                              .enb_1_32_0(enb_1_32_0),
                                              .data_re(Dual_Rate_RAM_out2_re),  // sfix16_En14
                                              .data_im(Dual_Rate_RAM_out2_im),  // sfix16_En14
                                              .valid(Generate_OFDM_Modulator_Valid_out2),
                                              .data1_re(data_re_1),  // sfix16_En14
                                              .data1_im(data_im_1),  // sfix16_En14
                                              .valid1(valid_1),
                                              .ready(ready_1)
                                              );

  whdlOFDMTx_Make_OFDM_Valid_Continuous u_Make_OFDM_Valid_Continuous (.clk(clk),
                                                                      .reset(reset),
                                                                      .enb_1_32_0(enb_1_32_0),
                                                                      .dataIn_re(data_re_1),  // sfix16_En14
                                                                      .dataIn_im(data_im_1),  // sfix16_En14
                                                                      .validIn(valid_1),
                                                                      .ofdmData_re(Make_OFDM_Valid_Continuous_out1_re),  // sfix16_En14
                                                                      .ofdmData_im(Make_OFDM_Valid_Continuous_out1_im),  // sfix16_En14
                                                                      .ofdmValid(Make_OFDM_Valid_Continuous_out2)
                                                                      );

  assign ofdmData_re = Make_OFDM_Valid_Continuous_out1_re;

  assign ofdmData_im = Make_OFDM_Valid_Continuous_out1_im;

  assign ofdmValid = Make_OFDM_Valid_Continuous_out2;

endmodule  // whdlOFDMTx_Frame_Formation_and_OFDM_Modulation
