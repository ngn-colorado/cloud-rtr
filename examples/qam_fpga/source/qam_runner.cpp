#include "ap_int.h"
#include "crec.h"
#include <hls_stream.h>
#include <iostream>

//typedef ap_fixed<16,3>	data_t;  // sxx.xx.....

//typedef struct cdata_t {
//  data_t i,q;
//} cdata_t;

//typedef ap_ufixed<2,2> qam_t;

//typedef struct ctl_crec_t {
//  qam_t          qam;
//  // ap_int does not work w/ shifting!
//  //ap_int<3>     lf_p;         // 2^0,-1,-2,-3,-4,-5,-6,-7
//  //ap_int<3>     lf_i;         // 2^-9,-10,-11,-12,-13,-14,-15,-16
//  //ap_int<3>     lf_out_gain;  // 2^0,-1,-2,-3,-4,-5,-6,-7
//  char     lf_p;         // 2^0,-1,-2,-3,-4,-5,-6,-7
//  char     lf_i;         // 2^-9,-10,-11,-12,-13,-14,-15,-16
//  char     lf_out_gain;  // 2^0,-1,-2,-3,-4,-5,-6,-7
//  bool     reg_clr;
//  ap_fixed<28,2,AP_TRN,AP_SAT> reg_init;
//  //ap_ufixed<8,8> lf_init;
//} ctl_crec_t;

//typedef ap_fixed<14,2,AP_TRN,AP_SAT> phase_t;   // phase in radian

//typedef struct cphase_t {  // phase in x, y
//    ap_fixed<12,1> i,q;
//} cphase_t;

//typedef ap_fixed<28,2> loop_int_t;
//typedef ap_fixed<28,2> loop_out_t;
//
//typedef ap_fixed<16,1,AP_RND_INF,AP_SAT_SYM> cos_t;
//typedef ap_fixed<16,1> lut_out_t;

//typedef struct float_data{
//	float i,q;
//} float_data;

typedef struct ctl_crec_t_in {
  float	qam;
  char	lf_p;
  char	lf_i;
  char	lf_out_gain;
  bool	reg_clr;
  float reg_init;
} ctl_crec_t_in;

typedef ap_uint<128> uint128_t;
typedef hls::stream<uint128_t> mem_stream;
typedef struct float_data{
	float i,q,ph_i,ph_q;
} float_data;

union float_d{
	float f;
	int u;
};

//typedef hls::stream<float[4]> mem_stream;

bool qam_runner(unsigned sourceAddress, unsigned destinationAddress, int iterations,
		ctl_crec_t_in control_in, volatile unsigned int m_mm2s_ctl [500], volatile unsigned int m_s2mm_ctl[500],
		mem_stream& s_in, mem_stream& s_out){
#pragma HLS INTERFACE s_axilite port=iterations

#pragma HLS INTERFACE ap_vld port=iterations

#pragma HLS INTERFACE ap_vld port=destinationAddress

#pragma HLS INTERFACE s_axilite port=destinationAddress

#pragma HLS INTERFACE ap_vld port=sourceAddress

#pragma HLS INTERFACE s_axilite port=sourceAddress

#pragma HLS INTERFACE axis depth=1000 port=s_out

#pragma HLS INTERFACE axis depth=1000 port=s_in

#pragma HLS INTERFACE m_axi port=m_s2mm_ctl

#pragma HLS INTERFACE m_axi port=m_mm2s_ctl

#pragma HLS INTERFACE s_axilite port=control_in

#pragma HLS INTERFACE ap_vld port=control_in

#pragma HLS INTERFACE s_axilite port=return

#pragma HLS INTERFACE ap_ctrl_hs port=return

	m_mm2s_ctl[0] &= 0;
	m_s2mm_ctl[12] &= 0;

	m_mm2s_ctl[0] |= 4;
	m_s2mm_ctl[12] |= 4;

	m_mm2s_ctl[0] &= 0;
	m_s2mm_ctl[12] &= 0;

	//--------Program read DMA mm2s----------
	//enable read dma block
	m_mm2s_ctl[0] |= 1;
	//enable read interupts
	m_mm2s_ctl[0] |= 4096;
	//write source address
	m_mm2s_ctl[6] = sourceAddress;
	//calculate # of bytes that will be read from s_in in total
	//read_length = #encryptions X #bytes/encryption
	int read_length = iterations*sizeof(float_data);
	m_mm2s_ctl[10] = read_length;

	//--------Program write DMA s2mm--------
	//enable s2mm on write dma block
	m_s2mm_ctl[12] |= 1;
	//enable write interrupts
	m_s2mm_ctl[12] |= 4096;
	//write dest address
	m_s2mm_ctl[18] = destinationAddress;
	//write write length as the same as read length
	m_s2mm_ctl[22] = read_length;

//	*ap_start_out = false;
	cphase_t qam_ph;
//	qam_ph.i = 0;
//	qam_ph.q = 0;
	int i;
	for(i=0; i<iterations; i++){
//		float_data data = s_in.read();
		ap_uint<128> raw_in = s_in.read();
		ap_uint<32> first_r = raw_in(127, 96);
		ap_uint<32> second_r = raw_in(95,64);
//		ap_uint<128> first_r = raw_in(63,32);
//		ap_uint<128> second_r = raw_in(32,0);
		ap_uint<32> third_r = raw_in(63,32);
		ap_uint<32> fourth_r = raw_in(31,0);
		float_d first;
		float_d second;
		float_d third;
		float_d fourth;
		first.u = first_r.to_uint();
		second.u = second_r.to_uint();
		third.u = third_r.to_uint();
		fourth.u = fourth_r.to_uint();
		printf("\nIN: First: %f,%i, Second: %f,u, Third: %f,%i, Fourth: %f,%i", first.f, first.u, second.f, second.u, third.f, third.u, fourth.f, fourth.u);

//		third.u = third_r.to_uint();
//		fourth.u = fourth_r.to_uint();
		float_data data;
		cdata_t qam_d;
		qam_d.i = first.f;//data.i;
		qam_d.q = second.f;//data.q;


//		qam_ph.i = third.f;//data.ph_i;
//		qam_ph.q = fourth.f;//data.ph_q;

		ctl_crec_t control_out;
		control_out.qam = control_in.qam;
		control_out.lf_p = control_in.lf_p;
		control_out.lf_i = control_in.lf_i;
		control_out.lf_out_gain = control_in.lf_out_gain;
		control_out.reg_clr = control_in.reg_clr;
		control_out.reg_init = control_in.reg_init;

	//	*ap_start_out = true;
		cdata_t qam_d_out;
		cphase_t qam_ph_out;
		loop_int_t qam_loop_out;

		crec(qam_d, &qam_d_out, qam_ph, &qam_ph_out, &qam_loop_out, control_out);

		float_d first_r_out;
		float_d second_r_out;
		float_d third_r_out;
		float_d fourth_r_out;

//		float_data out;
		first_r_out.f = (float)(qam_d_out.i.to_float());
		second_r_out.f = (float)(qam_d_out.q.to_float());
		qam_ph.i = qam_ph_out.i;//.to_float();
		qam_ph.q = qam_ph_out.q;//.to_float();
		third_r_out.f = qam_ph_out.i.to_float();
		fourth_r_out.f = qam_ph_out.q.to_float();

		ap_uint<32> first_out(first_r_out.u);
		ap_uint<32> second_out(second_r_out.u);
		ap_uint<32> third_out(third_r_out.u);
		ap_uint<32> fourth_out(fourth_r_out.u);
		printf("\nOUT: First: %f,%i, Second: %f,u, Third: %f,%i, Fourth: %f,%i", first_r_out.f, first_r_out.u, second_r_out.f, second_r_out.u, third_r_out.f, third_r_out.u, fourth_r_out.f, fourth_r_out.u);

		ap_uint<128> out = (first_out, second_out, third_out, fourth_out);
//		*loop_out = qam_loop_out;

		s_out.write(out);
//		uint128_t data;
//		if(!s_in.empty()){
//			s_in.read(data);
//		}
//		if(enable_out){
//			s_out.write(0);
//		}
	}

	return true;
}
