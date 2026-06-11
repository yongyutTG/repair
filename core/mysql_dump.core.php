<?php 
function datadump($table, $drop = true, $stripapos = true)
{
  $result     = "# Dump of $table \n";
  $result    .= "# Dump DATE : " . date("d-M-Y") ."\n\n";
  $conn = $GLOBALS['DB_CONN'] ?? null;
  if ( $drop ) {
    if ( $stripapos ) {
      $result    .= "DROP TABLE IF EXISTS $table;\n";
      // dump create table
      $createTableQuery = $conn ? mysqli_query($conn, "SHOW CREATE TABLE `".$table."`;") : false;
      $createTable      = $createTableQuery ? mysqli_fetch_row($createTableQuery) : null;
      $result          .= $createTable ? str_replace('`', '', $createTable[1]).";\n\n\n\n" : "";  
    } else {
      $result    .= "DROP TABLE IF EXISTS `$table`;\n";
      // dump create table
      $createTableQuery = $conn ? mysqli_query($conn, "SHOW CREATE TABLE `".$table."`;") : false;
      $createTable      = $createTableQuery ? mysqli_fetch_row($createTableQuery) : null;
      $result          .= $createTable ? $createTable[1].";\n\n\n\n" : "";    
    }
  } else {
    $result    .= "TRUNCATE TABLE `$table`;\n";
  }
   
  $query      = $conn ? mysqli_query($conn, "SELECT * FROM `".$table."`") : false;
  $num_fields = $query ? @mysqli_num_fields($query) : 0;
  $numrow     = $query ? mysqli_num_rows($query) : 0;
  
  $columnsRes = $conn ? mysqli_query($conn, "SHOW COLUMNS FROM `".$table."`;") : false;
  $columns = array();
  
  while ( $columnsRes && ($row = mysqli_fetch_assoc($columnsRes)) ) {
    $columns[$row['Field']] = $row;
  }
  
  while ( $query && ($row = mysqli_fetch_assoc($query)) ) {
    $result .= "INSERT INTO `".$table."` VALUES(";
  
    $fields = array();
  
    foreach ( $row as $field => $data ) {
      if ( strpos(strtolower($columns[$field]['Type']), 'int') !== false 
        || strpos(strtolower($columns[$field]['Type']), 'float') !== false
        || strpos(strtolower($columns[$field]['Type']), 'tinyint') !== false ) {
        if ( strlen($data) > 0 ) {
          $fields[] = $data;
        } else {
          if ( strtolower($columns[$field]['Null']) == 'no' ) {
            $fields[] = 0;
          } else {
            $fields[] = "NULL";
          }        
        }
      } elseif ( strpos(strtolower($columns[$field]['Type']), 'datetime') !== false ) {
        if ( strlen($data) > 0 ) {       
          $fields[] = "\"".$data."\"" ;
        } else {
          if ( strtolower($columns[$field]['Null']) == 'no' ) {
            $fields[] = '""';
          } else {
            $fields[] = "NULL";
          }
        }
      } elseif ( strpos(strtolower($columns[$field]['Type']), 'time') !== false ) {
        if ( strlen($data) > 0 ) {
          $fields[] = "\"".$data."\"" ;
        } else {
          if ( strtolower($columns[$field]['Null']) == 'no' ) {
            $fields[] = '""';
          } else {
            $fields[] = "NULL";
          }
        }        
      } elseif ( strpos(strtolower($columns[$field]['Type']), 'varchar') !== false
       || strpos(strtolower($columns[$field]['Type']), 'text') !== false
       || strpos(strtolower($columns[$field]['Type']), 'longtext') !== false
       || strpos(strtolower($columns[$field]['Type']), 'mediumtext') !== false ) {
        $data = $conn ? mysqli_real_escape_string($conn, $data) : addslashes($data);
        //$data = trim(ereg_replace("\n", "\\n", $data));
        if ( strlen($data) > 0 ) {
          $fields[] = "\"".$data."\"" ;
        } else {
          if ( strtolower($columns[$field]['Null']) == 'no' ) {
            $fields[] = '""';
          } else {
            $fields[] = "NULL";
          }
        }        
      } else {
        // $columns[$field]['Type'] will contain the datatype
        if ( strlen($data) > 0 ) {
          $fields[] = "\"".$data."\"" ;
        } else {
          if ( strtolower($columns[$field]['Null']) == 'no' ) {
            $fields[] = '""';
          } else {
            $fields[] = "NULL";
          }
        }        
      }
    }
    $result .= implode(',', $fields);
    $result .= ");\n";
  }
  return $result . "\n\n\n";
}
