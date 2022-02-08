<!DOCTYPE html>
<html>
  <head>
    <title>购买新的服务</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://polyfill.io/v3/polyfill.min.js?version=3.52.1&features=fetch"></script>
    <script src="https://js.stripe.com/v3/"></script>
  </head>
  <body>
    <section>
      <div class="product">
        <img src="https://i.imgur.com/EHyR2nP.png" alt="The cover of Stubborn Attachments" />
        <div class="description">
          <h3>服务总价格</h3>
          <h5>$1500.00</h5>
        </div>
      </div>
      <form action="/create-checkout-session" method="POST">
        <button type="submit" id="checkout-button">确定付款</button>
      </form>
    </section>
  </body>
</html>