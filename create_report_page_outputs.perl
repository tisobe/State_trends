#!/usr/bin/perl 

#################################################################################################################
#														#
#	create_report_page_outputs.perl: create two report page for SOT page					#
#														#
#		author: t. isobe (tisobe@cfa.harvard.edu)							#
#														#
#		last update: Mar 23, 2011									#
#														#
#################################################################################################################	


##############################################################
#
#--- setting directories
#

$bin_dir         = '/data/mta/MTA/bin/';
$data_dir        = '/data/mta/MTA/data/State_trends/';
$web_dir         = '/data/mta/www/mta_states/';
$house_keepingmj = '/data/mta/Script/OBT/MJ/house_keeping/';
$house_keepingac = '/data/mta/Script/OBT/ACIS/house_keeping/';

##############################################################

system("rm $web_dir/mta_comprehensive_data_summary"); 
system("rm $web_dir/sim_data_summary"); 
system("cat $data_dir/mj_header   $house_keepingmj/comprehensive_data_summary > $web_dir/mta_comprehensive_data_summary");
system("cat $data_dir/sim_header $house_keepingac/sim_data_summary           > $web_dir/sim_data_summary");

system("chgrp mtagroup $web_dir/*");
