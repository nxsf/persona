// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Persona
 * @author Interplanetary Org
 *
 * Persona is a contract that allows users to create a profile off-chain
 * by emitting gas-efficient events.
 *
 * A profile consists of:
 *
 * - a PFP (ProFile Picture) {NFT},
 * - a BGP (BackGround Picture) {NFT},
 * - a human-readable PFA (ProFile About) string,
 * - and a CBOR-encoded metadata bytes.
 *
 * There is basic user profile, which acts as the default one,
 * and per-application profile, which augments the basic.
 */
contract Persona {
    /// A Non-Fungible Token (ERC721 or ERC1155) struct.
    struct NFT {
        address contractAddress;
        uint256 tokenId;
    }

    /// Emitted when {account} sets its basic PFP (ProFile Picture).
    /// It's up to the client to check the NFT ownership dynamically.
    event SetBasicPfp(
        address indexed account,
        address contractAddress,
        uint256 tokenId
    );

    /// Emitted when {account} sets its basic BGP (BackGround Picture).
    /// It's up to the client to check the NFT ownership dynamically.
    event SetBasicBgp(
        address indexed account,
        address contractAddress,
        uint256 tokenId
    );

    /// Emitted when an {account} sets its basic PFA (ProFile About).
    event SetBasicPfa(address indexed account, string pfa);

    /// Emitted when an {account} sets its basic CBOR-encoded metadata.
    event SetBasicMetadata(address indexed account, bytes metadata);

    /// Emitted when {account} sets its per-application PFP (ProFile Picture).
    /// It's up to the client to check the NFT ownership dynamically.
    event SetAppPfp(
        address indexed account,
        address indexed app,
        address contractAddress,
        uint256 tokenId
    );

    /// Emitted when {account} sets its per-application BGP (BackGround Picture).
    /// It's up to the client to check the NFT ownership dynamically.
    event SetAppBgp(
        address indexed account,
        address indexed app,
        address contractAddress,
        uint256 tokenId
    );

    /// Emitted when an {account} sets its per-application PFA (ProFile About).
    event SetAppPfa(address indexed account, address indexed app, string pfa);

    /// Emitted when an {account} sets its per-application CBOR-encoded metadata.
    event SetAppMetadata(
        address indexed account,
        address indexed app,
        bytes metadata
    );

    /// Emit {SetBasicPfp} for the sender.
    function setBasicPfp(address contractAddress, uint256 tokenId) public {
        emit SetBasicPfp(msg.sender, contractAddress, tokenId);
    }

    /// Emit {SetBasicBgp} for the sender.
    function setBasicBgp(address contractAddress, uint256 tokenId) public {
        emit SetBasicBgp(msg.sender, contractAddress, tokenId);
    }

    /// Emit {SetBasicPfa} for the sender.
    function setBasicPfa(string memory pfa) public {
        emit SetBasicPfa(msg.sender, pfa);
    }

    /// Emit {SetBasicMetadata} for the sender.
    function setBasicMetadata(bytes memory metadata) public {
        emit SetBasicMetadata(msg.sender, metadata);
    }

    /// Emit {SetAppPfp} for the sender.
    function setAppPfp(
        address app,
        address contractAddress,
        uint256 tokenId
    ) public {
        emit SetAppPfp(msg.sender, app, contractAddress, tokenId);
    }

    /// Emit {SetAppBgp} for the sender.
    function setAppBgp(
        address app,
        address contractAddress,
        uint256 tokenId
    ) public {
        emit SetAppBgp(msg.sender, app, contractAddress, tokenId);
    }

    /// Emit {SetAppPfa} for the sender.
    function setAppPfa(address app, string memory pfa) public {
        emit SetAppPfa(msg.sender, app, pfa);
    }

    /// Emit {SetAppMetadata} for the sender.
    function setAppMetadata(address app, bytes memory metadata) public {
        emit SetAppMetadata(msg.sender, app, metadata);
    }
}
