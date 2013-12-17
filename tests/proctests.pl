#!/usr/bin/perl
$filename = $ARGV[0];
open(FILE_SH, "< $filename");
printf "#!/bin/csh\n";
while ($line = <FILE_SH>)
{
	$line =~ s/\$\?/\$status/;
	if($line =~ m/\s*then$/)
	{}
	elsif($line =~ m/(\s*if[^\n]*)\n$/)
	{
		$line = "$1 ) then\n";
		$line =~ tr/[]/()/;
		$line =~ s/if/if \(/;
		$line =~ s/=/==/;
		$line =~ s/-eq/==/;
		printf $line;
	}
	elsif($line =~ m/(\s*)([A-Za-z0-9_.]*=.*)/)
	{
		$line = "$1set $2\n";
		printf "$line";
	}
	elsif($line =~ m/^fi$/)
	{
		printf "endif\n";
	}
	else
	{
		printf "$line";
	}
}
