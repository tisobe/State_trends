#!/usr/bin/perl

#################################################################################
#										#
#	state_mj_size_check.perl: check mj data and send out email if there is	#
#				  any anomaly					#
#										#
#		author: t. isobe (tiosbe@cfa.harvard.edu)			#
#										#
#		last update: Jul 3, 2006					#
#										#
#################################################################################

##############################################################
#
#--- setting directories
#

$bin_dir       = '/data/mta/MTA/bin/';
$data_dir      = '/data/mta/MTA/data/';
$web_dir       = '/data/mta/www/mta_states/MJ/';
$house_keeping = '/data/mta/Script/OBT/MJ/house_keeping/';

$web_dir       = '/data/mta/www/mta_temp/mta_states_test/MJ/';
$house_keeping = '/data/mta/Script/OBT/MJ_test/house_keeping/';
##############################################################

system("ls -l $house_keeping/comprehensive_data_summary* > zsize");
open(FH, './zsize');
$i = 0;
while(<FH>){
	chomp $_;
	@atemp = split(/ /, $_);
	@line = ();
	foreach $ent (@atemp){
		if($ent =~ /\w/){
			push(@line, $ent);
		}
	}
	$size[$i] = $line[3];
	$i++;
}
close(FH);
system("rm zsize");

	
if($size[0] < $size[1]) {
	
	open (FILE, ">/tmp/mjmail.tmp");
	print FILE "Please check: \n";
	print FILE '/data/mta/www/mta_states/MJ/';
	print FILE "$year/mta_comprehensive_data_summary$year\n";
	close FILE;

	system("/opt/local/bin/mh/send -draftmessage /tmp/mjmail.tmp");
	system("cat /tmp/mjmail.tmp | mailx mailx -s \"Subject: MJ summary problem detected !!\n \" -r  isobe\@head.cfa.harvard.edu  isobe\@head.cfa.harvard.edu ");

	system("rm /tmp/mjmail.tmp");
}
