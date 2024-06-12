<?php
require_once './symbol/models.php';
$amount = new Amount(20);
$a = $amount->serialize();
echo $a . "\n";
$b = Amount::deserialize('000000000001bf52');
echo $b->value . "\n";

$address = new UnresolvedAddress('687EDFCAC2816193757F3C36CAC0DD2EC85CC49E58573316');
echo $address->toString() . "\n";
