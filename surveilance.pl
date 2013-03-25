#!/usr/bin/perl
use POSIX qw(strftime);
use Time::Local;
grabPhotos(10);
sub grabPhotos	{
	my $now_string = strftime "%a%b%e%Y-%H:%M:%S", localtime;
	`mkdir $now_string`;
	my $num = $_[0];
	for(my $x = 0; $x < $num; $x++)	{
		sleep 5;
		print "Grabbing photo $x \n";
		#`mplayer tv:// -vo jpeg -frames 1 -tv driver=v4l2:width=1280:height=720 > /dev/null`;
		`uvccapture -m -o"00000001.jpg" -x800 -y600`;
		my $filename = strftime "%H:%M:%S.jpg", localtime;
		`mv 00000001.jpg $now_string/$filename`;
	}
	print "Capture round $now_string complete \n";
}
