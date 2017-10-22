$a = "<style>"
$a = $a + "BODY{background-color:white;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: darkgreen;background-color:gray}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:white}"
$a = $a + "</style>"

$temp = "Altug;Yildirim|Pinar;Ulug|Soner;Yildirim|Serpil;Yildirim"

$t = $temp.split("|")
$myArray = @()
try
{  
   
    foreach ($t1 in $t)
    {
        $t2 = $t1.ToString().split(";")
        $myObj = "" | Select "Isim","Soyisim"
       
         $myObj.Isim = $t2[0]
         $myObj.Soyisim  = $t2[1]
        
         $myArray += $myobj
         $myobj = $null
     }
}
catch
{
    throw;
}

$out1 = $myArray | ConvertTo-HTML -head $a

$EmailAddresses = Type your Email Address
$EmailFrom = Type a E-mail address as a sender 
$EmailBody = " Hello World! That's my table: $($out1)"
$EmailSubject = "Altug Yildirim Blog Service"
$SMTPServer = Type your SMTP server
$SMTPPort = 25
$Message = New-Object Net.Mail.MailMessage($EmailFrom, $EmailAddresses, $EmailSubject, $EmailBody)
$Message.IsBodyHtml=$true
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer,$SMTPPort)
$SMTPClient.Send($Message)
       
$EmailAddresses = $null