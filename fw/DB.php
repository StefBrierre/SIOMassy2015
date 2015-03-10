<?php
/** Database of the project. We assume there is only one.
 * If there are many ones, add a $dbName parameter to getConnection.
 */
class DB {

  public static $DB_NAME = "db524752934";
  public static $USER = "dbo524752934";
  public static $PASSWORD = "Greta2014";

  /** Get a connection to the DB, in UTF-8 */
  public static function getConnection() {
    // DB configuration
    $dsn = "mysql:dbname=".DB::$DB_NAME.";host=localhost";
    // Get a DB connection with PDO library
    $bdd = new PDO($dsn, DB::$USER, DB::$PASSWORD);
    // Set communication in utf-8
    $bdd->exec("SET character_set_client='utf-8'");
    return $bdd;
  }

  /** Get a list of pairs value/text, to feed HTML select lists.
   * You need to get "value" and "text" columns in order to feed
   * selects.
   * Usage:
   * <pre>
   * $sql = "SELECT person_id AS value, name AS text FROM person";
   * $list = DB::getMap($sql);
   * printSelect("person_id", $list);
   */
  public static function getMap($sql) {
    $db = DB::getConnection();
    $stmt = $db->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll();
  }
}
