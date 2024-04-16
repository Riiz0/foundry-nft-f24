// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {DynamicNFT} from "../src/DynamicNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployDynamicNFT is Script {
    function run() external returns (DynamicNFT) {
        string memory sadSvg = vm.readFile("./images/DynamicNFT/sad.svg");
        string memory happySvg = vm.readFile("./images/DynamicNFT/happy.svg");

        vm.startBroadcast();
        DynamicNFT dynamicNFT = new DynamicNFT(
            svgToImageURI(happySvg), 
            svgToImageURI(sadSvg)
            );
        vm.stopBroadcast();
        return dynamicNFT;

    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
