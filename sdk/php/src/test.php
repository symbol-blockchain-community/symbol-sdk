<?php
require_once './symbol/models.php';
$amount = new Amount(20);
$a = $amount->serialize();
echo $a . "\n";
$b = Amount::deserialize('000000000001bf52');
echo $b->value . "\n";
