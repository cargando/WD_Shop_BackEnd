<?php
// ini_set ("display_errors", "On");
error_reporting(E_ALL & ~E_NOTICE);
include("../_inc/db.php");
include("../_inc/fn.php");

$API_URL = explode("?",
    strtoupper(rtrim(str_replace("index.php", "", $_SERVER['REQUEST_URI']), '/')));

$response = new stdClass();
$response->data = null;
$response->error = null;
$result = [];
$gotUrl = true;
switch ($API_URL[0]) {
    case '/API/CATALOG/FIND':
        $result = getCatalog($_REQUEST);
        break;
    case '/API/CATALOG/RANGE':
        $result = getCatalogRange($_REQUEST);
        break;
    case '/API/REVIEW/FIND':
        $result = getReviews($_REQUEST);
        break;
    case '/API/IMAGE/FIND':
        $result = getImages($_REQUEST);
        break;
    case '/API/COLOR/FIND':
        $result = getColors($_REQUEST);
        break;
    case '/API/BRAND/FIND':
        $result = getBrands($_REQUEST);
        break;
    case '/API/CATEGORY/FIND':
        $result = getCategories($_REQUEST);
        break;
    default: $gotUrl = false;
}
if (!$gotUrl) {
    $response->error = new stdClass();
    $response->error->code = '2315';
    $response->error->title = "No such URL / API";
}
// json_decode($str, true);
if ($result['length']){
    $response->data = $result['data'];
}
$responseJSON = json_encode($response);
echo($responseJSON);
//echo $_SERVER['REQUEST_URI'];//.$_SERVER['PHP_SELF'];
//var_dump(explode("?", "/api/catalog/find"));
//


function getCatalog($f = null)
{
    $pdo = $GLOBALS['db_link']; // ->query($sql);
    $subSql = array();
    $sqlBind = array();
    if ($f['category']) {
        array_push($subSql, "category = :category");
        $sqlBind['category'] = $f['category'];
    }
    if ($f['colors']) {
        array_push($subSql, "colors = :colors");
        $sqlBind['colors'] = $f['colors'];
    }
    if ($f['brand']) {
        array_push($subSql, "brand = :brand");
        $sqlBind['brand'] = $f['brand'];
    }
    $sql = "SELECT cat.*, img.id 'img_id', img.url 'img_url' 
        FROM ec_catalog cat, ec_image img, ec_catalog_img ci
	    WHERE ". (count($subSql) ? implode(" AND ", $subSql) : '1')."
	    AND cat.id = ci.cid and ci.iid = img.id
	    GROUP BY cat.id";

    $stmt = $pdo->prepare($sql);
    foreach ($sqlBind as $key => $value) {
        $stmt->bindValue(':'.$key, $value);
    }
    $stmt->execute();
    $result = $stmt->fetchAll();

    return array("data" => $result, "length" => count($result));
}


function getReviews($f = null)
{
    $pdo = $GLOBALS['db_link']; // ->query($sql);
    $subSql = array();
    $sqlBind = array();
    if ($f['cid']) {
        array_push($subSql, "cid = :cid");
        $sqlBind['cid'] = $f['cid'];
    }
    $sql = "SELECT * FROM ec_feedback WHERE ". (count($subSql) ? implode(" AND ", $subSql) : '1');

    $stmt = $pdo->prepare($sql);
    foreach ($sqlBind as $key => $value) {
        $stmt->bindValue(':'.$key, $value);
    }
    $stmt->execute();
    $result = $stmt->fetchAll();

    return array("data" => $result, "length" => count($result));
}

function getCategories()
{
    $pdo = $GLOBALS['db_link']; // ->query($sql);
    $sql = "SELECT * FROM ec_category WHERE 1";

    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();

    return array("data" => $result, "length" => count($result));
}

function getCatalogRange()
{
    $pdo = $GLOBALS['db_link']; // ->query($sql);
    $sql = "SELECT MIN(price) as priceMin, MAX(price) as priceMax, MIN(available) as availableMin, MAX(available) as availableMax 
        FROM ec_catalog WHERE 1";

    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();

    return array("data" => $result, "length" => count($result));
}

function getBrands($f)
{
    $pdo = $GLOBALS['db_link']; // ->query($sql);
    $subSql = array();
    $sqlBind = array();

    if ($f['bid']) {
        array_push($subSql, "bid = :bid");
        $sqlBind['cid'] = $f['cid'];
    }
    $sql = "SELECT * FROM ec_brands WHERE ". (count($subSql) ? implode(" AND ", $subSql) : '1');

    $stmt = $pdo->prepare($sql);
    foreach ($sqlBind as $key => $value) {
        $stmt->bindValue(':'.$key, $value);
    }
    $stmt->execute();
    $result = $stmt->fetchAll();

    return array("data" => $result, "length" => count($result));
}

function getColors()
{
    $pdo = $GLOBALS['db_link']; // ->query($sql);
    $sql = "SELECT * FROM ec_colors WHERE 1";

    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();

    return array("data" => $result, "length" => count($result));
}

function getImages($f = [])
{
    $pdo = $GLOBALS['db_link']; // ->query($sql);
    $sqlBind = array();

    if (!$f['cid']) {
        return array();
    }
    $sqlBind['cid'] = $f['cid'];

    $sql = "SELECT ec_image.* 
        FROM ec_image, ec_catalog_img 
        WHERE ec_catalog_img.iid = ec_image.id AND ec_catalog_img.cid=:cid ";

    $stmt = $pdo->prepare($sql);
    foreach ($sqlBind as $key => $value) {
        $stmt->bindValue(':'.$key, $value);
    }
    $stmt->execute();
    $result = $stmt->fetchAll();

    return array("data" => $result, "length" => count($result));
}
