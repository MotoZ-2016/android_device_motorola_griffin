package ir.erfanabdi.batterymodpercentage;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.support.v7.app.NotificationCompat;
import android.widget.Toast;

/**
 * Created by erfanabdi on 3/20/17.
 */
public class ModManagerBroadcastReceiver extends BroadcastReceiver {

    public static final String ACTION_BIND_MANAGER = "com.motorola.mod.action.BIND_MANAGER";
    public static final String ACTION_MOD_ATTACH = "com.motorola.mod.action.MOD_ATTACH";
    public static final String ACTION_MOD_ATTACH_FAILED = "com.motorola.mod.action.MOD_ATTACH_FAILED";
    public static final String ACTION_MOD_CAPABILITY_CHANGED = "com.motorola.mod.action.MOD_CAPABILITY_CHANGED";
    public static final String ACTION_MOD_DETACH = "com.motorola.mod.action.MOD_DETACH";
    public static final String ACTION_MOD_ENUMERATION_DONE = "com.motorola.mod.action.MOD_ENUMERATION_DONE";
    public static final String ACTION_MOD_ERROR = "com.motorola.mod.action.MOD_ERROR";
    public static final String ACTION_MOD_EVENT = "com.motorola.mod.action.MOD_EVENT";
    public static final String ACTION_MOD_FIRMWARE_CHECK_UPDATE_ERROR = "com.motorola.mod.action.MOD_FIRMWARE_CHECK_UPDATE_ERROR";
    public static final String ACTION_MOD_FIRMWARE_DOWNLOAD_STATUS = "com.motorola.mod.action.MOD_FIRMWARE_DOWNLOAD_STATUS";
    public static final String ACTION_MOD_FIRMWARE_UPDATE_AVAILABLE = "com.motorola.mod.action.MOD_FIRMWARE_UPDATE_AVAILABLE";
    public static final String ACTION_MOD_FIRMWARE_UPDATE_CANCELLED = "com.motorola.mod.action.MOD_FW_UPDATE_CANCELLED";
    public static final String ACTION_MOD_FIRMWARE_UPDATE_CANCEL_STATUS = "com.motorola.mod.action.MOD_FW_UPDATE_CANCEL_STATUS";
    public static final String ACTION_MOD_FIRMWARE_UPDATE_DONE = "com.motorola.mod.action.MOD_FIRMWARE_UPDATE_DONE";
    public static final String ACTION_MOD_FIRMWARE_UPDATE_START = "com.motorola.mod.action.MOD_FIRMWARE_UPDATE_START";
    public static final String ACTION_MOD_FIRMWARE_UPDATE_STATUS = "com.motorola.mod.action.FMW_UPDATE_STATUS";
    public static final String ACTION_MOD_PRE_ATTACH_USER_CONSENT = "com.motorola.mod.action.MOD_PRE_ATTACH_USER_CONSENT";
    public static final String ACTION_MOD_REQUEST_FIRMWARE = "com.motorola.mod.action.MOD_REQUEST_FIRMWARE";
    public static final String ACTION_MOD_SERVICE_STARTED = "com.motorola.mod.action.SERVICE_STARTED";
    public static final String ACTION_MOD_USB_CONFLICT_DETECTED = "com.motorola.mod.action.MOD_USB_CONFLICT_DETECTED";
    public static final String ACTION_OEM_SUBSYSTEM = "com.motorola.mod.action.OEM_SUBSYSTEM";
    public static final String ACTION_OEM_SUBSYSTEM_GET = "com.motorola.mod.action.OEM_SUBSYSTEM_GET ";
    public static final String ACTION_OEM_SUBSYSTEM_SET = "com.motorola.mod.action.OEM_SUBSYSTEM_SET ";
    public static final String ACTION_OEM_SUBSYSTEM_UPDATE = "com.motorola.mod.action.OEM_SUBSYSTEM_UPDATE";
    public static final String ACTION_REQUEST_CONSENT_FOR_UNSECURE_FIRMWARE_UPDATE = "com.motorola.mod.action.UNSEC_FMW_CONSENT_REQ";
    public static final String ACTION_USER_CONSENT_RESP_FOR_UNSECURE_FIRMWARE = "com.motorola.mod.action.UNSEC_FMW_CONSENT_RESP";

    public void onReceive(Context context , Intent intent) {
        String action = intent.getAction();

        if(action.equals(ACTION_MOD_ATTACH)) {
            if (!MainActivity.getCapacity().trim().equals("-1")) {
                Toast t = Toast.makeText(context, "Battery Mod: " + MainActivity.getCapacity() + "%", Toast.LENGTH_SHORT);
                t.show();

                context.startService(new Intent(context, NotifService.class));
            }
        }
    }

}