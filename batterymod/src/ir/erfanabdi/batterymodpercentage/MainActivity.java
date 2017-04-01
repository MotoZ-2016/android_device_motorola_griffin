package ir.erfanabdi.batterymodpercentage;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.cyanogenmod.internal.util.FileUtils;

public class MainActivity extends AppCompatActivity {

    Context context;

    public static Process pros;
    public static String gb_battery = "/sys/class/power_supply/gb_battery/";

    public static String readableit(String path, String name){
        String value;
        switch (name){
            case "temp":
                value = String.valueOf(Double.parseDouble(FileUtils.readOneLine(path + name))/10)+"℃";
                break;
            default:
                value = FileUtils.readOneLine(path + name);
                break;
        }

        return name + ": " + value;
    }

    String[] getfiles(String path) {
        String[] fileNames;

        File greybusBatteryDirectory = new File(path);
        File[] greybusFiles = greybusBatteryDirectory.listFiles(new FileFilter() {
            @Override
            public boolean accept(File pathname) {
                return pathname.isFile();
            }
        });

            if (greybusFiles != null) {

                fileNames = new String[greybusFiles.length];
                for (int k = 0; k < greybusFiles.length; k++) {
                        fileNames[k] = readableit(path, greybusFiles[k].getName());
                }

            } else {
                fileNames = new String[1];
                fileNames[0] = "No Mod Found";

            }

        return fileNames;
    }

    public static String getCapacity(){
        String result = FileUtils.readOneLine(gb_battery + "capacity");
        if (result.trim().equals(""))
            result = "-1";
        return result.trim();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        context = this;

        Button clickButton = (Button) findViewById(R.id.ref);
        clickButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                RefreshData();
            }
        });

        RefreshData();
    }

    public void RefreshData() {
        TextView tv = (TextView) findViewById(R.id.perc);
        tv.setText(getCapacity());

        ListView list = (ListView) findViewById(R.id.list);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, android.R.id.text1, getfiles(gb_battery));

        list.setAdapter(adapter);
        startService(new Intent(this, NotifService.class));
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.mainmenu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.help:
                Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://forum.xda-developers.com/moto-z/themes/app-battery-mod-percentage-t3575753/"));
                startActivity(browserIntent);
                break;
            case R.id.opensrc:
                Intent browserIntent2 = new Intent(Intent.ACTION_VIEW, Uri.parse("https://github.com/erfanoabdi/BatteryModPercentage"));
                startActivity(browserIntent2);
                break;
        }
        return true;
    }
}
