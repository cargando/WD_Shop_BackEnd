<?
$GLOBALS['db_link'] = false;
$GLOBALS['err'] = '';

function connect_to_DB() {
    // $GLOBALS['db_link'] = $link = mysqli_connect("localhost", "root", "root", "students");
    $ENV = 'dev';
    $host = "localhost";
    $dbname = $ENV === "dev" ? "students" : "a0310311_students";
    $user = $ENV === "dev" ? "root" : "a0310311";
    $pass = $ENV === "dev" ? "root" : "diduurxiwa";

    try {
        $GLOBALS['db_link'] = new PDO('mysql:host=' . $host . ';dbname=' . $dbname, $user, $pass);
    } catch (PDOException $e) {
        die("ERROR: Could not connect. " . $e->getMessage());

    }
    // echo "Connect Successfully.";
}

connect_to_DB();

