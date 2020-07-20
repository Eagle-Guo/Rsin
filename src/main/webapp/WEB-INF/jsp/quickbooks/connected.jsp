<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <title>OAuth2 Sample App - Intuit</title>
  <link rel="stylesheet" type="text/css" href="../static/css/style.css" th:href="@{css/style.css}"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script>
    if(window.opener) {
      window.opener.location.href = 'quickbooks/connected'
      window.close()
    }
    function apiCall() {
      $("#result").html('Loading...')
      $.get("/quickbooks/companies", function(data) {
        $("#result").html(data)
      })
    }
    
    function createInvoice() {
        $("#result").html('Loading...')
        $.get("/quickbooks/invoice", function(data) {
          $("#result").html(data)
        })
      }
    
    function invoiceCall() {
        $("#result").html('Loading...')
        $.get("/quickbooks/invoices", function(data) {
          $("#result").html(data)
        })
      }

  </script>
</head>
<body>
  <a href="quickbooks/home">Home</a>
  <h3>Connected!</h3>
  
  <div>
    <button onclick="apiCall()">QuickBooks CompanyInfoAPI Call</button>
    <br /><br />
    <button onclick="invoiceCall()">QuickBooks InvoiceAPI Call</button>
    <br /><br />
    <button onclick="createInvoice()">QuickBooks Create Invoice</button>
    <br /><br />
    <div><code id="result"></code></div>
    </div>
</body>
</html>