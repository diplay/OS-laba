#!/usr/bin/perl
$filename = $ARGV[0];
open(FILE_SH, "< $filename");
printf "#!/bin/csh\n";
while ($line = <FILE_SH>)
{
	$line =~ s/\$\?/\$status/;
	if($line =~ m/\s*(then|do)$/)
	{}
	elsif($line =~ m/(\s*)for ([A-Za-z0-9_]*) in (\$[A-Za-z0-9_]*).*/)
	{
		printf "$1foreach $2 ($3)\n";
	}
	#elsif($line =~ m/(\s*)while ()/)
	elsif($line =~ m/(\s*if[^\n]*)\n$/)
	{
		$line = "$1 ) then\n";
		$line =~ tr/[]/()/;
		$line =~ s/if/if \(/;
		$line =~ s/=/==/;
		$line =~ s/-eq/==/;
		$line =~ s/-gt/>/;
		$line =~ s/-lt/</;
		$line =~ s/-ge/>=/;
		$line =~ s/-le/<=/;
		printf $line;
	}
	elsif($line =~ m/(\s*)([A-Za-z0-9_.]*=.*)/)
	{
		$line = "$1set $2\n";
		printf "$line";
	}
	elsif($line =~ m/(\s*)fi\s*$/)
	{
		printf "$1endif\n";
	}
	elsif($line =~ m/(\s*)done\s*$/)
	{
		printf "$1end\n";
	}
	else
	{
		printf "$line";
	}
}
