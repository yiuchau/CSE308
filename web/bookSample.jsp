<%-- 
    Document   : bookSample
    Created on : May 8, 2016, 9:04:24 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Google Book Search Embedded Viewer API Example</title>
  </head>
  <body>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("books", "0");

      function initialize() {
        var number=${requestScope.isbn};
        var viewer = new google.books.DefaultViewer(document.getElementById('viewerCanvas'));
        viewer.load('ISBN:'+number, bookNotFound);
    }

    function bookNotFound() {
      document.getElementById('viewerCanvas').innerHTML="<h1>No Sample Available!</h1>";
    }       
      google.setOnLoadCallback(initialize);
    </script>
    <div id="viewerCanvas" style="width: 600px; height: 500px;"></div>
  </body>
</html>
