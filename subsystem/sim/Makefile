
FILELIST = filelist.f
TB = top_tb
TESTNAME = timer0_test
VERB = UVM_LOW
SEED = 5
VDB = out.vdb
#FINISHTIME = 10us
gui ?= 0
cov ?= 0

COMP = vcs -full64 -sverilog -Mupdate -timescale=1ns/1ps -ntb_opts uvm-1.2 -debug_access+all -top $(TB) -o $(TB).simv -f $(FILELIST) -l comp.log
RUN = ./$(TB).simv -sml +UVM_TESTNAME=$(TESTNAME) +UVM_VERBOSITY=$(VERB) +ntb_random_seed=$(SEED) -l run.log #+vcs+finish+$(FINISHTIME)
DVE = dve -full64 -dir out.vdb


ifeq ($(gui), 1)
RUN += -gui
endif

ifeq ($(cov), 1)
COMP += -cm line+cond+fsm+tgl+branch+assert -cm_dir $(VDB)
RUN += -cm line+cond+fsm+tgl+branch+assert  -covg_cont_on_error  -cm_dir $(VDB) -cm_name $(TESTNAME)_$(SEED)
endif

all: comp run

comp:
	$(COMP)

run:
	$(RUN)

urg:
	urg -dir $(VDB) -format both
	cat ./urgReport/dashboard.txt

dve:
	$(DVE)

clean:
	rm -rf *.log *.log.* *.h *.key *.vpd novas.*
	rm -rf csrc *.simv* DVE* stack.info* *.vdb urgReport verdiLog
	rm -rf .inter.vpd.uvm .restartSimSession.tcl.old
