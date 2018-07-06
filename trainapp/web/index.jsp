
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding: 10px;
            }
            div{
                
                width: 55%;
                border: 1px solid black;
                border-radius: 5px;
                background-color: lightslategray;
            }
            body{
                
                background: #ffffff  repeat 0 0;
            }
            
        </style>
    </head>
    
    <body>
    <center><h1>prenotazione</h1></center>
    <center>
        <div>
            <form action="viewviaggi.jsp"  >
            <table>
                <tr>
                <th>partenza</th>
                <td><input type="text" class="form-control" name="partenza" placeholder="partenza"></td>
                 <th>dataAndata</th>
                <td><input type="text" class="form-control" name="dataAndata" placeholder="gg/mm/aa"></td>
                </tr>
                <tr>
                <th>arrivo</th>
                <td><input type="text" class="form-control" name="arrivo" placeholder="arrivo"></td>
                <th>dataRitorno</th>
                <td><input type="text" class="form-control" name="dataRitorno" placeholder="gg/mm/aa"></td>
                </tr>
                <tr>
                <form action="">
                <fieldset>
                Andata <input type="radio" name="modalita" value="ANDATA"/>
                Andtata/Ritorno <input type="radio" name="modalita" value="ANDATA_RITORNO"/>
                </fieldset>
                </form>
                </tr>
                <tr>
                <th>numeroAdulti</th>
                <td ><input type="text" class="form-control" name="numeroadulti" placeholder="numero"></td>
                </tr>    
                <tr>
                <td colspan="5" style="text-align: center"><input class="btn btn-success" type="submit" value="cerca"></td>
                </tr>
                
            </table>
                </form>
        
        </div>
    </center>
    </body>
</html>