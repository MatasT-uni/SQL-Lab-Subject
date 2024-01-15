<html>
<?php error_reporting(~E_NOTICE); ?>
<!-- link to the style sheet "default1.css"-->
<link rel="stylesheet" href="default1.css">

<!-- Add the given image "back.jpg" as illustrated (no repeat and cover the page) -->

<body background="back.jpg" style="background-repeat: no-repeat; background-size: cover;">

	<!-- Add php content to restrict only the user with password to enter -->

	<!-- php file begin-->

	<!-- Assign the variables for username and password (user name: Admin and Password: 1234)  -->

	<!-- // Perhaps you need this: session_start(); -->

	<!-- // Check if username is Admin and password is 1234 and confirm passwor	d is 1234 -->

	<p>
		<?php
		session_start(); // Start the session
		$username = $_POST['username']; // Assuming you're getting the username from a form
		$pass = $_POST['passwd']; // Assuming you're getting the password from a form
		$pass1 = $_POST['passwd1']; // Assuming you're getting the second password from a form

		if ($username == "Admin" && $pass == "1234" && $pass1 == "1234") {
			$_SESSION["username"] = $username;
			echo "<h1 style='font-family:Arial; font-weight: bold; font-size:200%; text-align:center;'> Welcome ";
			echo $_POST["title"], " ", $_POST["firstname"], " ", $_POST["lastname"], " !!!";
			echo "<br> </h1>";
			echo "	<img src='avatar.png' alt='Avatar' height='240'>";
			echo "<h3 style='font-family:Arial; font-weight: bold; font-size:170%;'>
			This is your profile </h3>";
			echo "<p>";
			echo "Name:", " ", $_POST["title"], " ", $_POST["firstname"], " ", $_POST["lastname"], "<br>";
			//--add "User Group: usergroup"-- 
			echo "User Group:", " ", $_POST["usergroup"], "<br>";
			//-- add "Email address: Email"-- 
			echo "Email:", " ", $_POST["email"], "<br>";
			//-- Find the gender and output "Gender: gender"-- 
			echo "Gender:", " ", $_POST["gender"], "<br>";
			echo "Age in years: 0", "<br>";
			//-- set default time zone--
			date_default_timezone_set("Asia/Bangkok");
			//-- Get the current date and time
			$currentDateTime = date('Y-m-d H:i:s');
			//-- print the login type as " Login time (local): time on date"-- 
			echo "Login time (local): " . $currentDateTime;
			echo "</p>";
			//<!-- change font to Arial, bold and font size to 150%-->
			echo '<p style="font-family: Arial; font-weight: bold; font-size:150%;"> Welcome to the CSS326 system <br></p>';
			echo '<p style="font-family: Arial"> Whether you are an experienced programmer or not, this website is intended for everyone who wishes to learn Database programming.
					There is no need to download anything - just click on the chapter you wish to begin from, and follow the instructions. <br> </p>';
			//<!-- Remeber how you formatted the links in previous lab-->
			echo '<ul id="menu">';
			echo '<li><a href="https://www.learn-php.org/en/Hello%2C_World%21" target="_blank">Hello World!</a></li>';
			echo '<li><a href="https://www.learn-php.org/en/Variables_and_Types" target="_blank"> Variables</a></li>';
			echo '<li><a href="https://www.learn-php.org/en/For_loops" target="_blank"> For Loops</a></li>';
			echo '<li><a href="https://www.learn-php.org/en/Functions" target="_blank"> Functions</a></li>';
			echo '<li><a href="https://www.learn-php.org/en/While_loops" target="_blank"> While loops</a></li>';
			echo '</ul>';
		//<!-- Change to bold, font to Arial and text size to 120% and Center the text-->
			echo '<p style="font-family:Arial; font-weight: bold; font-size:120%; text-align:center;"> Good Luck!</p>';
			echo '<button onclick="history.go(-1);">Back </button>';
		} else {
			echo "<h1>You do not have access to this page!</h1>";

			if (!isset($_SESSION["counter"])) { // Check if counter is NOT set
				
				$_SESSION["counter"] = 30; // Set counter to 30
				header("Refresh:1");
			} else { // If counter is set
				$_SESSION["counter"]--; // Retrieve counter value
				// Decrement the counter by 1
				echo "You will be given the redirecting button after 30 seconds <br>";
				for ($counter = 30; $counter > $_SESSION["counter"]; $counter--) {
					// Store the updated counter in the session
					echo "You will be redirected after $counter seconds.<br>";
				}
			}
			if ($_SESSION["counter"] == 0) { // If counter is 0
				$txt = "history.go(-1);";
				echo "<button onclick='$txt'>Back</button>";
				unset($_SESSION["counter"]);
			} else {
				header("Refresh:1"); // Keep refreshing the page
			}
		}

		exit; // Stop further processing the page

		?>
	</p>

	<!--php file end-->

	<!-- the heading is given as " Welcome Mr./Mrs./Ms. User Name", change the font to Arial, size of font to 200%, make the text appear in center-->
	<h1 style="font-family:Arial; font-weight: bold; font-size:200%; text-align:center;"> Welcome
		<?php echo $_POST["title"], " ", $_POST["firstname"], " ", $_POST["lastname"], " !!!"; ?><br> </h1>

	<!-- add the image "avatar.png", height to 240 pixels-->
	<img src="avatar.png" alt="Avatar" height="240">

	<!-- change the font to Arial,size of font to 170%-->
	<h3 style="font-family:Arial; font-weight: bold; font-size:170%;">
		This is your profile </h3>


	<!-- change the font to Arial-->
	<p>
		<?php
		echo "Name:", " ", $_POST["title"], " ", $_POST["firstname"], " ", $_POST["lastname"], "<br>";
		//--add "User Group: usergroup"-- 
		echo "User Group:", " ", $_POST["usergroup"], "<br>";

		//-- add "Email address: Email"-- 
		echo "Email:", " ", $_POST["email"], "<br>";

		//-- Find the gender and output "Gender: gender"-- 
		echo "Gender:", " ", $_POST["gender"], "<br>";

		echo "Age in years: 0", "<br>";

		//-- set default time zone--
		date_default_timezone_set("Asia/Bangkok");
		//-- Get the current date and time
		$currentDateTime = date('Y-m-d H:i:s');
		//-- print the login type as " Login time (local): time on date"-- 
		echo "Login time (local): " . $currentDateTime;


		?>
	</p>

	<!-- change font to Arial, bold and font size to 150%-->
	<p style="font-family: Arial; font-weight: bold; font-size:150%;"> Welcome to the CSS326 system <br></p>
	<p style="font-family: Arial">
		Whether you are an experienced programmer or not, this website is intended for everyone who wishes to learn Database programming.
		There is no need to download anything - just click on the chapter you wish to begin from, and follow the instructions. <br> </p>

	<!-- Remeber how you formatted the links in previous lab-->
	<ul id="menu">
		<li><a href="https://www.learn-php.org/en/Hello%2C_World%21" target="_blank">Hello World!</a></li>
		<li><a href="https://www.learn-php.org/en/Variables_and_Types" target="_blank"> Variables</a></li>
		<li><a href="https://www.learn-php.org/en/For_loops" target="_blank"> For Loops</a></li>
		<li><a href="https://www.learn-php.org/en/Functions" target="_blank"> Functions</a></li>
		<li><a href="https://www.learn-php.org/en/While_loops" target="_blank"> While loops</a></li>
	</ul>

	<!-- Change to bold, font to Arial and text size to 120% and Center the text-->
	<p style="font-family:Arial; font-weight: bold; font-size:120%; text-align:center;"> Good Luck!</p>
	<button onclick="history.go(-1);">Back </button>
</body>

</html>