<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="XMLForms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" style="text/css" href="deps/opt/bootstrap.css" />
    <title></title>
    <script src="jquery-3.3.1.min.js"></script>
    <script src="xml2json.js"></script>
</head>
<body>
  <div>
         <h4>XML:</h4>

        <textarea runat="server" id="xmlArea" cols="55" rows="15"></textarea>
    </div>
    <form>
       
    </form>
</body>
    <div id="res" class="alert"></div>
      <script type="text/javascript" src="deps/underscore.js"></script>
    <script type="text/javascript" src="deps/opt/jsv.js"></script>
    <script type="text/javascript" src="lib/jsonform.js"></script>
    <script type="text/javascript">
        var x2js = new X2JS();

        //function convertXml2JSon() {
        //   // $("#jsonArea").val(JSON.stringify(x2js.xml_str2json($("#xmlArea").val())));
        //}

        function convertJSon2XML(values) {
            debugger;
        $("#xmlArea").val(x2js.json2xml_str((values)));
        }

      $('form').jsonForm({
        schema: {
          name: {
            type: 'string',
            title: 'Name',
            required: true
          },
          age: {
            type: 'number',
            title: 'Age'
          }
        },
        onSubmit: function (errors, values) {
          if (errors) {
            $('#res').html('<p>I beg your pardon?</p>');
          }
          else {
              convertJSon2XML(values);
            $('#res').html('<p>Hello ' + values.name + '.' +
              (values.age ? '<br/>You are ' + values.age + '.' : '') +
              '</p>');
          }
        }
      });
    
        
    </script>
</html>
