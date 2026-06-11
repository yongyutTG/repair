<?php
// Safe replace script: replace legacy mysql_* fetch/num functions with mysqli_* equivalents
$root = __DIR__ . '/../';
$exclude = [
    realpath($root . 'core/mysql_compat.php'),
    realpath($root . 'core/connect.core.php'),
    realpath($root . 'core/config.core.php'),
];
$patterns = [
    'mysql_fetch_object' => 'mysqli_fetch_object',
    'mysql_fetch_assoc' => 'mysqli_fetch_assoc',
    'mysql_fetch_row' => 'mysqli_fetch_row',
    'mysql_num_rows' => 'mysqli_num_rows',
    'mysql_num_fields' => 'mysqli_num_fields',
];
$it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($root));
$filesChanged = 0;
foreach ($it as $file) {
    if (!$file->isFile()) continue;
    if (pathinfo($file, PATHINFO_EXTENSION) !== 'php') continue;
    $path = $file->getRealPath();
    if (in_array($path, $exclude)) continue;
    $contents = file_get_contents($path);
    $new = $contents;
    foreach ($patterns as $from => $to) {
        $new = str_replace($from . '(', $to . '(', $new);
    }
    if ($new !== $contents) {
        // backup
        copy($path, $path . '.bak');
        file_put_contents($path, $new);
        $filesChanged++;
        echo "Patched: $path\n";
    }
}

echo "Done. Files changed: $filesChanged\n";
?>