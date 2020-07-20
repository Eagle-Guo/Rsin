<html>
<head>
  <title>Hello, World! Sample App - Intuit</title>
  <link rel="stylesheet" type="text/css" href="../static/css/style.css" th:href="@{css/style.css}"/>
</head>
<body>
  <h3>Welcome to Intuit's Hello, World! Sample App.</h3>
  Before using this app, please make sure you do the following:
  <ul>
    <li>
      Update application.properties with your Client ID and Client Secret (found on
      <a href="https://developer.intuit.com">developer.intuit.com</a>
      ).
    </li>

    <li>
      In <a href="https://developer.intuit.com">developer.intuit.com</a>,
      add an allowed Redirect URI to this sample app. (application.properties - OAuth2AppRedirectUri value:
      <a href="http://localhost:8080/oauth2redirect">http://localhost:8080/oauth2redirect</a>
      )
    </li>
  </ul>
  <br /><br /><br />

 
  <!-- Connect To QuickBooks Button -->
  <b>Connect To QuickBooks</b><br />
  <a class="imgLink" onclick="launchPopup('connectToQuickbooks');" href="#">
    <img
      style="height: 40px"
      src="../static/images/C2QB_white_btn_lg_default.png"
      src="@{/images/C2QB_white_btn_lg_default.png}"
    />
  </a>
  <br /><br /><br />


  
  <script>
  function launchPopup(path) {
    var win;
    var checkConnect;
    alert(path);
    var parameters = "location=1,width=800,height=650";
    parameters += ",left=" + (screen.width - 800) / 2 + ",top=" + (screen.height - 650) / 2;
    // Launch Popup
    win = window.open(path, 'connectPopup', parameters);
  }
</script>

</body>
</html>