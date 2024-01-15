<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <div>
        <h1>Login</h1>
        <?php
			error_reporting(E_ALL);
			ini_set('display_errors', 1);
		
			if ($_SERVER["REQUEST_METHOD"] == "POST") {
				$username = $_POST['username'];
				$password = $_POST['password'];

				if ($username == 'admin' && $password == 'admin') {
					header("Location: View.php");
					exit();
				} else {
					echo "<p>Incorrect username or password.</p>";
				}
			}
        ?>

        <form action="" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <br>
            <br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <br>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>