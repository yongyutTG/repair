<?php
//--------------------------------------
// Clear@Core->connect (Updated to MySQLi)
// Original: Sep, 1 2013
// Programmer : khumphol tearmpin
// Updated: 2026 (PHP 7.0+ compatible)
// Website : http://clearprojects.in.th
//--------------------------------------

class clear_db{
	private $connection;

	function my_sql_connect($host,$username,$password,$dbname){
		$this->connection = mysqli_connect($host, $username, $password, $dbname) or die(mysqli_connect_error());
		mysqli_set_charset($this->connection, "utf8mb4");
		// expose global compat connection for legacy mysql_* wrappers
		$GLOBALS['DB_CONN'] = $this->connection;
		return true;
	}
	
	function my_sql_query($field,$table,$event){
		if($field == NULL && $event == NULL){
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table);
		}else if($field == NULL){
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table." WHERE ".$event);
		}else if($event == NULL){
			$objQuery=mysqli_query($this->connection, "SELECT ".$field." FROM ".$table);
		}else {
			$objQuery=mysqli_query($this->connection, "SELECT ".$field." FROM ".$table." WHERE ".$event);
		}
		$objShow=mysqli_fetch_object($objQuery);
		return $objShow;
	}
	
	function my_sql_select($field,$table,$event){
		if($field == NULL && $event == NULL){
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table);
		}else if($field == NULL){
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table." WHERE ".$event);
		}else if($event == NULL){
			$objQuery=mysqli_query($this->connection, "SELECT ".$field." FROM ".$table);
		}else {
			$objQuery=mysqli_query($this->connection, "SELECT ".$field." FROM ".$table." WHERE ".$event);
		}
		return $objQuery;
	}
	
	function my_sql_show_rows($table,$event){
		if($event != NULL){
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table." WHERE ".$event);
		}else{
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table);
		}
		$objShow=mysqli_num_rows($objQuery);
		return $objShow;
	}
	
	function my_sql_show_field($table,$event){
		if($event != NULL){
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table." WHERE ".$event);
		}else{
			$objQuery=mysqli_query($this->connection, "SELECT * FROM ".$table);
		}
		$objShow=mysqli_num_fields($objQuery);
		return $objShow;
	}
	
	function my_sql_update($table,$set,$event){
		if($event != NULL){
			return mysqli_query($this->connection, "UPDATE ".$table." SET ".$set." WHERE ".$event);
		}else{
			return mysqli_query($this->connection, "UPDATE ".$table." SET ".$set);
		}
	}
	
	function my_sql_insert($table,$set){
		return mysqli_query($this->connection, "INSERT INTO ".$table." SET ".$set);
	}
	
	function my_sql_delete($table,$event){
		if($event != NULL){
			return mysqli_query($this->connection, "DELETE FROM ".$table." WHERE ".$event);
		}else{
			return mysqli_query($this->connection, "DELETE FROM ".$table);
		}
	}
	
	function my_sql_string($string){
		return mysqli_query($this->connection, $string);
	}
	
	function my_sql_set_utf8(){
		mysqli_set_charset($this->connection, "utf8mb4");
	}
	
	function my_sql_set_tis620(){
		mysqli_set_charset($this->connection, "tis620");
	}
	
	function my_sql_close(){
		if($this->connection){
			return mysqli_close($this->connection);
		}
		return false;
	}
}
?>