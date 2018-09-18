<html>
<head>
  <title>Home</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">

    <script language="javascript">
        <!--

        function campo(a){
            div = document.getElementById('date')
            if(a=="Attiva"){
                div.innerHTML='<p>dataAndata</p>\n' +
                    '            <input type="date" class="form-control" name="dataAndata" placeholder="gg/mm/aa">\n' +
                    '\n' +
                    '        <p>dataRitorno</p>\n' +
                    '            <input type="date" class="form-control" name="dataRitorno" placeholder="gg/mm/aa">'

            }
            else
                div.innerHTML='<p>dataAndata</p>\n' +
                    '            <input type="date" class="form-control" name="dataAndata" placeholder="gg/mm/aa">\n' +
                    '\n' +
                    '        <p>dataRitorno</p>\n' +
                    '            <input type="date" class="form-control" name="dataRitorno" placeholder="gg/mm/aa" disabled>'

        }
        //-->
    </script>

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

<!-- carosello -->
<div id="carousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel" data-slide-to="0" class="active"></li>
        <li data-target="#carousel" data-slide-to="1"></li>
        <li data-target="#carousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active" style="background-image: url(Images/treno5.jpg);">
		

			<center><div class="alert alert-danger" role="alert"><h3>Errore: inserire dati coerenti</h3></div></center>

            <div class="carousel-caption">
                <h1>Viaggia con Noi...</h1>
            </div>
        </div>
        <div class="item" style="background-image: url(Images/treno1.jpg);">
			<center><div class="alert alert-danger" role="alert"><h3>Errore: inserire dati coerenti</h3></div></center>
            <div class="carousel-caption">
                <h1>Viaggia con Noi...</h1>
            </div>
        </div>
        <div class="item" style="background-image: url(Images/treno6.jpg);">
			<center><div class="alert alert-danger" role="alert"><h3>Errore: inserire dati coerenti</h3></div></center>
            <div class="carousel-caption">
                <h1>Viaggia con Noi...</h1>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="jumbotron">

    <label class="dove-andare">
        Dove vuoi andare?
    </label>

    <form class="formviaggio" action="Controller1" method="get">

        <div class="scelta">
            <p>Andata<input  type="radio" name="modalita" value="ANDATA" checked onClick="campo('Disattiva');"/></p>
            <p>Andtata/Ritorno <input  type="radio" name="modalita" value="ANDATA_RITORNO" onClick="campo('Attiva');"/></p>
        </div>

        <div class="datiViaggio">
        <p>partenza</p>
            <input type="text" class="form-control" name="partenza" placeholder="partenza">
        <p> arrivo</p>
         <input id="inputArrivo" type="text" class="form-control" name="arrivo" placeholder="arrivo">
        </div>


        <div id="date" class="dateClass">
        <p>dataAndata</p>
            <input type="date" class="form-control" name="dataAndata" placeholder="gg/mm/aa">

        <p>dataRitorno</p>
            <input type="date" class="form-control" name="dataRitorno" placeholder="gg/mm/aa" disabled>
        </div>



        <div class="numero">
        <p>numeroAdulti</p>
            <input type="text" class="form-control" name="numeroadulti" placeholder="numero">
            <!--<select name="numeroadulti">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
            </select>-->

        </div>

        <input class="btn btn-success" type="submit" value="cerca">


    </form>
</div>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="js/bootstrap.min.js"></script>



</body>
</html>