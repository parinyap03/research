<?php

session_start();

?>

<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="index.css">

</head>

<body>
  <?php if (isset($_SESSION['success'])) : ?>
    <div class="success">
      <?php
      echo $_SESSION['success'];
      ?>
    </div>
  <?php endif; ?>


  <?php if (isset($_SESSION['error'])) : ?>
    <div class="error">
      <?php
      echo $_SESSION['error'];
      ?>
    </div>
  <?php endif; ?>

  <form class="modal-content animate" action="login.php" method="post">

    <div class="container">
      <h1>Sign In</h1>
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" id="uname" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
      <button type="submit" value="login">Login</button>
      <!-- <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label> -->
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <!-- <span class="psw">Forgot <a href="#" style="color:rgb(255, 0, 0)">password?</a></span> -->
    </div>
  </form>
  </div>

</body>

</html>
<?php

if (isset($_SESSION['success']) || isset($_SESSION['error'])) {
  session_destroy();
}

?>