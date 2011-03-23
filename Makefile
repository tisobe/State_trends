############################
# Change the task name!
############################
TASK = State_trends

include /data/mta/MTA/include/Makefile.MTA

BIN  = acorn state_mj_run.perl state_mj_script state_mj_size_check.perl state_mj_wrap_script state_sim_run.perl state_sim_script state_sim_wrap_script
 create_report_page_outputs.perl 

DATA = mj_header mj_nawkscript mj_sedscript1 sim_header sim_nawkscript sim_sedscript1 simpos_acis.scr simpos_acis2.scr

DOC  = README

install:
ifdef BIN
	rsync --times --cvs-exclude $(BIN) $(INSTALL_BIN)/
endif
ifdef DATA
	mkdir -p $(INSTALL_DATA)
	rsync --times --cvs-exclude $(DATA) $(INSTALL_DATA)/
endif
ifdef DOC
	mkdir -p $(INSTALL_DOC)
	rsync --times --cvs-exclude $(DOC) $(INSTALL_DOC)/
endif
ifdef IDL_LIB
	mkdir -p $(INSTALL_IDL_LIB)
	rsync --times --cvs-exclude $(IDL_LIB) $(INSTALL_IDL_LIB)/
endif
ifdef CGI_BIN
	mkdir -p $(INSTALL_CGI_BIN)
	rsync --times --cvs-exclude $(CGI_BIN) $(INSTALL_CGI_BIN)/
endif
ifdef PERLLIB
	mkdir -p $(INSTALL_PERLLIB)
	rsync --times --cvs-exclude $(PERLLIB) $(INSTALL_PERLLIB)/
endif
ifdef WWW
	mkdir -p $(INSTALL_WWW)
	rsync --times --cvs-exclude $(WWW) $(INSTALL_WWW)/
endif
