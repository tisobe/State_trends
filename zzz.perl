#!/usr/bin/perl

$input =`ls *`;
@list = split(/\n+/, $input);
foreach $ent (@list){
	$test =` cat $ent`;
	if($test =~ /axTime3/){
		print "$ent\n";
	}
}
