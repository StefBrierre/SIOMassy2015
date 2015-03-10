<?php

/** Helper class for HTML forms */
class FormHelper {

  /**
   * Print a HTML select, with a name $selectName, and options
   * got from the array $rows. Each item of $rows is an associative
   * array with keys "value" and "text". The optional argument
   * $selectedValue is the value which must be selected by default.
   * When the page has parameters (form already submited), the
   * value choosen by the user is automatically selected. If
   * $selectedValue is specified, it is then ignored.
   * <br/>Value and Text are utf8 encded.
   * <br/>Example:
   * <pre>$rows = array(array("value" => "FR", "text" => "French"),
   *   array("value" => "EN", "text" => "English");
   * printSelect("language", $rows);
   * </pre>
   * @param type $selectName
   * @param type $rows
   */
  public static function printSelect($selectName, $rows, $selectedValue = NULL) {
    print "<select name='$selectName'>";
    foreach ($rows as $row) {
      $value = utf8_encode($row["value"]);
      $text = utf8_encode($row["text"]);
      $selected = "";
      if ((array_key_exists($selectName, $_REQUEST) && $_REQUEST[$selectName] == $value) || (!array_key_exists($selectName, $_REQUEST) && $selectedValue == $value)) {
        $selected = "selected='selected'";
      }
      print "<option value='$value' $selected>$text</option>";
    }
    print "</select>";
  }

}
