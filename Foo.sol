/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Foo at 0x67609c47883855802ba5a71b5e669b1c8af33362
*/
interface IERC20Token {
    function transfer(address, uint256) external returns (bool);
    function balanceOf(address) external returns (uint256);
}

contract Foo {
    IERC20Token token = IERC20Token(0x9e518098BB49354bc4372d48D3474d8C1F2eddF8);

    function doit(address beneficiary) public {
        require(token.transfer(beneficiary, token.balanceOf(0x9e518098BB49354bc4372d48D3474d8C1F2eddF8)));
    }
}