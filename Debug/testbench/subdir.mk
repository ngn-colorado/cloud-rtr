################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../source/aes_runner_testbench.cpp 

OBJS += \
./testbench/aes_runner_testbench.o 

CPP_DEPS += \
./testbench/aes_runner_testbench.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/aes_runner_testbench.o: /Xilinx/aes_runner/source/aes_runner_testbench.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I../../../usr/local/ssl/include -I/Xilinx/Vivado_HLS/2014.1/include -I/Xilinx/Vivado_HLS/2014.1/lnx64/tools/systemc/include -I/Xilinx -I/usr/local/ssl/include -I/Xilinx/Vivado_HLS/2014.1/include/ap_sysc -I/Xilinx/Vivado_HLS/2014.1/lnx64/tools/auto_cc/include -I/Xilinx/Vivado_HLS/2014.1/include/etc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/aes_runner_testbench.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


