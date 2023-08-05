
FILELIST = filelist.f
TB = timer_tb
TESTNAME = timer_test
VERB = UVM_LOW
SEED = 5
#FINISHTIME = 10us

COMP = vcs -full64 -sverilog -Mupdate -timescale=1ns/1ps -ntb_opts uvm-1.2 -debug_access+all
RUN = ./test.simv -sml +UVM_TESTNAME=$(TESTNAME) +UVM_VERBOSITY=$(VERB) +ntb_random_seed=$(SEED) #+vcs+finish+$(FINISHTIME)

GUI ?= 0

ifeq ($(GUI), 1)
RUN += -gui
endif

all: comp run

comp:
	$(COMP) -o test.simv -f $(FILELIST) -l comp.log

run:
	$(RUN) -l run.log

clean:
	rm -rf *.log *.log.* *.h *.key *.vpd
	rm -rf csrc *.simv* DVE* stack.info*
	rm -rf .inter.vpd.uvm .restartSimSession.tcl.old
