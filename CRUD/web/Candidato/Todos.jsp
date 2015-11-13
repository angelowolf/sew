<%-- 
    Document   : candidatos
    Created on : 10/11/2015, 00:01:19
    Author     : angelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidatos</title>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="container">
            <s:actionmessage theme="bootstrap"/>
            <a href="AltaModificacion.jsp"class="pull-left col-md-offset-10">Nuevo Candidato</a>
            <!--            <div class="pagination pagination-right">
                            <a href="#">Primero</a> 
                            <a href="#">Anterior</a>  {0} 
                            <a href="{3}">Siguiente</a> 
                            <a href="{4}">Ultimo</a>
                        </div>
            
                        <div class="pagination pagination-right">
            
                            <ul>
                                <li class="active"><a href="#">Primero</a></li> 
                                <li class="active"><a href="#">Anterior</a></li> {0} 
                                <li><a href="{3}">Siguiente</a></li>
                                <li><a href="{4}">Ultimo</a></li>
                            </ul>
                        </div>-->
            <div class=" col-md-10 col-md-offset-1">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>
                                Id
                            </th>
                            <th>
                                Nombre
                            </th>    
                            <th>
                                Funciones
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="candidatoLista" status="candidatoStatus">
                            <tr>
                                <td><s:property value="idCandidato"/></td>
                                <td><s:property value="nombre"/></td>
                                <td>
                                    <s:form action="editar" id="editURL" style="display:inline-block;">
                                        <s:hidden name="idCandidato" value="%{idCandidato}"/>
                                        <s:submit value="Editar" action="%{editURL}" cssClass="btn btn-info"/>
                                    </s:form>
                                    <s:form action="eliminar" id="deleteURL" style="display:inline-block;">
                                        <s:hidden name="idCandidato" value="%{idCandidato}"/>
                                        <s:submit value="Eliminar" action="%{deleteURL}" cssClass="btn btn-danger"/>
                                    </s:form>
                                </td>
                            </tr>
                        </s:iterator>  
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
