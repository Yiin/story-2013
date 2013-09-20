<style>

  table { 

    border-collapse:collapse; 

    font-family: tahoma, arial; 

    font-size: 13px; 

  }

  table, tr, td { 

    border: 1px solid #b7c3c9; 

  }

  td { padding: 10px; }



  #players table, tr, th { border-top: 0; }

  #serveris td { text-align: center; }



  code { 

    padding:2px 4px; 

    font-family: Menlo,Monaco,Consolas,"Courier New",monospace; 

    font-size:12px;

    color:#d14;

    border:1px solid #e1e1e8;

    -webkit-border-radius:3px;

    -moz-border-radius:3px;

    border-radius:3px;

    background-color:#f7f7f9;

  }



  #status {

    min-width: 25px;

    min-height: 20px;

    background: #468847;

    -webkit-border-radius:20px;

    -moz-border-radius:20px;

    border-radius:20px;

    color: white;

    padding-top: 2px;

  }

</style>


<?php

$ip = "cs.playnet.lt";

$port = "27016";

$packet = "\xFF\xFF\xFF\xFFTSource Engine Query\x00";

function getnextstring(&$data)
{

  $temp="";

  $counter=0;

  while (ord($data[$counter++])!=0) $temp.=$data[$counter-1];

  $data=substr($data,strlen($temp)+1);

  return $temp;

}

function getnextbytevalue(&$data)
{

  $temp=ord($data[0]);

  $data=substr($data,1);

  return $temp;

}

   

if(!$live_server = fsockopen("udp://".$ip.":".$port.""))
{

  $output = "Off";

}
else
{

  fwrite($live_server, $packet);

  socket_set_timeout($live_server,1,0);

  $junk = fread($live_server,5);

  $status = socket_get_status($live_server);

  $do = 1;

  $server_info = "";

  while($do)
  {
    
    $str_1 = fread($live_server,1);

    $server_info .= $str_1;

    $status .= socket_get_status($live_server);

    if($status["unread_bytes"] == 0) {$do = 0;}

  }

  fclose($live_server);

         

  if (strlen($server_info) > 0)
  {

    $success = 1;

    $junk = getnextstring($server_info);

    $servername = getnextstring($server_info);

    $map = getnextstring($server_info);

    $junk = getnextstring($server_info);

    $junk = getnextstring($server_info);

    $players = getnextbytevalue($server_info);

    $maxplayers = getnextbytevalue($server_info);

  }

         

  if ($players != '') 
  {

    $players = $players;

  } else {

    $players = "0";

  }

         
  if ($maxplayers != '')
  {

    $maxplayers = $maxplayers;

  }
  else
  {

    $maxplayers = "0";

  } 


  if ($players < $maxplayers)
  {

    $output = "<font color='#ff0000'>On</font>";

  }
  else
  {

    $output = "<font color='#54ff00'>Full</font>";

  }

  if ($output != "Full" and $players != "0" or $maxplayers != "0")
  {

    $output = $output;

  }
  else
  {

    $output = "<font color='#ff3600'>Off</font>";

  }

  if ($map != '')
  {

    $map = "".$map."";

  }
  else
  {

    $map = "-----";

  }

  if ($servername != '') 
  {

    $servername = $servername;

  } else {

    $servername = "<font color='#ff3600'>Serveris neveikia</font>";

  }
}

?>
    <table id="serveris" width="650">

      <tr>

        <td> <div id="status"><? echo $output ?></div> </td>

        <td><? echo $servername; ?></td>

        <td><code><? echo $ip.":".$serverPort; ?></code></td>

        <td title="Žaidėjai">

          <? echo $players." / ".$maxplayers; ?> <br />

        </td>

      </tr>

    </table>