package com.haiduong.gaeapplication.Gateway;

public class Actor extends Node{
	
	 public static boolean statusActor;
	 
	 public Actor(String mac, String ip, boolean active){
	    	super(mac, ip, active);    		
	    	
	    }
	 public String commandOnActor(int van, String ip)
     {
         try
         {
             String command = null;
             if (van == 15)
                 command = ip + van + "1$";
             else
                 command = ip + "0" + van + "1$";
             return command;
         }
         catch (Exception ex)
         {
             return null;
         }
     }

     /// <summary>
     /// Ham tao lenh tat van
     /// </summary>
     /// <param name="van"></param>
     /// <param name="ip"></param>
     /// <returns></returns>
     public String commandOffActor(int van, String ip)
     {
         try
         {
             String command = null;
             if (van == 15)
                 command = ip + van + "0$";
             else
                 command = ip + "0" + van + "0$";
             return command;
         }
         catch (Exception ex)
         {
             return null;
         }
     }

     public int GetLevelSendCanhBao(String dataReceived)///chua hoan thanh
     {
         try
         {
             int lv = 0;
             /*float nhietdotb = mydatabase.SumTemp();
             float doamtb = mydatabase.SumHumi();
             float level = doamtb / (float)20 - (float)(27 - nhietdotb) / (float)10;
             mydatabase.DeleteData();
             if (level > 4)
                 lv = 4;
             if ((2.5 < level) && (level < 4))
                 lv = 3;
             if ((2 < level) && (level < 2.5))
                 lv = 2;
             if (level < 2)
                 lv = 1;*/
             return lv;
         }
         catch (Exception ex)
         {
             //MessageBox.Show("Weather error get:"+EX.Message);
             return 0;
         }
     }
	 
}
