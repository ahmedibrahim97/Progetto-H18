<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<html>
<head>
  <title>Home</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="arrivederci.css">

   
</head>

<body>
<!-- menu -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">TrenoApp</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
           <li class="active"><a href="tracking.jsp">Track <span class="sr-only">(current)</span></a></li>
            </ul>
                </li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<center>
<div class="alert alert-success" role="alert">
<p><h3>PRENOTAZIONE AVVENUTA CON SUCCESSO!</h3></p>


</div>
</center>
<p style:"backgroung-font:#fff"><h4>il tuo track code è:

<%

out.print(session.getAttribute("preno").toString());

%>
</h4>
 </p>
 
 


      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="js/bootstrap.min.js"></script>



</body>
</html>