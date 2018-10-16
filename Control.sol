/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Control at 0x634e9d02bcb9bc7c02a8706c3b9ca3107e73651c
*/
pragma solidity ^0.4.18;
    library SafeMath {
        function mul(uint256 a, uint256 b) internal pure returns (uint256) {
            uint256 c = a * b;
            assert(a == 0 || c / a == b);
            return c;
        }
    
        function div(uint256 a, uint256 b) internal pure returns (uint256) {
            // assert(b > 0); // Solidity automatically throws when dividing by 0
            uint256 c = a / b;
            // assert(a == b * c + a % b); // There is no case in which this doesn't hold
            return c;
        }
    
        function sub(uint256 a, uint256 b) internal pure returns (uint256) {
            assert(b <= a);
            return a - b;
        }
    
        function add(uint256 a, uint256 b) internal pure returns (uint256) {
            uint256 c = a + b;
            assert(c >= a);
            return c;
        }
    }
    library ERC20Interface {
        function totalSupply() public constant returns (uint);
        function balanceOf(address tokenOwner) public constant returns (uint balance);
        function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
        function transfer(address to, uint tokens) public returns (bool success);
        function approve(address spender, uint tokens) public returns (bool success);
        function transferFrom(address from, address to, uint tokens) public returns (bool success);
        event Transfer(address indexed from, address indexed to, uint tokens);
        event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    }
    library ApproveAndCallFallBack {
        function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
    }
    contract owned {
    
    
    	    address public owner;
    
    
    	    function owned() payable public {
    	        owner = msg.sender;
    	    }
    	    
    	    modifier onlyOwner {
    	        require(owner == msg.sender);
    	        _;
    	    }
    
    
    	    function changeOwner(address _owner) onlyOwner public {
    	        owner = _owner;
    	    }
    	}
    contract Crowdsale is owned {
    	    
    	    uint256 public totalSupply;
    	
    	    mapping (address => uint256) public balanceOf;
    
    
    	    event Transfer(address indexed from, address indexed to, uint256 value);
    	    
    	    function Crowdsale() payable owned() public {
                totalSupply = 1000000000 * 1000000000000000000; 
                // ico
    	        balanceOf[this] = 900000000 * 1000000000000000000;   
    	        balanceOf[owner] = totalSupply - balanceOf[this];
    	        Transfer(this, owner, balanceOf[owner]);
    	    }
    
    	    function () payable public {
    	        require(balanceOf[this] > 0);
    	        
    	        uint256 tokensPerOneEther = 200000 * 1000000000000000000;
    	        uint256 tokens = tokensPerOneEther * msg.value / 1000000000000000000;
    	        if (tokens > balanceOf[this]) {
    	            tokens = balanceOf[this];
    	            uint valueWei = tokens * 1000000000000000000 / tokensPerOneEther;
    	            msg.sender.transfer(msg.value - valueWei);
    	        }
    	        require(tokens > 0);
    	        balanceOf[msg.sender] += tokens;
    	        balanceOf[this] -= tokens;
    	        Transfer(this, msg.sender, tokens);
    	    }
    	}
    contract ARMOR is Crowdsale {
        
            using SafeMath for uint256;
            string  public name        = 'ARMOR';
    	    string  public symbol      = 'ARMOR';
    	    string  public standard    = 'ARMOR 0.1';
            
    	    uint8   public decimals    = 18;
    	    mapping (address => mapping (address => uint256)) internal allowed;
    	    
    	    function ARMOR() payable Crowdsale() public {}
    	    
    	    function transfer(address _to, uint256 _value) public {
    	        require(balanceOf[msg.sender] >= _value);
    	        balanceOf[msg.sender] -= _value;
    	        balanceOf[_to] += _value;
    	        Transfer(msg.sender, _to, _value);
    	    }
    	}
    contract Control is ARMOR {
    	    function Control() payable ARMOR() public {}
    	    function withdraw() onlyOwner {    
    	        owner.transfer(this.balance);  
    	    }
    	    function killMe()  onlyOwner {
    	        selfdestruct(owner);
    	    }
    	}