import os
import shutil
from tkinter import *
from tkinter.filedialog import askdirectory
from tkinter.filedialog import askopenfilename
from tkinter.messagebox import showerror
import inspect

class pr(object):
    #Lists of RMs and their implemenation locations
    RMs = []
    RM_dcps = []
    impl_checkpoints = []
    static_RMs = []
    #project paths
    project_path = ""
    ip_path = ""
    ip_pre_PR = "../HLS_RM_IP/"
    ip_post_PR = "../Post_PR_IP/"
    ip_verilog = ""
    ip_constraints = ""
    ip_checkpoints = "../IP_checkpoints"
    ip_checkpoints_base = "../IP_checkpoints_base"
    impl_path =  "../Implementations"
    rm_impl_path = impl_path + "/RM_implementations"
    static_impl_path = impl_path + "/Static_implementation"
    rm_bitstreams = "../Bitstreams"
    #project files
    static_loc = "../Static_Design/static_design.dcp"
    static_xdc_loc = "../Static_Design/static_constratins.xdc"
    static_routed_loc = static_impl_path + "/static_routed.dcp"
    xdc_available = 0
    fp_impl_paths = open("impl_paths.txt","w+")
    fp_stored_mods = open("reconfig_mods.txt", "r+")

    def __init__(self,tcl_file):
        self.tcl_file = tcl_file
        self.fp = open(tcl_file,"w")
    

    def PR_process(self):
        self.iden_synth_IP(pr.ip_checkpoints_base)
        self.add_static()
        pr.static_RMs = pr.fp_stored_mods.read().splitlines()
        #Slot 1
        self.first_add_RM(pr.static_RMs[0],pr.RM_dcps[0],"SLICE_X0Y0:SLICE_X19Y49")
        #Slot 2
        self.first_add_RM(pr.static_RMs[1],pr.RM_dcps[0],"SLICE_X20Y0:SLICE_X39Y49", "DSP48_X1Y0:DSP48_X2Y19", "RAMB18_X1Y0:RAMB18_X2Y19", "RAMB36_X1Y0:RAMB36_X2Y9")
        #Slot 3
        self.first_add_RM(pr.static_RMs[2],pr.RM_dcps[0],"SLICE_X94Y0:SLICE_X113Y49", "DSP48_X4Y0:DSP48_X4Y19", "RAMB18_X5Y0:RAMB18_X5Y19", "RAMB36_X5Y0:RAMB36_X5Y9")
        #Slot 4
        self.first_add_RM(pr.static_RMs[3],pr.RM_dcps[0],"SLICE_X56Y0:SLICE_X93Y49", "DSP48_X3Y0:DSP48_X3Y19", "RAMB18_X4Y0:RAMB18_X4Y19", "RAMB36_X4Y0:RAMB36_X4Y9")
        #Slot 5
        self.first_add_RM(pr.static_RMs[4],pr.RM_dcps[0],"SLICE_X94Y50:SLICE_X113Y99", "DSP48_X4Y20:DSP48_X4Y39", "RAMB18_X5Y20:RAMB18_X5Y39", "RAMB36_X5Y10:RAMB36_X5Y19")
        #Slot 6
        self.first_add_RM(pr.static_RMs[5],pr.RM_dcps[0],"SLICE_X26Y50:SLICE_X47Y99", "DSP48_X2Y20:DSP48_X2Y39", "RAMB18_X2Y20:RAMB18_X2Y39", "RAMB36_X2Y10:RAMB36_X2Y19")
        #Slot 7
        self.first_add_RM(pr.static_RMs[6],pr.RM_dcps[0],"SLICE_X94Y100:SLICE_X113Y149", "DSP48_X4Y40:DSP48_X4Y59", "RAMB18_X5Y40:RAMB18_X5Y59", "RAMB36_X5Y20:RAMB36_X5Y29")
        #Slot 8
        self.first_add_RM(pr.static_RMs[7],pr.RM_dcps[0],"SLICE_X26Y100:SLICE_X47Y149", "DSP48_X2Y40:DSP48_X2Y59", "RAMB18_X2Y40:RAMB18_X2Y59", "RAMB36_X2Y20:RAMB36_X2Y29")
        self.locate_implement("mod0base0_mod1base0")
        pr.fp_impl_paths.write(str(pr.impl_checkpoints[0]))
        pr.fp_impl_paths.close()
        for rm in pr.static_RMs:
            self.carve_RM(rm)
        self.write_impl_static_checkpoint(pr.static_routed_loc)
        self.fp.write("close_project\n")

    def add_PR_process(self):
        self.iden_synth_IP(pr.ip_checkpoints)
        self.open_impl_static_checkpoint()
        #Retrieve the first RM from pre_PR
        first_RM = pr.fp_stored_mods.read().splitlines()
        self.fp.write("lock_design -level routing\n")
        for i in range(0,len(pr.RMs)):
            #Needed the module saved in static routed checkpoint
            for x in range(0,len(first_RM)):
                self.add_RM(first_RM[x],pr.RM_dcps[i])
            self.locate_implement("mod0_" + pr.RMs[i] + "_mod1_" + pr.RMs[i])
            self.fp.write("close_project\n")
        self.verify_post_pr()
        #self.write_bitstreams(pr.RMs[0] + "_bit",pr.impl_checkpoints[0])

    def iden_synth_IP(self, location):
        for ip_name in os.listdir(location):
            pr.RM_dcps.append(location + '/' + ip_name)
            pr.RMs.append(ip_name.replace(".dcp",""))
    
    def synth_IP(self):
        #Create IP_checkpoint folder to store IP checkpoints
        if not os.path.exists(pr.ip_checkpoints): os.makedirs(pr.ip_checkpoints)

        #Iterate through each HLS Folder and synthesize each IP
        for ip_name in os.listdir(pr.ip_pre_PR):
            #Grab the paths where the verilog and xdc files are
            pr.ip_verilog = pr.ip_pre_PR + ip_name + "/" + ip_name +"/solution1/impl/ip/hdl/verilog"
            pr.ip_constraints = pr.ip_pre_PR + ip_name + "/" + ip_name +"/solution1/impl/ip/constraints"
            #Create a list with RM names with _0 and a list with where the checkpoints are
            pr.RMs.append(ip_name + "_0")
            pr.RM_dcps.append(pr.ip_checkpoints + "/" + ip_name + "_synth.dcp")
            #For each IP, add their files and xdcs, synthesize, and write their implementation
            self.fp.write("create_project -in_memory -part xc7z020clg484-1\n")
            for files in os.listdir(pr.ip_verilog):
                self.fp.write("add_files " + pr.ip_verilog + "/" + files + "\n")
            for files in os.listdir(pr.ip_constraints):
                self.fp.write("add_files "+ pr.ip_constraints + "/" + files + "\n")
                self.fp.write("read_xdc " + pr.ip_constraints + "/" + files + "\n")
            self.fp.write("synth_design -top " + ip_name + "_top -part xc7z020clg484-1 -mode out_of_context\n")
            self.fp.write("write_checkpoint -force "+ pr.ip_checkpoints + "/" + ip_name + "_synth.dcp\n")
            self.fp.write("close_project\n")

    def synth_IP_post(self):
        #Iterate through each HLS Folder and synthesize each IP
        for ip_name in os.listdir(pr.ip_post_PR):
            #Move folders from Post_PR_IP to HLS_IP_PY
            dst = pr.ip_pre_PR + ip_name
            src = pr.ip_post_PR + ip_name
            shutil.move(src,dst)
            #Grab the paths where the verilog and xdc files are
            pr.ip_verilog = pr.ip_pre_PR + ip_name + "/" + ip_name +"/solution1/impl/ip/hdl/verilog"
            pr.ip_constraints = pr.ip_pre_PR + ip_name + "/" + ip_name +"/solution1/impl/ip/constraints"
            #Create a list with RM names with _0 and a list with where the checkpoints are
            pr.RMs.append(ip_name + "_0")
            pr.RM_dcps.append(pr.ip_checkpoints + "/" + ip_name + "_synth.dcp")
            #For each IP, add their files and xdcs, synthesize, and write their implementation
            self.fp.write("create_project -in_memory -part xc7z020clg484-1\n")
            for files in os.listdir(pr.ip_verilog):
                self.fp.write("add_files " + pr.ip_verilog + "/" + files + "\n")
            for files in os.listdir(pr.ip_constraints):
                self.fp.write("add_files "+ pr.ip_constraints + "/" + files + "\n")
                self.fp.write("read_xdc " + pr.ip_constraints + "/" + files + "\n")
            self.fp.write("synth_design -top " + ip_name + "_top -part xc7z020clg484-1 -mode out_of_context\n")
            self.fp.write("write_checkpoint -force "+ pr.ip_checkpoints + "/" + ip_name + "_synth.dcp\n")
            self.fp.write("close_project\n")

    def add_static(self):
        #Load the static design and xdc file
        self.fp.write("create_project -in_memory -part xc7z020clg484-1\n")
        self.fp.write("add_files " + pr.static_loc + "\n")
        if pr.xdc_available > 0:
            fp.write("add_files "+ pr.static_xdc_loc + "\n")
        self.fp.write("link_design\n")

    def first_add_RM(self, RM_inst, RM_path, slices, DSPs = "none", RAM18 = "none", RAM36 = "none"):
        #Create implementations folder with RM and static subfolders        
        if not os.path.exists(pr.impl_path): os.makedirs(pr.impl_path)
        if not os.path.exists(pr.rm_impl_path): os.makedirs(pr.rm_impl_path)
        if not os.path.exists(pr.static_impl_path): os.makedirs(pr.static_impl_path)
        #Make the RP reconfigurable, fill in the RP, draw a pblock for the RP
        self.fp.write("set_property HD.RECONFIGURABLE 1 [get_cells i_system_wrapper/system_i/" + RM_inst + "]\n")
        self.fp.write("read_checkpoint -cell i_system_wrapper/system_i/" + RM_inst + " " + RM_path + "\n")
        self.draw_pblock(slices, DSPs, RAM18, RAM36, RM_inst)

    def locate_implement(self, config_name):
        #Create a folder for each RM implementation
        config_path = pr.rm_impl_path + "/config_" + config_name
        if not os.path.exists(config_path): os.makedirs(config_path)
        config_RM = config_path + "/config_" + config_name + ".dcp"
        self.implement(config_RM)

    def carve_RM(self,RM_inst):
        self.fp.write("update_design -cell i_system_wrapper/system_i/" + RM_inst + " -black_box\n")
    
    def write_impl_static_checkpoint(self,path_static_impl_dcp):
        self.fp.write("write_checkpoint -force " + path_static_impl_dcp + "\n")

    def open_impl_static_checkpoint(self):
        self.fp.write("open_checkpoint " + pr.static_routed_loc + "\n")

    def add_RM(self,prev_RM, RM_dcp):
        self.fp.write("read_checkpoint -cell i_system_wrapper/system_i/" + prev_RM + " " + RM_dcp + "\n")
    
    def draw_pblock(self, *args):
        self.fp.write("startgroup\n")
        self.fp.write("create_pblock pblock_" + args[-1] + "\n")
        self.fp.write("resize_pblock pblock_" + args[-1] + " -add {")
        for x in range(0,len(args) - 1):
            if args[x] != "none":
                self.fp.write(args[x] + " ")
        self.fp.write("}\n")
        self.fp.write("add_cells_to_pblock pblock_" + args[-1] + " [get_cells [list i_system_wrapper/system_i/" + args[-1] + "]] -clear_locs\n")
        self.fp.write("endgroup\n")
        self.fp.write("set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_" + args[-1] + "]\n")
        self.fp.write("set_property SNAPPING_MODE ON [get_pblocks pblock_" + args[-1] +"]\n")

    def implement(self, config_path):
        self.fp.write("opt_design\n")
        self.fp.write("place_design\n")
        self.fp.write("route_design\n")
        pr.impl_checkpoints.append(config_path)
        self.fp.write("write_checkpoint -force " + config_path + "\n")
    #Will need to update this so pr_verify is called many times
    def verify_post_pr(self):
        self.fp.write("pr_verify -initial ")
        line = pr.fp_impl_paths.readline().strip('\n')
        self.fp.write(line + " -additional {")
        for x in range(0,len(pr.impl_checkpoints)):
            self.fp.write(pr.impl_checkpoints[x] + " ")
        self.fp.write("}\n")

    def write_bitstreams(self,RM_inst,impl_checkpoints):
        if not os.path.exists(pr.rm_bitstreams): os.makedirs(pr.rm_bitstreams)
        self.fp.write("open_checkpoint " + impl_checkpoints + "\n")
        self.fp.write("write_bitstream -file " + pr.rm_bitstreams + "/" + RM_inst + ".bit\n")
        self.fp.write("close_project\n")
        #Close the file being written too
        pr.fp_impl_paths.close()
