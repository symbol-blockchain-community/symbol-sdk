<?php
  require_once './src/symbol/models_copy.php';
  use symbol\Amount;
  $amount = new Amount(1000000);
  echo bin2hex($amount->serialize());
