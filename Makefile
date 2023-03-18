CXX := g++
CXXFLAGS := -O2 -Wall -fPIC -std=c++20
LDFLAGS := -shared

INCLUDE := -I/usr/include/vapoursynth/ -I/usr/include/opencv4
TARGET := libvsequalizehist.so

SRC := src/shared.cpp src/CLAHE.cpp src/EqualizeHist.cpp
OBJ := $(patsubst %.cpp, %.o, $(SRC))

all: $(OBJ)
	$(CXX) $(LDFLAGS) -o $(TARGET) $^
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

clean: 
	rm -f $(OBJ)