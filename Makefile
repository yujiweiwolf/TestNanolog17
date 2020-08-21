# Common Sources
SRCS=Cycles.cc Util.cc GeneratedCode.cc Log.cc NanoLog.cc RuntimeLogger.cc  TimeTrace.cc
OBJECTS:=$(SRCS:.cc=.o)
	
MAINS=main.cc
MAIN_OBJS=$(MAINS:.cc=.o)

INCLUDES=-I. 
LIBS=-L. -lrt -pthread
CXX_ARGS=-std=c++17 -g -O3
CXX = g++


all: libNanoLog.a sampleApplication

%.o:%.cc %.h
	$(CXX) $(CXX_ARGS) $(EXTRA_NANOLOG_FLAGS) $(INCLUDES) -c $< -o $@

%.o:%.cc
	$(CXX) $(CXX_ARGS) $(EXTRA_NANOLOG_FLAGS) $(INCLUDES) -c $< -o $@

libNanoLog.a: $(OBJECTS)
	ar -cr libNanoLog.a $(OBJECTS)

sampleApplication: main.o libNanoLog.a
	$(CXX) $(CXXFLAGS) -o sampleApplication main.o -L. -lNanoLog -pthread -lrt

#log加密了  ./decompressor decompress /tmp/logFile

clean:
	rm -f *.o *.gch *.Log  sampleApplication


