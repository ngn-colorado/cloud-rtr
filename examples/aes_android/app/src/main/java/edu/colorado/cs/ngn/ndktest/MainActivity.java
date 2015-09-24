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

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;


public class MainActivity extends Activity {

    static {
        System.loadLibrary("ndktest");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TextView tv =  new TextView(this);

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
            tv.setText(tv.getText() + "\nRunning aes code");
            tv.setText(tv.getText() +"\n" + getNdkText());
//            byte data_to_encrypt[] = {0x01, 0x4B, (byte)0xAF, 0x22, 0x78, (byte)0xA6, (byte)0x9D, 0x33, 0x1D, 0x51, (byte)0x80, 0x10, 0x36, 0x43, (byte)0xE9, (byte)0x9A};
            byte randStart = (byte)Math.random();
            int numEncyptions = 2000;
            byte data_to_encrypt[] = new byte[numEncyptions*16];
            for(int i=0; i<numEncyptions*16; i++){
                data_to_encrypt[i] = (byte)(randStart + (i*i));
            }
            byte key[] = {(byte)0xE8, (byte)0xE9, (byte)0xEA, (byte)0xEB, (byte)0xED, (byte)0xEE, (byte)0xEF, (byte)0xF0, (byte)0xF2, (byte)0xF3, (byte)0xF4, (byte)0xF5, (byte)0xF7, (byte)0xF8, (byte)0xF9, (byte)0xFA};
            double startJavaEncryption = System.nanoTime();
            byte encryptedData[] = encrypt(key, data_to_encrypt);
            double endJavaEncryption = System.nanoTime();

//            tv.setText(tv.getText() +"\n" + "Java data to encrypt:");
//            String originalStringData = "";
//            for(int i=0; i<data_to_encrypt.length; i++){
//                if(i%16 == 0 && i>0) {
//                    originalStringData += " ";
//                }
//                if(i%16 == 0) {
//                    originalStringData += "0x";
//                }
//                originalStringData += String.format("%02x", data_to_encrypt[i]);
//            }
//            tv.setText(tv.getText() +"\n" + originalStringData);

//            tv.setText(tv.getText() +"\n" + "Java AES encrypted data:");
//            String encryptStringData = "";
//            for(int i=0; i<encryptedData.length; i++){
//                if(i%16 == 0 && i>0) {
//                    encryptStringData += " ";
//                }
//                if(i%16 == 0) {
//                    encryptStringData += "0x";
//                }
//                encryptStringData += String.format("%02x", encryptedData[i]);
//            }
//            tv.setText(tv.getText() +"\n" + encryptStringData);
            tv.setText(tv.getText() +"\n" + "Length of encrypted java data: "+encryptedData.length);
            int writeCount = writeAesDataToMemory(data_to_encrypt, numEncyptions);
            double startCEncrypt = System.nanoTime();
            int encryptedCount = encryptAesData(numEncyptions*16, numEncyptions);//data_to_encrypt.length, data_to_encrypt.length / 16);
            double endCEncrypt = System.nanoTime();
            int numIncorrect = verifyAesData(encryptedData, numEncyptions*16, numEncyptions);//data_to_encrypt.length, data_to_encrypt.length / 16);
            tv.setText(tv.getText() +"\n" + "Fabric encrypted count: "+encryptedCount+"\n");
            tv.setText(tv.getText() +"\n" + "Fabric incorrect count: "+numIncorrect+"\n");
            tv.setText(tv.getText() +"\n" + "Java encryption elapsed nanoseconds: "+(endJavaEncryption-startJavaEncryption)+"\n");
            tv.setText(tv.getText() +"\n" + "C encryption elapsed nanoseconds: "+(endCEncrypt-startCEncrypt)+"\n");
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
        } catch (Exception e) {
            e.printStackTrace();
        }

//        setContentView(R.layout.activity_main);
    }

    //https://stackoverflow.com/questions/6788018/android-encryption-decryption-with-aes
    private static byte[] encrypt(byte[] raw, byte[] clear) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(clear);
        return encrypted;
    }

    private static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
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

    public native int writeAesDataToMemory(byte[] data, int numEncryptions);

    public native int encryptAesData(int offset, int numEncryptions);

    public native int verifyAesData(byte[] data, int offset, int numEncryptions);
}
