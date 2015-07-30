PROGS = booth 
OBJECTS1 = booth.v add.v full_adder.v tb_booth.v

CXX = iverilog

all: $(PROGS)

booth: $(OBJECTS1)
	$(CXX) -o booth $(OBJECTS1)

clean: 
	rm booth
