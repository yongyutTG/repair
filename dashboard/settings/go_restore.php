<?php
require("../../core/mysql_restore.core.php");
$file_name = isset($_GET['fn']) ? basename($_GET['fn']) : '';
$backup_dir = realpath('../../backup');
$backup_file = $backup_dir && $file_name !== '' ? realpath($backup_dir.DIRECTORY_SEPARATOR.$file_name) : false;
$restore_error = '';

if (!$backup_file || dirname($backup_file) !== $backup_dir || strtolower(pathinfo($backup_file, PATHINFO_EXTENSION)) !== 'sql') {
	$restore_error = 'ไม่พบไฟล์สำรองข้อมูลที่ถูกต้อง';
} else {
	$restore_obj = new MySQL_Restore();
	$restore_obj->server = DB_HOST;
	$restore_obj->username = DB_USERNAME;
	$restore_obj->password = DB_PASSWORD;
	$restore_obj->database = DB_NAME;
	if (!$restore_obj->Execute($backup_file, MSR_FILE, false, false)) {
		$restore_error = 'กู้คืนข้อมูลไม่สำเร็จ: '.$restore_obj->error;
	}
}
?>
<script language="javascript">
	<?php if ($restore_error !== '') { ?>
	alert(<?php echo json_encode($restore_error, JSON_UNESCAPED_UNICODE); ?>);
	<?php } else { ?>
	alert("กู้คืนข้อมูลสำเร็จ");
	<?php } ?>
	window.location="../index.php?p=setting_backup&sts=rcomp";
</script>
