/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TableDeRapprochement_322 at 0xfaca127512d0f05371eebc91ceee771f702c3549
*/
pragma solidity 		^0.4.21	;							
												
		contract	TableDeRapprochement_322		{							
												
			address	owner	;							
												
			function	TableDeRapprochement_322		()	public	{				
				owner	= msg.sender;							
			}									
												
			modifier	onlyOwner	() {							
				require(msg.sender ==		owner	);					
				_;								
			}									
												
												
												
		// IN DATA / SET DATA / GET DATA / UINT 256 / PUBLIC / ONLY OWNER / CONSTANT										
												
												
			uint256	Data_1	=	1000	;					
												
			function	setData_1	(	uint256	newData_1	)	public	onlyOwner	{	
				Data_1	=	newData_1	;					
			}									
												
			function	getData_1	()	public	constant	returns	(	uint256	)	{
				return	Data_1	;						
			}									
												
												
												
//	��10111011�� correspondance : ��01010011 01001111 10111011 11101110  01000100 01001001 01010110 01000001 00100000 01010011 01000001 01010011��											
//	��10111012�� correspondance : ��01000101 01010100 10111011 11101110  01000001 01000010 01001100 01001001 01010011 01010011 01000101 01001101 01000101 01001110 01010100 01010011 00100000 01010000 01000001 01010101 01001100 00100000 01001011 01001001 01001000 01001100��											
//	��10111013�� correspondance : ��01010000 01001000 10111011 11101110  01001001 01001100 01001001 01010000 01010000 01000101 00100000 01001011 01001001 01001000 01001100��											
//	��10111014�� correspondance : ��01000011 01001000 10111011 11101110  01000001 01010010 01001100 01001111 01010100 01010100 01000101 00100000 01001011 01001001 01001000 01001100��											
//	��10111015�� correspondance : ��01010000 01000001 10111011 11101110  01010101 01001100 00100000 01001011 01001001 01001000 01001100��											
//	��10111016�� correspondance : ��01010100 01001000 10111011 11101110  01001111 01001101 01000001 01010011 00100000 01001000 01000001 01010011 01010011 01001111 01001100 01000100 ��											
//	��10111017�� correspondance : ��01010011 01000001 10111011 11101110  01000010 01001001 01001110 01000101 00100000 01001011 01001001 01001000 01001100 ��											
//	��10111018�� correspondance : ��01001010 01000001 10111011 11101110  01000011 01010001 01010101 01000101 01001100 01001001 01001110 01000101 00100000 01010010 01001111 01001100 01000001 01001110 01000100 ��											
//	��10111019�� correspondance : ��01001010 01000101 10111011 11101110  01000001 01001110 00101101 01000110 01010010 01000001 01001110 01000011 01001111 01001001 01010011 00100000 01010010 01001111 01001100 01000001 01001110 01000100 ��											
//	��10111020�� correspondance : �� 10111011 11101110 ��											
//	0											
//	0											
												
												
	}