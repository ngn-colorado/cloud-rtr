from gen_tcl_lib import *

gen_static = pr("static_routed.tcl", "config.txt", True)
gen_static.PR_process()

#gen_pr = pr("pr_flow.tcl")
#gen_pr.add_PR_process()
