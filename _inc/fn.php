<?php


function objectToarray($data)
{
    $array = (array)$data;
    foreach($array as $key => &$field){
        if(is_object($field))$field = $this->objectToarray($field);
    }
    return $array;
}


function insert_record_to_DB($data, $err) {

    $sql = 'INSERT INTO tasks (title, done, dt_in, body) VALUES (?, ?, ?, ?)';
    if($stmt = mysqli_prepare($GLOBALS['db_link'], $sql)){
        mysqli_stmt_bind_param($stmt, "sdss", $data->title, $data->done, $data->dt_in, $data->body);
        mysqli_stmt_execute($stmt);
    } else {
        $err = "ERROR: Could not prepare query: $sql. ".mysqli_error($link);;
        return false;
    }
    return true;
}

function delete_record_from_DB($data) { // delete from ".$SITE[db_name].".".$ssq." where id='".$id."'";
    $sql = "DELETE FROM  tasks WHERE id = (?)";
    if($stmt = mysqli_prepare($GLOBALS['db_link'], $sql)){
        mysqli_stmt_bind_param($stmt, "d", $data->id);
    }
}
function update_record_in_DB($data) {
    $sql = "INSERT INTO tasks (title, done, dt_in, body) VALUES (?, ?, ?, ?)";
    if($stmt = mysqli_prepare($GLOBALS['db_link'], $sql)){
        mysqli_stmt_bind_param($stmt, "ssss", $data->title, $data->done, $data->dt_in, $data->body);
    }

}

function get_records_from_DB() {
    $sql = "SELECT * FROM tasks WHERE 1";
    $result = mysqli_query($GLOBALS['db_link'], $sql);
    if(!$result){
        $GLOBALS['err'] = "Не удалось сделать выборку из БД";
        return false;
    }
    echo '<table class="table"><tr>
        <th>#</th>
        <th>title</th>
        <th>done</th>
        <th>dt_in</th>
        <th>description</th>
        <th>action</th>
    </tr>';
    if(mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_array($result)) {
            echo '<tr>
            <td>'.$row['id'].'</td>
            <td>'.$row['title'].'</td>
            <td>'.$row['done'].'</td>
            <td>'.$row['dt_in'].'</td>
            <td>'.$row['body'].'</td>
            <td><a href="?action=delete&id='.$row['id'].'">delete</a> | <a href="?action=edit&id='.$row['id'].'">edit</a></td>
            </tr>';
        }
    } else {
        echo '<tr><td colspan="6"> NO ANY DATA </td></tr>';
    }

    echo '</table>';
}

function print_err($val) {
    echo('<Br><br><h5 style="color:#990000;">SHIT ON ME: '.($val ? $val : $GLOBALS['err'] ? $GLOBALS['err'] : 'UNKNOWN ERROR OCCURED').'</h5>');
}
/*
    if(user_rights("atach|apdate"))
        $upd_res=upload_user_file("file", $_REQUEST['object_id'], "task", false, true);
    if($upd_res) {   header($_SERVER["SERVER_PROTOCOL"].' 200 OK', true, 200); die;}
    else {header($_SERVER["SERVER_PROTOCOL"].' 501 Not Implemented', true, 501); die;}
*/


////////    выводит сообщение с заголовком что это json и завершает работу скрипта
function echo_server_response($msg)
{
    header("Content-Type: application/json; charset=windows-1251");
    echo $msg;
    exit();
}

function json_safe_str($str) {

    return preg_replace('/\t/', '', str_replace("\"", "&quot;", str_replace("]","", str_replace("[", "", " ".$str))));
}
////////    выводит сообщение с заголовком что это json и завершает работу скрипта
function echo_json($msg)
{
    header("Content-Type: application/json; charset=windows-1251");
    echo $msg;
    exit();
}



?>

