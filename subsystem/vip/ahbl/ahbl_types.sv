`ifndef AHBL_TYPES_SV
`define AHBL_TYPES_SV


typedef enum bit[1:0] {
	IDLE 					= 2'b00,
	BUSY 					= 2'b01,
	NONSEQUENTIAL = 2'b10,
	SEQUENTIAL		= 2'b11
} trans_type_enum;

typedef enum bit[2:0] {
	TRANS_SIZE_8BIT 		= 3'b000,
	TRANS_SIZE_16BIT 		= 3'b001,
	TRANS_SIZE_32BIT 		= 3'b010,
	TRANS_SIZE_64BIT 		= 3'b011,
	TRANS_SIZE_128BIT 	= 3'b100,
	TRANS_SIZE_256BIT 	= 3'b101,
	TRANS_SIZE_512BIT 	= 3'b110,
	TRANS_SIZE_1024BIT 	= 3'b111
} trans_size_enum;

typedef enum bit[2:0] {
	SINGLE 	= 3'b000,
	INCR		= 3'b001,
	WRAP4 	= 3'b010,
	INCR4 	= 3'b011,
	WRAP8 	= 3'b100,
	INCR8 	= 3'b101,
	WRAP16 	= 3'b110,
	INCR16 	= 3'b111
} burst_type_enum;


`endif // AHBL_TYPES_SV
