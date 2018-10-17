/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract SimpleAudit at 0x1c46b8e52d0f85d2371405e54dc552adea2220bb
*/
pragma solidity ^0.4.16;
/*

    GOeureka SimpleAudit Smart Contract
    
    This contract stores a client and supplier reference between customers and 
    hotels on the blockchain for audit log purposes
    
    bytes32 goeureka_audit_ref 
    - a blockchain reference ID generated by goeureka
    
    string reference
    - a hash of two reference code from supplier and goeureka

*/
contract SimpleAudit {
    
    struct Audit {
        string reference;        // a hash of two reference code from supplier and goeureka
        bool exist;              // checks if the reference exists
    }
    
    address creator;
    mapping(bytes32 => Audit) public records;
    
    constructor() public {
        creator = msg.sender;
    }
    
    modifier onlyOwner {
        require(
            msg.sender == creator, "Only owner can call this function."
        );
        _;
    }
    
    modifier noEdit(bytes32 goeureka_audit_ref) {
        
        require(
            records[goeureka_audit_ref].exist == false, 
            "Already set, audit log cannot be modified"
        );
        _;
    }

    function set(bytes32 goeureka_audit_ref, string reference) 
        onlyOwner 
        noEdit(goeureka_audit_ref) 
        public {
            records[goeureka_audit_ref].reference = reference;
            records[goeureka_audit_ref].exist = true;
    }

    function get(bytes32 goeureka_audit_ref) public constant returns (string) {
        return records[goeureka_audit_ref].reference;
    }
    
}