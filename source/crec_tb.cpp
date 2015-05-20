//______________________________________________________________________________ 
// crec_tb.cpp:
// - carrier/phase recovery testbench
//
//
//
// a. paek, may 2012
//______________________________________________________________________________ 
#include "crec.h"
#include <hls_stream.h>

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

bool qam_runner(unsigned, unsigned, int,
		ctl_crec_t_in, volatile unsigned int[], volatile unsigned int[],
		mem_stream&, mem_stream&);

int  main () {

cdata_t   din;       // crec input
cdata_t   dout_mix;  // mixer output
cphase_t  ph_xy;     // phase offset input
cphase_t  t_ph_xy;   // phase offset output from phase recovery blk
ctl_crec_t control;  // crec control setting

hd_t       hd_out;
cdata_t    sd_out;
error_t    err;
qam_t      qam = control.qam;
loop_int_t loop_integ; 
loop_out_t loop_out; 


// control setting
control.qam = 0;
//control.lf_p = 4; // 2^-4
control.lf_p = 6; // 2^-6
control.lf_i = 5; // 2^-14
control.lf_out_gain = 1; // 2^-1
control.reg_clr = 0;
control.reg_init = 0;

ctl_crec_t_in ctl_fabric;
ctl_fabric.qam = control.qam;
ctl_fabric.lf_p = control.lf_p;
ctl_fabric.lf_i = control.lf_i;
ctl_fabric.lf_out_gain = control.lf_out_gain;
ctl_fabric.reg_clr = control.reg_clr;
ctl_fabric.reg_init = control.reg_init;

// file IO
ifstream fp_cin ("/Xilinx/cin.txt");
//ifstream fp_cin ("lf_cin.txt");
//ifstream fp_phin ("lf_phin.txt");

ofstream fp_dout ("/Xilinx/hw_dout.txt");
ofstream fp_dout_fab ("/Xilinx/hw_dout_fab.txt");
ofstream fp_debug ("debug.txt");

float f_din;
ap_uint<128> data[26000];
volatile unsigned int mm2s[500];
volatile unsigned int s2mm[500];
mem_stream s_in;
mem_stream s_out;


for (int i = 0; i<13000; ++i) {
//for (int i = 0; i<6560; ++i) {
//for (int i = 0; i<1100; ++i) {

  fp_cin >> f_din; din.i = f_din;
  fp_cin >> f_din; din.q = f_din;
  //cout << din.i << " " << din.q << endl;
  float_d first;
  float_d second;
  first.f = din.i;
  second.f = din.q;
ap_uint<32> first_out(first.u);
ap_uint<32> second_out(second.u);
ap_uint<32> third_out(0);
ap_uint<32> fourth_out(0);

ap_uint<128> raw_in = (first_out, second_out, 0, 0);//first_out, first_out, first_out);
s_in.write(raw_in);
  //fp_phin >> f_din; ph_xy.i = f_din;
  //fp_phin >> f_din; ph_xy.q = f_din;

  // to make it a close loop
  ph_xy.i = t_ph_xy.i;
  ph_xy.q = t_ph_xy.q;



//#define SEPARATE

#ifndef SEPARATE
  crec ( din, &dout_mix, ph_xy, &t_ph_xy, &loop_integ, control );

  fp_dout << dout_mix.i << "\t " << dout_mix.q << "\t " << ph_xy.i << "\t" << ph_xy.q << endl;
  fp_debug << loop_integ << "\t " << endl;

#else
  //cout << din.i << " "<< din.q;
  mix( din, &dout_mix, ph_xy );
  fp_dout << dout_mix.i << "\t " << dout_mix.q << "\t " << " " << endl;

  slicer ( qam, dout_mix, &hd_out, &sd_out, &err);
  //fp_debug << err.i << "\t " << err.q << "\t " << " " << endl;

  phase_recovery ( hd_out, sd_out, &loop_integ, &loop_out, &t_ph_xy, control);
  fp_debug << loop_integ << "\t " << endl;
  //fp_debug << t_ph_xy.i << "\t " << loop_out << endl;
  //fp_cout << dout_mix.i << "\t " << dout_mix.q << "\t " << loop_integ << endl;
#endif

};

qam_runner(0, 13000, 13000, ctl_fabric, s2mm, mm2s, s_in, s_out);
for(int i=0; i<13000; i++){
	ap_uint<128> in = s_out.read();
	ap_uint<32> first_r = in(127, 96);
	ap_uint<32> second_r = in(95,64);
	ap_uint<32> third_r = in(63,32);
	ap_uint<32> fourth_r = in(31,0);
	float_d first;
	float_d second;
	float_d third;
	float_d fourth;
	first.u = first_r.to_uint();
	second.u = second_r.to_uint();
	third.u = third_r.to_uint();
	fourth.u = fourth_r.to_uint();
	fp_dout_fab << first.f << "\t " << second.f << "\t " << third.f << "\t" << fourth.f << endl;
}


fp_dout.close();
fp_debug.close();
fp_cin.close();
//fp_phin.close();

return 0;

}

#ifdef EACH
//______________________________________________________________________________ 
// apply phase correction
cphase_t  ph_xy;

din   = {1.1,  2.1};
ph_xy = {0.45, 0.44};
mix( din, &dout_mix, ph_xy );

//cout << endl << dout_mix.i << " " << dout_mix.q << endl;


//______________________________________________________________________________ 
// slicer
hd_t     hd_out;
cdata_t  sd_out;
error_t  err;
qam_t    qam = control.qam;

slicer ( qam, dout_mix, &hd_out, &sd_out, &err);

//----  sanity check
//cdata_t tmp = { -1.4, 3.4};
//slicer ( qam, tmp, &hd_out, &sd_out, &err);
//cout << endl << "hd: " << hd_out.i << " " << hd_out.q << endl;
//cout << "sd: " << sd_out.i << " " << sd_out.q << endl;
//cout << "err: " << err.i << " " << err.q << endl;


//______________________________________________________________________________ 
// determine phase offset
phase_t  ph_est;
compute_phase ( hd_out, sd_out, &ph_est );

//----  sanity check
//hd_t    t_hd = { -0.9375, 0.875};
//cdata_t t_sd = { -1.1, 0.4};
//compute_phase ( t_hd, t_sd, &ph_est );
//cout << "ph_est: " << ph_est << endl;


//______________________________________________________________________________ 
// loop filter
loop_int_t loop_int;
loop_out_t loop_out;
//loop_filter( ph_est, &loop_out, &loop_int, control );

//phase_t  tin = -1.125;
//loop_filter( tin, &loop_out, &loop_int, control );

//---- stand alone testbench

  //ifstream fp_lf_in;   fp_lf_in.open("lf_in.txt", ios::in);
  //ofstream fp_lf_out;   fp_lf_out.open("lf_out.txt", ios::out);
  ifstream fp_lf_in("lf_in.txt");
  //ifstream fp_lf_in("yyy.txt");
  //ofstream fp_din("din.txt");
  ofstream fp_lf_out("lf_out.txt");

  phase_t tin;
  float  f_tin;
  float  f_loop_out, f_loop_int;

  for (int i = 0; i<118000; ++i) {
  //for (int i = 0; i<5; ++i) {

    fp_lf_in >> f_tin;
    tin = f_tin;
    //cout << tin << endl;
    //fp_din << tin << endl;

    loop_filter( tin, &loop_out, &loop_int, control );
    f_loop_out = loop_out;
    f_loop_int = loop_int;
    fp_lf_out << f_loop_out << " " << f_loop_int << endl;
    //fp_lf_out << f_loop_out << endl;

  }

  fp_lf_in.close();
  //fp_din.close();
  fp_lf_out.close();

  cout << "done.............";




//______________________________________________________________________________ 
// VCO


//---- stand alone testbench
loop_out_t loop_out;
cphase_t   ph_offset;
ofstream   fp_vco_out;  fp_vco_out.open("vco_out.txt", ios::out);
float      f_i, f_q;
ap_fixed<16,1> tphase;

//for (int i = 0; i<118000; ++i) {
for (int i = 0; i<200; ++i) {
    loop_out = .01;
    vco ( loop_out, &tphase, &ph_offset );
    f_i = ph_offset.i;
    //f_i = tphase;
    f_q = ph_offset.q;
    fp_vco_out << f_i << " " << f_q << endl;
}


  fp_vco_out.close();
  cout << "done.............";


}
#endif


