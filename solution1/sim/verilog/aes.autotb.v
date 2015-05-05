// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.1
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ==============================================================

 `timescale 1ns/1ps


`define AUTOTB_DUT      aes
`define AUTOTB_DUT_INST AESL_inst_aes
`define AUTOTB_TOP      apatb_aes_top
`define AUTOTB_LAT_RESULT_FILE "aes.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "aes.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_aes_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_TRANSACTION_NUM  1
`define AUTOTB_CLOCK_PERIOD 10.000000
`define LENGTH_m_mm2s_ctl 500
`define LENGTH_m_s2mm_ctl 500
`define LENGTH_sourceAddress 1
`define LENGTH_key_in_V 1
`define LENGTH_destinationAddress 1
`define LENGTH_length_r 1
`define LENGTH_finished 1
`define LENGTH_s_in_V 1000
`define LENGTH_s_out_V 1000

`define	AESL_BUS_m_mm2s_ctl AESL_autobus_m_mm2s_ctl
`define	AESL_BUS_INST_m_mm2s_ctl bus_inst_m_mm2s_ctl
`define	AESL_BUS_m_s2mm_ctl AESL_autobus_m_s2mm_ctl
`define	AESL_BUS_INST_m_s2mm_ctl bus_inst_m_s2mm_ctl
`define   AESL_DEPTH_sourceAddress 1
`define   AESL_DEPTH_key_in_V 1
`define   AESL_DEPTH_destinationAddress 1
`define   AESL_DEPTH_length_r 1
`define   AESL_DEPTH_finished 1
`define   AESL_DEPTH_s_in_V 1
`define   AESL_DEPTH_s_out_V 1
`define AUTOTB_TVIN_m_mm2s_ctl  "../tv/cdatafile/c.aes.autotvin_m_mm2s_ctl.dat"
`define AUTOTB_TVIN_m_s2mm_ctl  "../tv/cdatafile/c.aes.autotvin_m_s2mm_ctl.dat"
`define AUTOTB_TVIN_sourceAddress  "../tv/cdatafile/c.aes.autotvin_sourceAddress.dat"
`define AUTOTB_TVIN_key_in_V  "../tv/cdatafile/c.aes.autotvin_key_in_V.dat"
`define AUTOTB_TVIN_destinationAddress  "../tv/cdatafile/c.aes.autotvin_destinationAddress.dat"
`define AUTOTB_TVIN_length_r  "../tv/cdatafile/c.aes.autotvin_length_r.dat"
`define AUTOTB_TVIN_s_in_V  "../tv/cdatafile/c.aes.autotvin_s_in_V.dat"
`define AUTOTB_TVIN_s_out_V  "../tv/cdatafile/c.aes.autotvin_s_out_V.dat"
`define AUTOTB_TVIN_m_mm2s_ctl_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_m_mm2s_ctl.dat"
`define AUTOTB_TVIN_m_s2mm_ctl_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_m_s2mm_ctl.dat"
`define AUTOTB_TVIN_sourceAddress_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_sourceAddress.dat"
`define AUTOTB_TVIN_key_in_V_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_key_in_V.dat"
`define AUTOTB_TVIN_destinationAddress_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_destinationAddress.dat"
`define AUTOTB_TVIN_length_r_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_length_r.dat"
`define AUTOTB_TVIN_s_in_V_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_s_in_V.dat"
`define AUTOTB_TVIN_s_out_V_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvin_s_out_V.dat"
`define AUTOTB_TVOUT_m_mm2s_ctl  "../tv/cdatafile/c.aes.autotvout_m_mm2s_ctl.dat"
`define AUTOTB_TVOUT_m_s2mm_ctl  "../tv/cdatafile/c.aes.autotvout_m_s2mm_ctl.dat"
`define AUTOTB_TVOUT_finished  "../tv/cdatafile/c.aes.autotvout_finished.dat"
`define AUTOTB_TVOUT_s_out_V  "../tv/cdatafile/c.aes.autotvout_s_out_V.dat"
`define AUTOTB_TVOUT_m_mm2s_ctl_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvout_m_mm2s_ctl.dat"
`define AUTOTB_TVOUT_m_s2mm_ctl_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvout_m_s2mm_ctl.dat"
`define AUTOTB_TVOUT_finished_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvout_finished.dat"
`define AUTOTB_TVOUT_s_out_V_out_wrapc  "../tv/rtldatafile/rtl.aes.autotvout_s_out_V.dat"

module `AUTOTB_TOP;
task read_token;
    input integer fp;
    output reg [279 : 0] token;
    reg [7:0] c;
    reg intoken;
    reg done;
    begin
        token = "";
        intoken = 0;
        done = 0;
        while (!done) begin
            c = $fgetc(fp);
            if (c == 8'hff) begin   // EOF
                done = 1;
            end
            else if (c == " " || c == "\011" || c == "\012" || c == "\015") begin   // blank
                if (intoken) begin
                    done = 1;
                end
            end
            else begin              // valid character
                intoken = 1;
                token = (token << 8) | c;
            end
        end
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
reg [31 : 0] AESL_mLatCnterIn [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterIn_addr;
reg [31 : 0] AESL_mLatCnterOut [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterOut_addr ;
reg [31 : 0] AESL_clk_counter ;
wire ap_clk;
wire ap_rst_n;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire  m_mm2s_ctl_req_din;
wire  m_mm2s_ctl_req_full_n;
wire  m_mm2s_ctl_req_write;
wire  m_mm2s_ctl_rsp_empty_n;
wire  m_mm2s_ctl_rsp_read;
wire [31 : 0] m_mm2s_ctl_address;
wire [31 : 0] m_mm2s_ctl_datain;
wire [31 : 0] m_mm2s_ctl_dataout;
wire [31 : 0] m_mm2s_ctl_size;
wire  m_s2mm_ctl_req_din;
wire  m_s2mm_ctl_req_full_n;
wire  m_s2mm_ctl_req_write;
wire  m_s2mm_ctl_rsp_empty_n;
wire  m_s2mm_ctl_rsp_read;
wire [31 : 0] m_s2mm_ctl_address;
wire [31 : 0] m_s2mm_ctl_datain;
wire [31 : 0] m_s2mm_ctl_dataout;
wire [31 : 0] m_s2mm_ctl_size;
wire [31 : 0] sourceAddress;
wire  sourceAddress_ap_vld;
wire [127 : 0] key_in_V;
wire  key_in_V_ap_vld;
wire [31 : 0] destinationAddress;
wire  destinationAddress_ap_vld;
wire [31 : 0] length_r;
wire  length_r_ap_vld;
wire  finished;
wire  finished_ap_ack;
wire [127 : 0] s_in_V_TDATA;
wire  s_in_V_TVALID;
wire  s_in_V_TREADY;
wire [127 : 0] s_out_V_TDATA;
wire  s_out_V_TVALID;
wire  s_out_V_TREADY;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

`AUTOTB_DUT `AUTOTB_DUT_INST(
.ap_clk(ap_clk),
.ap_rst_n(ap_rst_n),
.ap_start(ap_start),
.ap_done(ap_done),
.ap_idle(ap_idle),
.ap_ready(ap_ready),
.m_mm2s_ctl_req_din(m_mm2s_ctl_req_din),
.m_mm2s_ctl_req_full_n(m_mm2s_ctl_req_full_n),
.m_mm2s_ctl_req_write(m_mm2s_ctl_req_write),
.m_mm2s_ctl_rsp_empty_n(m_mm2s_ctl_rsp_empty_n),
.m_mm2s_ctl_rsp_read(m_mm2s_ctl_rsp_read),
.m_mm2s_ctl_address(m_mm2s_ctl_address),
.m_mm2s_ctl_datain(m_mm2s_ctl_datain),
.m_mm2s_ctl_dataout(m_mm2s_ctl_dataout),
.m_mm2s_ctl_size(m_mm2s_ctl_size),
.m_s2mm_ctl_req_din(m_s2mm_ctl_req_din),
.m_s2mm_ctl_req_full_n(m_s2mm_ctl_req_full_n),
.m_s2mm_ctl_req_write(m_s2mm_ctl_req_write),
.m_s2mm_ctl_rsp_empty_n(m_s2mm_ctl_rsp_empty_n),
.m_s2mm_ctl_rsp_read(m_s2mm_ctl_rsp_read),
.m_s2mm_ctl_address(m_s2mm_ctl_address),
.m_s2mm_ctl_datain(m_s2mm_ctl_datain),
.m_s2mm_ctl_dataout(m_s2mm_ctl_dataout),
.m_s2mm_ctl_size(m_s2mm_ctl_size),
.sourceAddress(sourceAddress),
.sourceAddress_ap_vld(sourceAddress_ap_vld),
.key_in_V(key_in_V),
.key_in_V_ap_vld(key_in_V_ap_vld),
.destinationAddress(destinationAddress),
.destinationAddress_ap_vld(destinationAddress_ap_vld),
.length_r(length_r),
.length_r_ap_vld(length_r_ap_vld),
.finished(finished),
.finished_ap_ack(finished_ap_ack),
.s_in_V_TDATA(s_in_V_TDATA),
.s_in_V_TVALID(s_in_V_TVALID),
.s_in_V_TREADY(s_in_V_TREADY),
.s_out_V_TDATA(s_out_V_TDATA),
.s_out_V_TVALID(s_out_V_TVALID),
.s_out_V_TREADY(s_out_V_TREADY)
);

// Assignment for control signal
  assign ap_clk = AESL_clock;
  assign ap_rst_n = AESL_reset;
  assign ap_rst_n_n = ~AESL_reset;
  assign AESL_reset = rst;
  assign ap_start = AESL_start;
  assign AESL_start = start;
  assign AESL_done = ap_done;
  assign AESL_idle = ap_idle;
  assign AESL_ready = ap_ready;
  assign AESL_ce = ce;
  assign AESL_continue = continue;
//------------------------Busm_mm2s_ctl Interface Instantiation--------------

// The input and output of busm_mm2s_ctl
wire	bus_m_mm2s_ctl_req_RW;
wire	bus_m_mm2s_ctl_req_full_n;
wire	bus_m_mm2s_ctl_req_RW_en;
wire	bus_m_mm2s_ctl_rsp_empty_n;
wire	bus_m_mm2s_ctl_rsp_read;
wire	[31 : 0]	bus_m_mm2s_ctl_address;
wire	[31 : 0]	bus_m_mm2s_ctl_din;
wire	[31 : 0]	bus_m_mm2s_ctl_dout;
wire	[31 : 0]	bus_m_mm2s_ctl_size;
wire	bus_m_mm2s_ctl_ready;
wire	bus_m_mm2s_ctl_done;

`AESL_BUS_m_mm2s_ctl `AESL_BUS_INST_m_mm2s_ctl(
    .clk	    (AESL_clock),
    .rst	    (AESL_reset),
    .bus_req_RW	    (bus_m_mm2s_ctl_req_RW),
    .bus_req_full_n (bus_m_mm2s_ctl_req_full_n),
    .bus_req_RW_en  (bus_m_mm2s_ctl_req_RW_en),
    .bus_rsp_empty_n(bus_m_mm2s_ctl_rsp_empty_n),
    .bus_rsp_read   (bus_m_mm2s_ctl_rsp_read),
    .bus_address    (bus_m_mm2s_ctl_address),
    .bus_din	    (bus_m_mm2s_ctl_din),
    .bus_dout	    (bus_m_mm2s_ctl_dout),
    .bus_size	    (bus_m_mm2s_ctl_size),
    .ready	    (bus_m_mm2s_ctl_ready),
    .done	    (bus_m_mm2s_ctl_done)
);

// Assignment between dut and bus m_mm2s_ctl

// Assign input of bus m_mm2s_ctl
assign  bus_m_mm2s_ctl_req_RW	=   m_mm2s_ctl_req_din;
assign  bus_m_mm2s_ctl_req_RW_en	=   m_mm2s_ctl_req_write & m_mm2s_ctl_req_full_n;
assign	bus_m_mm2s_ctl_rsp_read	=   m_mm2s_ctl_rsp_read & m_mm2s_ctl_rsp_empty_n;
assign	bus_m_mm2s_ctl_address	=   m_mm2s_ctl_address;
assign  bus_m_mm2s_ctl_din		=   m_mm2s_ctl_dataout;
assign  bus_m_mm2s_ctl_size	=   m_mm2s_ctl_size;
assign	bus_m_mm2s_ctl_ready	=   ready;
assign	bus_m_mm2s_ctl_done	=   AESL_done_delay;
// Assign input of dut
assign	m_mm2s_ctl_datain	=   bus_m_mm2s_ctl_dout;
reg   reg_bus_m_mm2s_ctl_req_full_n;
initial begin : gen_reg_bus_m_mm2s_ctl_req_full_n_process
    integer rand;
    reg_bus_m_mm2s_ctl_req_full_n = 0;
    while(1)
    begin
        @(bus_m_mm2s_ctl_req_full_n);
        if(bus_m_mm2s_ctl_req_full_n === 1)
        begin
        end
        reg_bus_m_mm2s_ctl_req_full_n = bus_m_mm2s_ctl_req_full_n;
    end
end

assign    m_mm2s_ctl_req_full_n    =   reg_bus_m_mm2s_ctl_req_full_n;
reg   reg_bus_m_mm2s_ctl_rsp_empty_n;
initial begin : gen_reg_bus_m_mm2s_ctl_rsp_empty_n_process
    integer rand;
    reg_bus_m_mm2s_ctl_rsp_empty_n = 0;
    while(1)
    begin
        @(bus_m_mm2s_ctl_rsp_empty_n);
        if(bus_m_mm2s_ctl_rsp_empty_n === 1)
        begin
        end
        reg_bus_m_mm2s_ctl_rsp_empty_n = bus_m_mm2s_ctl_rsp_empty_n;
    end
end

assign      m_mm2s_ctl_rsp_empty_n    =   reg_bus_m_mm2s_ctl_rsp_empty_n;


//------------------------Busm_s2mm_ctl Interface Instantiation--------------

// The input and output of busm_s2mm_ctl
wire	bus_m_s2mm_ctl_req_RW;
wire	bus_m_s2mm_ctl_req_full_n;
wire	bus_m_s2mm_ctl_req_RW_en;
wire	bus_m_s2mm_ctl_rsp_empty_n;
wire	bus_m_s2mm_ctl_rsp_read;
wire	[31 : 0]	bus_m_s2mm_ctl_address;
wire	[31 : 0]	bus_m_s2mm_ctl_din;
wire	[31 : 0]	bus_m_s2mm_ctl_dout;
wire	[31 : 0]	bus_m_s2mm_ctl_size;
wire	bus_m_s2mm_ctl_ready;
wire	bus_m_s2mm_ctl_done;

`AESL_BUS_m_s2mm_ctl `AESL_BUS_INST_m_s2mm_ctl(
    .clk	    (AESL_clock),
    .rst	    (AESL_reset),
    .bus_req_RW	    (bus_m_s2mm_ctl_req_RW),
    .bus_req_full_n (bus_m_s2mm_ctl_req_full_n),
    .bus_req_RW_en  (bus_m_s2mm_ctl_req_RW_en),
    .bus_rsp_empty_n(bus_m_s2mm_ctl_rsp_empty_n),
    .bus_rsp_read   (bus_m_s2mm_ctl_rsp_read),
    .bus_address    (bus_m_s2mm_ctl_address),
    .bus_din	    (bus_m_s2mm_ctl_din),
    .bus_dout	    (bus_m_s2mm_ctl_dout),
    .bus_size	    (bus_m_s2mm_ctl_size),
    .ready	    (bus_m_s2mm_ctl_ready),
    .done	    (bus_m_s2mm_ctl_done)
);

// Assignment between dut and bus m_s2mm_ctl

// Assign input of bus m_s2mm_ctl
assign  bus_m_s2mm_ctl_req_RW	=   m_s2mm_ctl_req_din;
assign  bus_m_s2mm_ctl_req_RW_en	=   m_s2mm_ctl_req_write & m_s2mm_ctl_req_full_n;
assign	bus_m_s2mm_ctl_rsp_read	=   m_s2mm_ctl_rsp_read & m_s2mm_ctl_rsp_empty_n;
assign	bus_m_s2mm_ctl_address	=   m_s2mm_ctl_address;
assign  bus_m_s2mm_ctl_din		=   m_s2mm_ctl_dataout;
assign  bus_m_s2mm_ctl_size	=   m_s2mm_ctl_size;
assign	bus_m_s2mm_ctl_ready	=   ready;
assign	bus_m_s2mm_ctl_done	=   AESL_done_delay;
// Assign input of dut
assign	m_s2mm_ctl_datain	=   bus_m_s2mm_ctl_dout;
reg   reg_bus_m_s2mm_ctl_req_full_n;
initial begin : gen_reg_bus_m_s2mm_ctl_req_full_n_process
    integer rand;
    reg_bus_m_s2mm_ctl_req_full_n = 0;
    while(1)
    begin
        @(bus_m_s2mm_ctl_req_full_n);
        if(bus_m_s2mm_ctl_req_full_n === 1)
        begin
        end
        reg_bus_m_s2mm_ctl_req_full_n = bus_m_s2mm_ctl_req_full_n;
    end
end

assign    m_s2mm_ctl_req_full_n    =   reg_bus_m_s2mm_ctl_req_full_n;
reg   reg_bus_m_s2mm_ctl_rsp_empty_n;
initial begin : gen_reg_bus_m_s2mm_ctl_rsp_empty_n_process
    integer rand;
    reg_bus_m_s2mm_ctl_rsp_empty_n = 0;
    while(1)
    begin
        @(bus_m_s2mm_ctl_rsp_empty_n);
        if(bus_m_s2mm_ctl_rsp_empty_n === 1)
        begin
        end
        reg_bus_m_s2mm_ctl_rsp_empty_n = bus_m_s2mm_ctl_rsp_empty_n;
    end
end

assign      m_s2mm_ctl_rsp_empty_n    =   reg_bus_m_s2mm_ctl_rsp_empty_n;


reg AESL_REG_sourceAddress_ap_vld;
// The signal of port sourceAddress
reg [31: 0] AESL_REG_sourceAddress = 0;
assign sourceAddress = AESL_REG_sourceAddress;
assign sourceAddress_ap_vld = AESL_REG_sourceAddress_ap_vld;
initial begin : read_file_process_sourceAddress
    integer fp;
    integer err;
    integer ret;
    integer rand;
    reg [279  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_sourceAddress_ap_vld <= 0;
    wait(AESL_reset === 1);
    fp = $fopen(`AUTOTB_TVIN_sourceAddress,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_sourceAddress);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin // Illegal format
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
	          $finish;
        end
        read_token(fp, token);  // skip transaction number
	      read_token(fp, token);
            @(posedge AESL_clock);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_sourceAddress_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_sourceAddress);
	          if (ret != 1) begin
	              $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
	              $finish;
	          end
	          read_token(fp, token);
        end
	      read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_sourceAddress_ap_vld <= 1;
end


reg AESL_REG_key_in_V_ap_vld;
// The signal of port key_in_V
reg [127: 0] AESL_REG_key_in_V = 0;
assign key_in_V = AESL_REG_key_in_V;
assign key_in_V_ap_vld = AESL_REG_key_in_V_ap_vld;
initial begin : read_file_process_key_in_V
    integer fp;
    integer err;
    integer ret;
    integer rand;
    reg [279  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_key_in_V_ap_vld <= 0;
    wait(AESL_reset === 1);
    fp = $fopen(`AUTOTB_TVIN_key_in_V,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_key_in_V);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin // Illegal format
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
	          $finish;
        end
        read_token(fp, token);  // skip transaction number
	      read_token(fp, token);
            @(posedge AESL_clock);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_key_in_V_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_key_in_V);
	          if (ret != 1) begin
	              $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
	              $finish;
	          end
	          read_token(fp, token);
        end
	      read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_key_in_V_ap_vld <= 1;
end


reg AESL_REG_destinationAddress_ap_vld;
// The signal of port destinationAddress
reg [31: 0] AESL_REG_destinationAddress = 0;
assign destinationAddress = AESL_REG_destinationAddress;
assign destinationAddress_ap_vld = AESL_REG_destinationAddress_ap_vld;
initial begin : read_file_process_destinationAddress
    integer fp;
    integer err;
    integer ret;
    integer rand;
    reg [279  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_destinationAddress_ap_vld <= 0;
    wait(AESL_reset === 1);
    fp = $fopen(`AUTOTB_TVIN_destinationAddress,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_destinationAddress);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin // Illegal format
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
	          $finish;
        end
        read_token(fp, token);  // skip transaction number
	      read_token(fp, token);
            @(posedge AESL_clock);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_destinationAddress_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_destinationAddress);
	          if (ret != 1) begin
	              $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
	              $finish;
	          end
	          read_token(fp, token);
        end
	      read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_destinationAddress_ap_vld <= 1;
end


reg AESL_REG_length_r_ap_vld;
// The signal of port length_r
reg [31: 0] AESL_REG_length_r = 0;
assign length_r = AESL_REG_length_r;
assign length_r_ap_vld = AESL_REG_length_r_ap_vld;
initial begin : read_file_process_length_r
    integer fp;
    integer err;
    integer ret;
    integer rand;
    reg [279  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_length_r_ap_vld <= 0;
    wait(AESL_reset === 1);
    fp = $fopen(`AUTOTB_TVIN_length_r,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_length_r);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin // Illegal format
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
	          $finish;
        end
        read_token(fp, token);  // skip transaction number
	      read_token(fp, token);
            @(posedge AESL_clock);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_length_r_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_length_r);
	          if (ret != 1) begin
	              $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
	              $finish;
	          end
	          read_token(fp, token);
        end
	      read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_length_r_ap_vld <= 1;
end


reg AESL_REG_finished_ap_ack = 0;
// The signal of port finished
reg [0: 0] AESL_REG_finished = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
        AESL_REG_finished = 0; 
    else
        AESL_REG_finished <= finished;
end 
assign finished_ap_ack = 1;

initial begin : write_file_process_finished
    integer fp;
    integer fp_size;
    integer err;
    integer ret;
    integer i;
    integer hls_stream_size;
    integer rand;
    integer finished_count;
    reg [279  : 0] token;
    integer transaction_idx;
    reg [ 8*5 : 1] str;
    wait(AESL_reset === 1);
    fp = $fopen(`AUTOTB_TVOUT_finished_out_wrapc,"w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_finished_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    transaction_idx = 0;
    while (transaction_idx != `AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
	      while(AESL_done !== 1) begin
	          @(posedge AESL_clock);
	      end
        # 0.4;
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
	      $fdisplay(fp,"0x%x", AESL_REG_finished);
    transaction_idx = transaction_idx + 1;
	  $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end




wire s_in_V_ready;
wire s_in_V_done;
  AESL_axi_s_s_in_V AESL_AXI_S_s_in_V(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_s_in_V_TDATA (s_in_V_TDATA),
    .TRAN_s_in_V_TVALID (s_in_V_TVALID),
    .TRAN_s_in_V_TREADY (s_in_V_TREADY),
    .ready (s_in_V_ready),
    .done  (s_in_V_done)
);
assign    s_in_V_ready   =   ready;
assign    s_in_V_done    =   0;
wire s_out_V_ready;
wire s_out_V_done;
  AESL_axi_s_s_out_V AESL_AXI_S_s_out_V(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_s_out_V_TDATA (s_out_V_TDATA),
    .TRAN_s_out_V_TVALID (s_out_V_TVALID),
    .TRAN_s_out_V_TREADY (s_out_V_TREADY),
    .ready (s_out_V_ready),
    .done  (s_out_V_done)
);
assign    s_out_V_ready   =   0;
assign    s_out_V_done    =   AESL_done_delay;

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

initial begin : generate_ready_cnt_proc
    ready_cnt = 0;
    wait(AESL_reset === 1);
    while(ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        ready_cnt = ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

initial begin : generate_done_cnt_proc
    done_cnt = 0;
    wait(AESL_reset === 1);
    while(done_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_done !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        done_cnt = done_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
    @(posedge AESL_clock);
    # 0.4;
    $finish;
end

initial fork
    AESL_clock = 0;
    forever #(`AUTOTB_CLOCK_PERIOD/2) AESL_clock = ~AESL_clock;
join

initial begin : initial_process
    integer rand;
    rst = 0;
    # 100;
	  repeat(3) @(posedge AESL_clock);
    rst = 1;
end

initial begin : start_process
  integer rand;
  start = 0;
  ce = 1;
    wait(AESL_reset === 1);
  @(posedge AESL_clock);
  start <= 1;
  while(ready_cnt != `AUTOTB_TRANSACTION_NUM + 1) begin
      @(posedge AESL_clock);
      if(AESL_ready == 1) begin
          start <= 0;
          start <= 1;
      end
  end
  start <= 0;
end

always @(AESL_done)
begin
    continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == `AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt != `AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
// Write "[[[runtime]]]" and "[[[/runtime]]]" for output-only transactor 
initial begin : write_output_transactor_m_mm2s_ctl_runtime_process
    integer fp;
    fp = $fopen(`AUTOTB_TVOUT_m_mm2s_ctl_out_wrapc, "w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_m_mm2s_ctl_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait(done_cnt == `AUTOTB_TRANSACTION_NUM)
	  repeat(2) @(posedge AESL_clock);
    # 0.2;
    fp = $fopen(`AUTOTB_TVOUT_m_mm2s_ctl_out_wrapc, "a");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_m_mm2s_ctl_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end

// Write "[[[runtime]]]" and "[[[/runtime]]]" for output-only transactor 
initial begin : write_output_transactor_m_s2mm_ctl_runtime_process
    integer fp;
    fp = $fopen(`AUTOTB_TVOUT_m_s2mm_ctl_out_wrapc, "w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_m_s2mm_ctl_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait(done_cnt == `AUTOTB_TRANSACTION_NUM)
	  repeat(2) @(posedge AESL_clock);
    # 0.2;
    fp = $fopen(`AUTOTB_TVOUT_m_s2mm_ctl_out_wrapc, "a");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_m_s2mm_ctl_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end

// Write "[[[runtime]]]" and "[[[/runtime]]]" for output-only transactor 
initial begin : write_output_transactor_s_out_V_runtime_process
    integer fp;
    fp = $fopen(`AUTOTB_TVOUT_s_out_V_out_wrapc, "w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_s_out_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait(done_cnt == `AUTOTB_TRANSACTION_NUM)
	  repeat(2) @(posedge AESL_clock);
    # 0.2;
    fp = $fopen(`AUTOTB_TVOUT_s_out_V_out_wrapc, "a");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_s_out_V_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        AESL_clk_counter <= 0;
    end 
    else begin
        AESL_clk_counter = AESL_clk_counter + 1;
    end    
end

always @ (posedge AESL_clock or negedge AESL_reset) begin
    if(AESL_reset === 0)
    begin
        AESL_mLatCnterOut_addr = 0;
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter + 1;
    end
    else if (AESL_done && AESL_mLatCnterOut_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter;
        AESL_mLatCnterOut_addr = AESL_mLatCnterOut_addr + 1;
    end
end

always @ (posedge AESL_clock or negedge AESL_reset) begin
    if(AESL_reset === 0)
    begin
        AESL_mLatCnterIn_addr = 0;
    end
    else begin
        if (AESL_start && AESL_mLatCnterIn_addr == 0) begin
            AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
            AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
        end
        if (AESL_ready && AESL_mLatCnterIn_addr < `AUTOTB_TRANSACTION_NUM + 1 ) begin
            AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
            AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
        end
    end
end

initial begin : performance_check
    integer transaction_counter;
    integer i;
    integer fp;

    integer latthistime;
    integer lattotal;
    integer latmax;
    integer latmin;


    integer thrthistime;
    integer thrtotal;
    integer thrmax;
    integer thrmin;

    integer lataver;
    integer thraver;
    reg [31 : 0] lat_array [0 : `AUTOTB_TRANSACTION_NUM];
    reg [31 : 0] thr_array [0 : `AUTOTB_TRANSACTION_NUM];

    i = 0;
    lattotal = 0;
    latmax = 0;
    latmin = 32'h 7fffffff;
    lataver = 0;

    thrtotal = 0;
    thrmax = 0;
    thrmin = 32'h 7fffffff;
    thraver = 0;

    
    @(negedge AESL_clock); 
    @(posedge AESL_reset); 
    while (done_cnt != `AUTOTB_TRANSACTION_NUM) begin
            @(posedge AESL_clock);
    end
    #0.001

    if (AESL_mLatCnterIn_addr == 1 || AESL_mLatCnterIn_addr == 0 ) begin
        latmax  = 0;
        latmin  = 0;
        lataver = 0;
        thrmax  = 0;
        thrmin  = 0;
        thraver = 0;
        lat_array[0] = 0;
        thr_array[0] = 0;
    end
    else if (AESL_mLatCnterOut_addr == 1 || AESL_mLatCnterOut_addr == 0 ) begin
        latmax  = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        latmin  = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        lataver = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        thrmax  = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        thrmin  = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        thraver = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        lat_array[0] = lataver;
        thr_array[0] = thraver;
    end
    else begin
//LATENCY
    for (i = 0;i < AESL_mLatCnterOut_addr ; i = i + 1) begin
        latthistime = AESL_mLatCnterOut[i] - AESL_mLatCnterIn[i] ;
        if ( i > 0 ) begin
            latthistime = (latthistime - 1 < 0) ? 0 : (latthistime - 1);
        end
        lattotal = lattotal + latthistime;
        lat_array[i] = latthistime;
        if (latthistime > latmax) latmax = latthistime;
        if (latthistime < latmin) latmin = latthistime;
    end
//II
    for (i = 0;i < AESL_mLatCnterIn_addr - 1; i = i + 1) begin
        thrthistime = AESL_mLatCnterIn[i + 1] - AESL_mLatCnterIn[i];
        if ( i == 0 ) begin
            thrthistime = thrthistime + 1;
        end
        thrtotal = thrtotal + thrthistime;
        thr_array[i] = thrthistime;
        if (thrthistime > thrmax) thrmax = thrthistime;
        if (thrthistime < thrmin) thrmin = thrthistime;
    end    
    
    thr_array[AESL_mLatCnterIn_addr - 1] = 0;
    lataver = lattotal / ( AESL_mLatCnterOut_addr);
    thraver = thrtotal / ( AESL_mLatCnterIn_addr - 1 );
    end

	fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");
    
	$fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latmax );
	$fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latmin );
	$fdisplay(fp, "$AVER_LATENCY = \"%0d\"", lataver );
	$fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", thrmax );
	$fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", thrmin );
	$fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", thraver );
	$fclose(fp);
	  fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");
    $fdisplay (fp,"%20s%16s%16s","","latency","interval");
    for (i = 0; i < AESL_mLatCnterOut_addr; i = i + 1) begin
        $fdisplay (fp,"transaction%8d:%16d%16d",i , lat_array[i], thr_array[i]);
    end

	$fclose(fp);
end
endmodule
