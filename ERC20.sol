/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ERC20 at 0xAF3709f737C2354de7a8d9f258e554C7c64A0386
*/
pragma solidity ^0.4.18;

contract Mobilink {

    function Mobilink() public {
    }

    function createERC20(address _initialOwner, uint256 _initialAmount, 
string _name, uint8 _decimals, string _symbol)
        public
    returns (address) {

        ERC20 newToken = (new ERC20(_initialOwner, _initialAmount, 
_name, _decimals, _symbol));

        return address(newToken);
    }

}

contract ERC20Interface {

    uint256 public totalSupply = 9000000000000000000000000000;

    function balanceOf(address _owner) public view returns (uint256 
balance);

    function transfer(address _to, uint256 _value) public returns (bool 
success);

    function transferFrom(address _from, address _to, uint256 _value) 
public returns (bool success);

    function approve(address _spender, uint256 _value) public returns 
(bool success);

    function allowance(address _owner, address _spender) public view 
returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 
_value);
    event Approval(address indexed _owner, address indexed _spender, 
uint256 _value);
}

pragma solidity ^0.4.18;

contract ERC20 is ERC20Interface {

    uint256 constant private MAX_UINT256 = 2**256 - 1;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    string public name ="MobilinkToken";
    uint8 public decimals = 18;
    string public symbol = "MLK";

    function ERC20(
        address _initialOwner,
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
    ) public {
        balances[_initialOwner] = _initialAmount;
        totalSupply = _initialAmount;
        name = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
        emit Transfer(_initialOwner, _initialOwner, _initialAmount);
    }

    function transfer(address _to, uint256 _value) public returns (bool 
success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) 
public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 
balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns 
(bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view 
returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}