################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../source/aes.cpp \
../source/aes_runner.cpp 

OBJS += \
./source/aes.o \
./source/aes_runner.o 

CPP_DEPS += \
./source/aes.d \
./source/aes_runner.d 


# Each subdirectory must supply rules for building sources it contributes
source/aes.o: /D/xilinx_workspace/aes_runner/source/aes.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/Xilinx/Vivado_HLS/2014.1/include -I/Xilinx/Vivado_HLS/2014.1/lnx64/tools/systemc/include -I/D/xilinx_workspace -I/usr/local/ssl/include -I/Xilinx/Vivado_HLS/2014.1/include/ap_sysc -I/Xilinx/Vivado_HLS/2014.1/lnx64/tools/auto_cc/include -I/Xilinx/Vivado_HLS/2014.1/include/etc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

source/aes_runner.o: /D/xilinx_workspace/aes_runner/source/aes_runner.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/Xilinx/Vivado_HLS/2014.1/include -I/Xilinx/Vivado_HLS/2014.1/lnx64/tools/systemc/include -I/D/xilinx_workspace -I/usr/local/ssl/include -I/Xilinx/Vivado_HLS/2014.1/include/ap_sysc -I/Xilinx/Vivado_HLS/2014.1/lnx64/tools/auto_cc/include -I/Xilinx/Vivado_HLS/2014.1/include/etc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


