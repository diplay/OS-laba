#!/usr/bin/perl
$filename = $ARGV[0];
open(FILE_SH, "< $filename");
printf "#!/bin/csh\n";
while ($line = <FILE_SH>)
{
	$line =~ s/\$\?/\$status/;
	if($line =~ m/if.*/)
	{
		#$line =~ tr/\[/\(/;
		#$line =~ tr/\]/\)/;
		#$line =~ s/if/if \(/;
		$line = 'if ( ( "$OUTPUT_STRING" == "$OUTPUT_STRING_EXPECTED" ) && ( $OUTPUT_CODE == $OUTPUT_CODE_EXPECTED ) ) ';
		printf $line;
	}
	elsif($line =~ m/.*=.*/)
	{
		printf "set $line";
	}
	elsif($line =~ m/fi.*/)
	{
		printf "endif\n";
	}
	else
	{
		printf "$line";
	}
}
