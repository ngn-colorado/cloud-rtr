<project xmlns="com.autoesl.autopilot.project" name="aes_runner" top="aes" parsingAllHeaderFiles="true">
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="-lcrypto -lssl -ldl" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../source/aes_runner_testbench.cpp" sc="0" tb="1" cflags=" -I../../../usr/local/ssl/include  -ldl -L/usr/local/ssl/lib/. -lcrypto -lssl"/>
        <file name="aes_runner/source/aes_runner.cpp" sc="0" tb="false" cflags=""/>
        <file name="aes_runner/source/aes.cpp" sc="0" tb="false" cflags=""/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>
