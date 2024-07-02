<?php

namespace SymbolSdk\Network;

use RangeException;

/**
 * Provides utility functions for finding a network.
 */
class NetworkLocator
{
  /**
   * Finds a network with a specified name within a list of networks.
   * @param array networks List of networks to search.
   * @param array|string singleOrMultipleNames Names for which to search.
   * @return Network First network with a name in the supplied list.
   */
  public static function findByName($networks, $singleOrMultipleNames): Network
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

  /**
   * Finds a network with a specified identifier within a list of networks.
   * @param array networks List of networks to search.
   * @param array|int singleOrMultipleIdentifiers Identifiers for which to search.
   * @return Network First network with an identifier in the supplied list.
   */
  public static function findByIdentifier($networks, $singleOrMultipleIdentifiers): Network
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
