CXX=gcc
OUT_DIR=bin

MKDIR_P=mkdir -p

all: clean directories memory lock-file

directories: ${OUT_DIR}

.PHONY: directories clean


${OUT_DIR}:
	${MKDIR_P} ${OUT_DIR}


memory: memory-allocation large-memory-allocation bad-memory-allocation free-memory memory-reallocation segment-fault null-pointer

memory-allocation: memory-allocation.c
	$(CXX) -o $(OUT_DIR)/memory-allocation memory-allocation.c

large-memory-allocation: large-memory-allocation.c
	$(CXX) -o $(OUT_DIR)/large-memory-allocation large-memory-allocation.c

bad-memory-allocation: bad-memory-allocation.c
	$(CXX) -o $(OUT_DIR)/bad-memory-allocation bad-memory-allocation.c

free-memory: free-memory.c
	$(CXX) -o $(OUT_DIR)/free-memory free-memory.c

memory-reallocation: memory-reallocation.c memory-reallocation-better.c memory-reallocation-best.c
	$(CXX) -o $(OUT_DIR)/memory-reallocation memory-reallocation.c
	$(CXX) -o $(OUT_DIR)/memory-reallocation-better memory-reallocation-better.c
	$(CXX) -o $(OUT_DIR)/memory-reallocation-best memory-reallocation-best.c

segment-fault: segment-fault.c
	$(CXX) -o $(OUT_DIR)/segment-fault segment-fault.c

null-pointer: null-pointer.c
	$(CXX) -o $(OUT_DIR)/null-pointer null-pointer.c

.PHONY: memory memory-allocation large-memory-allocation bad-memory-allocation free-memory


lock-file: atomic-lock-file segment-file-locking segment-file-testing

atomic-lock-file: atomic-lock-file.c
	$(CXX) -o $(OUT_DIR)/atomic-lock-file atomic-lock-file.c

segment-file-locking: segment-file-locking.c
	$(CXX) -o $(OUT_DIR)/segment-file-locking segment-file-locking.c

segment-file-testing: segment-file-testing.c segment-file-testing-2.c
	$(CXX) -o $(OUT_DIR)/segment-file-testing segment-file-testing.c
	$(CXX) -o $(OUT_DIR)/segment-file-testing-2 segment-file-testing-2.c

.PHONY: lock-file atomic-lock-file

clean:
	rm -rf $(OUT_DIR)
