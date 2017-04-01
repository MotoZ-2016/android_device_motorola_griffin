package ir.erfanabdi.batterymodpercentage;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.IBinder;
import android.support.v7.app.NotificationCompat;

import org.cyanogenmod.internal.util.FileUtils;

/**
 * Created by erfanabdi on 3/26/17.
 */

public class NotifService extends Service{

    public static NotificationCompat.Builder b;
    public static NotificationManager nm;

    public static boolean Quit_Task = false;
    public static PendingIntent resultPendingIntent;
    public static Context context;

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        context = getApplicationContext();
        LongOperation lo = new LongOperation();

        if (!MainActivity.getCapacity().trim().equals("-1")) {
            Quit_Task = false;

            lo.execute("");
        }else {
            Quit_Task = true;
            this.stopSelf();
        }
        return super.onStartCommand(intent,flags,startId);
    }

    @Override
    public IBinder onBind(Intent arg0) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void onDestroy() {
        // TODO Auto-generated method stub
        super.onDestroy();
    }

    public static class LongOperation extends AsyncTask<String, Void, String> {

        void Sleep(int ms)
        {
            try
            {
                Thread.sleep(ms);
            }
            catch (Exception e)
            {
            }
        }

        protected String oldres="100";
        protected String oldsts="Discharging";

        @Override
        protected String doInBackground(String... params) {
            String result = "99";
            String status = "Full";

            while (!Quit_Task) {
                Sleep(1000);
                result = MainActivity.getCapacity().trim();
                status = FileUtils.readOneLine(MainActivity.gb_battery + "status");
                if (!result.equals("-1")) {
                    if (!result.equals(oldres) || !status.equals(oldsts)) {
                        b.setContentTitle("Battery Mod: " + result + "%")
                                .setContentText(status);

                        nm.notify(1, b.build());
                        oldres = result;
                        oldsts = status;
                    }

                }else {
                    Quit_Task = true;
                    nm.cancel(1);
                    return "-1";
                }

            }
            return "0";
        }

        @Override
        protected void onPostExecute(String result) {}

        @Override
        protected void onPreExecute() {
            b = new NotificationCompat.Builder(context);
            nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            Intent resultIntent = new Intent(context, MainActivity.class);

            resultPendingIntent =
                    PendingIntent.getActivity(
                            context,
                            0,
                            resultIntent,
                            PendingIntent.FLAG_UPDATE_CURRENT
                    );

            b.setAutoCancel(false)
                    .setLargeIcon(BitmapFactory.decodeResource(context.getResources(), R.mipmap.icon))
                    .setSmallIcon(R.drawable.ic_battery_mgr_mod)
                    .setPriority(NotificationCompat.PRIORITY_MIN)
                    .setContentIntent(resultPendingIntent)
                    .setOngoing(true)
            ;

        }
    }

}
