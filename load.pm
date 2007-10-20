
#
#  The package this module is implementing.
#
package plugins::load;


#
#  Register the plugin.
#
::register_plugin("plugins::load");


#
#  Minimal constructor.
#
sub new { return bless {}; }


#
#  Get the author of this plugin.
#
sub getAuthor
{
    return( "Steve Kemp" );
}

#
#  Get the version of this plugin.
#
sub getVersion
{
    return( "1.1" );
}

#
#  Test whether we should be invoked for a given URL.
#
sub wantsPath
{
    my ( $class, $path ) = ( @_ );

    if ( $path =~ /^\/info\/*/i )
    {
        return 1;
    }

    return 0;
}


#
#  Handle one of the paths we're invoked for.
#
sub handlePath
{
    my ( $class, $uri ) = (@_);

package main;


   my $header = &getHTTPHeader( 200, "text/plain" );
   &sendData( $data, $header );

   my $output = "We were called for the URL <b>$request</b>";

   &sendData( $data, $output );
   return 1;
}


1;
