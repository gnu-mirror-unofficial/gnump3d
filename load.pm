

sub getAuthor( )
{
    return( "Steve Kemp" );
}

sub getVersion( )
{
    return( "1.1" );
}

sub handlePath( $ )
{
    my ( $request ) = ( @_ );

    my $header   = &getHTTPHeader( 200, "text/html" );
    &sendData( $data, $header );

    my $text     = "";
    my @template = &getThemeFile( $ARGUMENTS{ "theme" }, "plugin.html" );
    foreach my $line (@template )
    {
	#
	# Make global substitutions.
	#
	$line =~ s/\$HOSTNAME/$host/g;
	$line =~ s/\$VERSION/$VERSION/g;
	$line =~ s/\$DIRECTORY/\/load\//g;
	$line =~ s/\$HEADING/GNUMP3d Load Reporting Page/g;
	$line =~ s/\$TITLE/GNUMP3d Load Reporting Page/g;
		#
	# Now handle the special sections.
	#
	if ( $line =~ /(.*)\$BANNER(.*)/ )
	{
	    # Insert banner;
	    my $pre  = $1;
	    my $post = $2;

	    $text .= $pre;
	    $text .= &getBanner( "/load/" );
	    $text .= $post;
	}
	elsif ( $line =~ /(.*)\$TEXT(.*)/ )
	{
	    #
	    # This is the main output area of the plugin
	    #
	    my $uptime = `uptime`;
	    chomp( $uptime );

	    if ( $uptime =~ /load average: ([^,]+),/ )
	    {
		$text .= "<b>Current Load: $1</b>\n";
	    }
	}
	else
	{
	    $text .= $line;
	}
    }
  
    &sendData( $data, $text );
    return 1;
}


1;
