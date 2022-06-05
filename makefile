FLAGS = -shared
TARGET = gnuplotpipe.so

$(TARGET): gnuplotpipe.c
	cc gnuplotpipe.c $(FLAGS) -o $(TARGET)
