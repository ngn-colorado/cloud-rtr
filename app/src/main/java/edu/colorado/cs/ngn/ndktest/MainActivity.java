package edu.colorado.cs.ngn.ndktest;

import android.app.Activity;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;


public class MainActivity extends Activity {

    static {
        System.loadLibrary("ndktest");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TextView tv =  new TextView(this);
        tv.setText(getNdkText());
        setContentView(tv);
        Process pr= null;
        try {
            tv.setText(tv.getText() + "\nAsking for root");
            pr = Runtime.getRuntime().exec("su");
            tv.setText(tv.getText() + "\nAsked for root");
            Thread.sleep(2000);
//            pr.waitFor();
//            BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
//            String line;
//            while ((line = in.readLine()) != null){
//                System.out.println(line);
//                Log.w("ndktest", line);
//            }
            tv.setText(tv.getText() + "\nAttempting memmap");
//            RandomAccessFile uio = new RandomAccessFile("/dev/uio0", "rws");
//            File uio = new File("/sys/devices/soc0/43c00000.aestest/uio/uio0");
//            File uio = new File("/dev/uio0");
//
//            System.out.println("Uio file info: "+uio.exists()+", "+uio.isFile()+"\n"+uio.toString());
//
//            FileInputStream inputStream = new FileInputStream(uio);
//
//            FileChannel channel = inputStream.getChannel();
//
//            int count = 1;
//            MappedByteBuffer out;
//            out = channel.map(FileChannel.MapMode.READ_ONLY, 0x0, (long)count);
//            //uio.getChannel().map(FileChannel.MapMode.READ_WRITE, 0, count);
//
//            tv.setText(tv.getText() + "\nGot memmap");
//            System.out.println("Reading from /dev/uio0");
//            Log.w("ndktest", "Reading from /dev/uio0");
//
//            for(int i=0; i<count; i++){
//                System.out.println((char)out.get(i));
//                Log.w("ndktest", ""+(char)out.get(i));
//            }

//            Log.d("Ex.Value", Integer.toString(pr.exitValue()));
        } catch (IOException e) {
            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

//        setContentView(R.layout.activity_main);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public native String getNdkText();
}
