<!DOCTYPE html>
<html>
<head>
  <title>Checkout canceled</title>
  <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
    </style>
</head>

<body>
  <section class="section">
    <p style="padding: 32px;">Picked the wrong pay? Shop around then come back to pay!</p>
    <button class="button" onclick="postMessage();">
        Go Back
    </button>
  </section>
</body>
<script type='text/javascript'>
function postMessage(){
    Pay.postMessage('cancel');  
}
  
</script>

</html>