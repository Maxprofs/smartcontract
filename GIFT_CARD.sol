/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract GIFT_CARD at 0x99bab102c0a03438bcfd70119f07ee646db26ddf
*/
pragma solidity ^0.4.19;

contract GIFT_CARD
{
    function Put(bytes32 _hash, uint _unlockTime)
    public
    payable
    {
        if(!locked && msg.value > 200000000000000000)// 0.2 ETH
        {
            unlockTime = now+_unlockTime;
            hashPass = _hash;
        }
    }
    
    function Take(bytes _pass)
    external
    payable
    access(_pass)
    {
        if(hashPass == keccak256(_pass) && now>unlockTime && msg.sender==tx.origin)
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    function Lock(bytes _pass)
    external
    payable
    access(_pass)
    {
        locked = true;
    }
    
    modifier access(bytes _pass)
    {
        if(hashPass == keccak256(_pass) && now>unlockTime && msg.sender==tx.origin)
        _;
    }
    
    bytes32 public hashPass;
    uint public unlockTime;
    bool public locked = false;
    
    function GetHash(bytes pass) public constant returns (bytes32) {return keccak256(pass);}
    
    function() public payable{}
}