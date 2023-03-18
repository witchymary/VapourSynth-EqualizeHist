CXX := g++
CXXFLAGS := -O2 -Wall -fPIC -std=c++20
LDFLAGS := -shared -lopencv_imgproc
DESTDIR :=
PREFIX := /usr/lib/vapoursynth
INCLUDE := -I/usr/include/vapoursynth/ -I/usr/include/opencv4
TARGET := libvsequalizehist.so

SRC := src/shared.cpp src/CLAHE.cpp src/EqualizeHist.cpp
OBJ := $(patsubst %.cpp, %.o, $(SRC))

all: $(OBJ)
	$(CXX) -o $(TARGET) $^ $(LDFLAGS)
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

install:
	install -Dm644 "$(TARGET)" "$(DESTDIR)$(PREFIX)/$(TARGET)"

uninstall:
	rm -f "$(DESTDIR)$(PREFIX)/$(TARGET)"

clean: 
	rm -f "$(OBJ)"
