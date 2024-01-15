<?php 
    require_once('connect.php');
	
    session_start();

    echo "<h1>Login Successfully</h1>";

    $sql = "SELECT * FROM `view_account`";
    $result = $mysqli->query($sql);

    if ($result) {
        echo "<table border='1'>
                <tr>
                    <th>Account No.</th>
                    <th>Name</th>
                    <th>Balance</th>
                </tr>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['Account No.']}</td>
                    <td>{$row['Name']}</td>
                    <td>{$row['Balance']}</td>
                  </tr>";
        }

        echo "</table>";
    } else {
        echo "<p>Error: " . $mysqli->error . "</p>";
    }

    $mysqli->close();
?>