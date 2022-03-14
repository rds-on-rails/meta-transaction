/**
 * SPDX-License-Identifier:MIT
 */
pragma solidity ^0.7.6;

import "./BaseRelayRecipient.sol";
contract CaptureTheFlag is BaseRelayRecipient {

    event FlagCaptured(address previousHolder, address currentHolder);


    string public override versionRecipient = "2.2.0";
   
    address public currentHolder = address(0);
     constructor(address forwarder) {
      trustedForwarder == forwarder;
    }

    
    function captureTheFlag() external {
        address previousHolder = currentHolder;

        currentHolder = _msgSender();

        emit FlagCaptured(previousHolder, currentHolder);
    }
}
