<?php
namespace SymbolSdk\Network;

use RangeException;

class NetworkLocator
{
  public static function findByName($networks, $singleOrMultipleNames)
  {
    $names = is_array($singleOrMultipleNames) ? $singleOrMultipleNames : [$singleOrMultipleNames];
    $matchingNetwork = null;

    foreach ($networks as $network) {
      if (in_array($network->name, $names)) {
        $matchingNetwork = $network;
        break;
      }
    }

    if (null === $matchingNetwork) {
      throw new RangeException("No network found with name '" . implode(', ', $names) . "'");
    }

    return $matchingNetwork;
  }

  public static function findByIdentifier($networks, $singleOrMultipleIdentifiers)
  {
    $identifiers = is_array($singleOrMultipleIdentifiers) ? $singleOrMultipleIdentifiers : [$singleOrMultipleIdentifiers];
    $matchingNetwork = null;

    foreach ($networks as $network) {
      if (in_array($network->identifier, $identifiers)) {
        $matchingNetwork = $network;
        break;
      }
    }

    if (null === $matchingNetwork) {
      throw new RangeException("No network found with name '" . implode(', ', $identifiers) . "'");
    }

    return $matchingNetwork;
  }
}
