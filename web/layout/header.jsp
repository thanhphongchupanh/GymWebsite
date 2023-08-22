<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

    .header {
      background-color: #333;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 20px;
    }

    .logo {
      position: relative;
      left: 20px;
      flex: 1;
      font-size: 24px;
      font-weight: bold;
    }

    .search-bar {
      position: relative;
      display: flex;
      align-items: center;
      flex: 2;
    }

    .search-input {
      width: 80%;
      padding: 8px;
      border: none;
      border-radius: 20px;
      padding-right: 30px;
      /* Add padding for the icon */
    }

    .search-icon {
      position: absolute;
      top: 55%;
      right: 130px;
      transform: translateY(-50%);
      font-size: 20px;
      color: #999;
    }

    .user-menu {
      flex: 1;
      text-align: right;
      display: flex;
      align-items: center;
      justify-content: flex-end;
      padding-right: 30px;
    }

    .user-icon,
    .cart-icon {
      display: flex;
      align-items: center;
      margin: 0 18px;
      font-size: 17px;
      color: white;
      white-space: nowrap;
      /* Prevent text from wrapping */
    }

    a {
      color: white;
      text-decoration: none;
      transition: color 0.3s, border-bottom 0.3s;
    }

    a:hover {
      color: #949090;
      /* Màu ch? khi hover */
    }
  </style>
</head>

<body>
  <div class="header">
    <div class="logo">Next evo</div>
    <div class="search-bar">
      <input class="search-input" type="text" placeholder="Search...">
      <span class="search-icon">
        <ion-icon name="search-outline"></ion-icon>
      </span>
    </div>
    <div class="user-menu">
      <div class="user-icon">
        <ion-icon style="font-size: 20px; margin-right: 5px;" name="person-circle-outline"></ion-icon>
        <a href="login.jsp">Account</a>
      </div>
      <div class="cart-icon">
        <ion-icon style="font-size: 20px; margin-right: 5px;" name="cart-outline"></ion-icon>
        <a href="login.html">Your Cart</a>
      </div>
      <div class="user-icon">
        <ion-icon style="font-size: 20px; margin-right: 5px;" name="call-outline"></ion-icon>
        <a href="#footer">Contact</a>
      </div>
    </div>
  </div>
</body>

</html>