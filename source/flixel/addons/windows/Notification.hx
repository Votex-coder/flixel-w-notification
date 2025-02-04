package flixel.addons.windows;

import sys.io.Process;

class Notification
{
    public static function show(title:String, message:String):Void
    {
        var powershellCommand = '
            [reflection.assembly]::loadwithpartialname("System.Windows.Forms");
            [reflection.assembly]::loadwithpartialname("System.Drawing");
            
            $notify = New-Object system.windows.forms.notifyicon;
            $notify.icon = [System.Drawing.SystemIcons]::Information; //System Icons
            $notify.visible = $true;
            
            $notify.showballoontip(10, "' + title + '", "' + message + '", [system.windows.forms.tooltipicon]::Info);
        ';
        try {
            new Process("powershell", ["-Command", powershellCommand]);
        } catch (e:Dynamic) {
            trace("Error print: " + e);
        }
    }
}