// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_RADIX2FFT_bitNatural.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_RADIX2FFT_bitNatural
// Source Path: dsphdl.IFFT/RADIX2FFT_bitNatural
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_RADIX2FFT_bitNatural
          (clk,
           reset,
           enb_1_32_0,
           dout_7_re,
           dout_7_im,
           dout_7_vld,
           dout_re1,
           dout_im1,
           dout_vld1);


  input   clk;
  input   reset;
  input   enb_1_32_0;
  input   signed [15:0] dout_7_re;  // sfix16_En14
  input   signed [15:0] dout_7_im;  // sfix16_En14
  input   dout_7_vld;
  output  signed [15:0] dout_re1;  // sfix16_En14
  output  signed [15:0] dout_im1;  // sfix16_En14
  output  dout_vld1;


  reg [1:0] wrStateMachineBitNatural_wrState;  // ufix2
  reg [6:0] wrStateMachineBitNatural_wrAddrCnt;  // ufix7
  reg [1:0] wrStateMachineBitNatural_wrState_next;  // ufix2
  reg [6:0] wrStateMachineBitNatural_wrAddrCnt_next;  // ufix7
  reg  WrEnb;
  reg [6:0] wrAddr;  // ufix7
  reg [6:0] sampleIdx;  // ufix7
  reg [6:0] rdAddr;  // ufix7
  wire signed [15:0] memOut_im;  // sfix16_En14
  wire signed [15:0] memOut_re;  // sfix16_En14
  reg [1:0] rdStateMachineBitNatural_rdState;  // ufix2
  reg [6:0] rdStateMachineBitNatural_rdAddrCnt;  // ufix7
  reg  rdStateMachineBitNatural_doutVldReg1;
  reg  rdStateMachineBitNatural_doutVldReg2;
  reg signed [15:0] rdStateMachineBitNatural_doutReReg;  // sfix16
  reg signed [15:0] rdStateMachineBitNatural_doutImReg;  // sfix16
  reg  rdStateMachineBitNatural_startOutReg;
  reg  rdStateMachineBitNatural_endOutReg1;
  reg  rdStateMachineBitNatural_endOutReg2;
  reg [1:0] rdStateMachineBitNatural_rdState_next;  // ufix2
  reg [6:0] rdStateMachineBitNatural_rdAddrCnt_next;  // ufix7
  reg  rdStateMachineBitNatural_doutVldReg1_next;
  reg  rdStateMachineBitNatural_doutVldReg2_next;
  reg signed [15:0] rdStateMachineBitNatural_doutReReg_next;  // sfix16_En14
  reg signed [15:0] rdStateMachineBitNatural_doutImReg_next;  // sfix16_En14
  reg  rdStateMachineBitNatural_startOutReg_next;
  reg  rdStateMachineBitNatural_endOutReg1_next;
  reg  rdStateMachineBitNatural_endOutReg2_next;
  reg signed [15:0] dout_re1_1;  // sfix16_En14
  reg signed [15:0] dout_im1_1;  // sfix16_En14
  reg  dout_vld1_1;
  reg  startOutW;
  reg  endOutW;


  // wrStateMachineBitNatural
  always @(posedge clk or posedge reset)
    begin : wrStateMachineBitNatural_process
      if (reset == 1'b1) begin
        wrStateMachineBitNatural_wrState <= 2'b00;
        wrStateMachineBitNatural_wrAddrCnt <= 7'b0000000;
      end
      else begin
        if (enb_1_32_0) begin
          wrStateMachineBitNatural_wrState <= wrStateMachineBitNatural_wrState_next;
          wrStateMachineBitNatural_wrAddrCnt <= wrStateMachineBitNatural_wrAddrCnt_next;
        end
      end
    end

  always @(dout_7_vld, wrStateMachineBitNatural_wrAddrCnt,
       wrStateMachineBitNatural_wrState) begin
    wrStateMachineBitNatural_wrState_next = wrStateMachineBitNatural_wrState;
    wrStateMachineBitNatural_wrAddrCnt_next = wrStateMachineBitNatural_wrAddrCnt;
    if (wrStateMachineBitNatural_wrState == 2'b10) begin
      wrAddr = {wrStateMachineBitNatural_wrAddrCnt[0], wrStateMachineBitNatural_wrAddrCnt[1], wrStateMachineBitNatural_wrAddrCnt[2], wrStateMachineBitNatural_wrAddrCnt[3], wrStateMachineBitNatural_wrAddrCnt[4], wrStateMachineBitNatural_wrAddrCnt[5], wrStateMachineBitNatural_wrAddrCnt[6]};
    end
    else begin
      wrAddr = wrStateMachineBitNatural_wrAddrCnt;
    end
    case ( wrStateMachineBitNatural_wrState)
      2'b00 :
        begin
          if (dout_7_vld) begin
            wrStateMachineBitNatural_wrState_next = 2'b01;
            wrStateMachineBitNatural_wrAddrCnt_next = 7'b0000001;
          end
          else begin
            wrStateMachineBitNatural_wrState_next = 2'b00;
            wrStateMachineBitNatural_wrAddrCnt_next = 7'b0000000;
          end
        end
      2'b01 :
        begin
          if (dout_7_vld) begin
            if (wrStateMachineBitNatural_wrAddrCnt == 7'b1111111) begin
              wrStateMachineBitNatural_wrAddrCnt_next = 7'b0000000;
              wrStateMachineBitNatural_wrState_next = 2'b10;
            end
            else begin
              wrStateMachineBitNatural_wrAddrCnt_next = wrStateMachineBitNatural_wrAddrCnt + 7'b0000001;
              wrStateMachineBitNatural_wrState_next = 2'b01;
            end
          end
        end
      2'b10 :
        begin
          if (dout_7_vld) begin
            if (wrStateMachineBitNatural_wrAddrCnt == 7'b1111111) begin
              wrStateMachineBitNatural_wrAddrCnt_next = 7'b0000000;
              wrStateMachineBitNatural_wrState_next = 2'b01;
            end
            else begin
              wrStateMachineBitNatural_wrAddrCnt_next = wrStateMachineBitNatural_wrAddrCnt + 7'b0000001;
              wrStateMachineBitNatural_wrState_next = 2'b10;
            end
          end
        end
      default :
        begin
          wrStateMachineBitNatural_wrState_next = 2'b00;
          wrStateMachineBitNatural_wrAddrCnt_next = 7'b0000000;
        end
    endcase
    WrEnb = dout_7_vld;
    sampleIdx = wrStateMachineBitNatural_wrAddrCnt;
  end



  whdlOFDMTx_SimpleDualPortRAM_generic_block #(.AddrWidth(7),
                                               .DataWidth(16)
                                               )
                                             u_dataMEM_im_1 (.clk(clk),
                                                             .enb_1_32_0(enb_1_32_0),
                                                             .wr_din(dout_7_im),
                                                             .wr_addr(wrAddr),
                                                             .wr_en(WrEnb),
                                                             .rd_addr(rdAddr),
                                                             .rd_dout(memOut_im)
                                                             );

  whdlOFDMTx_SimpleDualPortRAM_generic_block #(.AddrWidth(7),
                                               .DataWidth(16)
                                               )
                                             u_dataMEM_re_1 (.clk(clk),
                                                             .enb_1_32_0(enb_1_32_0),
                                                             .wr_din(dout_7_re),
                                                             .wr_addr(wrAddr),
                                                             .wr_en(WrEnb),
                                                             .rd_addr(rdAddr),
                                                             .rd_dout(memOut_re)
                                                             );

  // rdStateMachineBitNatural
  always @(posedge clk or posedge reset)
    begin : rdStateMachineBitNatural_process
      if (reset == 1'b1) begin
        rdStateMachineBitNatural_rdState <= 2'b00;
        rdStateMachineBitNatural_rdAddrCnt <= 7'b0000000;
        rdStateMachineBitNatural_doutVldReg1 <= 1'b0;
        rdStateMachineBitNatural_doutVldReg2 <= 1'b0;
        rdStateMachineBitNatural_doutReReg <= 16'sb0000000000000000;
        rdStateMachineBitNatural_doutImReg <= 16'sb0000000000000000;
        rdStateMachineBitNatural_startOutReg <= 1'b0;
        rdStateMachineBitNatural_endOutReg1 <= 1'b0;
        rdStateMachineBitNatural_endOutReg2 <= 1'b0;
      end
      else begin
        if (enb_1_32_0) begin
          rdStateMachineBitNatural_rdState <= rdStateMachineBitNatural_rdState_next;
          rdStateMachineBitNatural_rdAddrCnt <= rdStateMachineBitNatural_rdAddrCnt_next;
          rdStateMachineBitNatural_doutVldReg1 <= rdStateMachineBitNatural_doutVldReg1_next;
          rdStateMachineBitNatural_doutVldReg2 <= rdStateMachineBitNatural_doutVldReg2_next;
          rdStateMachineBitNatural_doutReReg <= rdStateMachineBitNatural_doutReReg_next;
          rdStateMachineBitNatural_doutImReg <= rdStateMachineBitNatural_doutImReg_next;
          rdStateMachineBitNatural_startOutReg <= rdStateMachineBitNatural_startOutReg_next;
          rdStateMachineBitNatural_endOutReg1 <= rdStateMachineBitNatural_endOutReg1_next;
          rdStateMachineBitNatural_endOutReg2 <= rdStateMachineBitNatural_endOutReg2_next;
        end
      end
    end

  always @(memOut_im, memOut_re, rdStateMachineBitNatural_doutImReg,
       rdStateMachineBitNatural_doutReReg, rdStateMachineBitNatural_doutVldReg1,
       rdStateMachineBitNatural_doutVldReg2,
       rdStateMachineBitNatural_endOutReg1, rdStateMachineBitNatural_endOutReg2,
       rdStateMachineBitNatural_rdAddrCnt, rdStateMachineBitNatural_rdState,
       rdStateMachineBitNatural_startOutReg, sampleIdx) begin
    rdStateMachineBitNatural_rdState_next = rdStateMachineBitNatural_rdState;
    rdStateMachineBitNatural_rdAddrCnt_next = rdStateMachineBitNatural_rdAddrCnt;
    rdStateMachineBitNatural_doutReReg_next = rdStateMachineBitNatural_doutReReg;
    rdStateMachineBitNatural_doutImReg_next = rdStateMachineBitNatural_doutImReg;
    rdStateMachineBitNatural_startOutReg_next = rdStateMachineBitNatural_startOutReg;
    rdStateMachineBitNatural_endOutReg1_next = rdStateMachineBitNatural_endOutReg1;
    if (rdStateMachineBitNatural_rdState == 2'b01) begin
      rdAddr = {rdStateMachineBitNatural_rdAddrCnt[0], rdStateMachineBitNatural_rdAddrCnt[1], rdStateMachineBitNatural_rdAddrCnt[2], rdStateMachineBitNatural_rdAddrCnt[3], rdStateMachineBitNatural_rdAddrCnt[4], rdStateMachineBitNatural_rdAddrCnt[5], rdStateMachineBitNatural_rdAddrCnt[6]};
    end
    else begin
      rdAddr = rdStateMachineBitNatural_rdAddrCnt;
    end
    rdStateMachineBitNatural_endOutReg2_next = rdStateMachineBitNatural_endOutReg1;
    rdStateMachineBitNatural_startOutReg_next = rdStateMachineBitNatural_rdAddrCnt == 7'b0000001;
    case ( rdStateMachineBitNatural_rdState)
      2'b00 :
        begin
          rdStateMachineBitNatural_doutVldReg1_next = 1'b0;
          if (sampleIdx >= 7'b1101101) begin
            rdStateMachineBitNatural_rdAddrCnt_next = 7'b0000001;
            rdStateMachineBitNatural_doutVldReg1_next = 1'b1;
            rdStateMachineBitNatural_rdState_next = 2'b01;
            rdStateMachineBitNatural_endOutReg1_next = 1'b0;
          end
          else begin
            rdStateMachineBitNatural_rdAddrCnt_next = 7'b0000000;
            rdStateMachineBitNatural_rdState_next = 2'b00;
            rdStateMachineBitNatural_endOutReg1_next = 1'b0;
          end
        end
      2'b01 :
        begin
          rdStateMachineBitNatural_doutVldReg1_next = 1'b1;
          if (rdStateMachineBitNatural_rdAddrCnt == 7'b1111111) begin
            rdStateMachineBitNatural_rdAddrCnt_next = 7'b0000000;
            rdStateMachineBitNatural_rdState_next = 2'b10;
            rdStateMachineBitNatural_endOutReg1_next = 1'b1;
          end
          else begin
            rdStateMachineBitNatural_rdAddrCnt_next = rdStateMachineBitNatural_rdAddrCnt + 7'b0000001;
            rdStateMachineBitNatural_rdState_next = 2'b01;
            rdStateMachineBitNatural_endOutReg1_next = 1'b0;
          end
        end
      2'b10 :
        begin
          rdStateMachineBitNatural_doutVldReg1_next = 1'b0;
          if (sampleIdx >= 7'b1101101) begin
            rdStateMachineBitNatural_rdAddrCnt_next = 7'b0000001;
            rdStateMachineBitNatural_doutVldReg1_next = 1'b1;
            rdStateMachineBitNatural_rdState_next = 2'b11;
            rdStateMachineBitNatural_endOutReg1_next = 1'b0;
          end
          else begin
            rdStateMachineBitNatural_rdAddrCnt_next = 7'b0000000;
            rdStateMachineBitNatural_rdState_next = 2'b10;
            rdStateMachineBitNatural_endOutReg1_next = 1'b0;
          end
        end
      2'b11 :
        begin
          rdStateMachineBitNatural_doutVldReg1_next = 1'b1;
          if (rdStateMachineBitNatural_rdAddrCnt == 7'b1111111) begin
            rdStateMachineBitNatural_rdAddrCnt_next = 7'b0000000;
            rdStateMachineBitNatural_rdState_next = 2'b00;
            rdStateMachineBitNatural_endOutReg1_next = 1'b1;
          end
          else begin
            rdStateMachineBitNatural_rdAddrCnt_next = rdStateMachineBitNatural_rdAddrCnt + 7'b0000001;
            rdStateMachineBitNatural_rdState_next = 2'b11;
            rdStateMachineBitNatural_endOutReg1_next = 1'b0;
          end
        end
      default :
        begin
          rdStateMachineBitNatural_rdState_next = 2'b00;
          rdStateMachineBitNatural_rdAddrCnt_next = 7'b0000000;
          rdStateMachineBitNatural_doutVldReg1_next = 1'b0;
          rdStateMachineBitNatural_endOutReg1_next = 1'b0;
        end
    endcase
    if (rdStateMachineBitNatural_doutVldReg1) begin
      rdStateMachineBitNatural_doutReReg_next = memOut_re;
      rdStateMachineBitNatural_doutImReg_next = memOut_im;
    end
    rdStateMachineBitNatural_doutVldReg2_next = rdStateMachineBitNatural_doutVldReg1;
    dout_re1_1 = rdStateMachineBitNatural_doutReReg;
    dout_im1_1 = rdStateMachineBitNatural_doutImReg;
    dout_vld1_1 = rdStateMachineBitNatural_doutVldReg2;
    startOutW = rdStateMachineBitNatural_startOutReg;
    endOutW = rdStateMachineBitNatural_endOutReg2;
  end



  assign dout_re1 = dout_re1_1;

  assign dout_im1 = dout_im1_1;

  assign dout_vld1 = dout_vld1_1;

endmodule  // whdlOFDMTx_RADIX2FFT_bitNatural
