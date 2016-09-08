package com.haiduong.gaeapplication.Gateway;

public class Sensor extends Node {
	/// <summary>
    /// Nhiet do cua sensor
    /// </summary>
	public static float temperature;

    /// <summary>
    /// Do am cua sensor
    /// </summary>
    public static float humidity;

    /// <summary>
    /// Nang luong cua sensor
    /// </summary>
    public static float energy;

    /// <summary>
    /// Trang thai cua sensor
    /// </summary>
    public static String stateSensor;

    /// <summary>
    /// Tra ve loi khi bat loi
    /// </summary>
    public String ERR = null;

    /// <summary>
    /// Doi tuong ve co so du lieu
    /// </summary>
    //public Database db;
    
    
    public Sensor(){
    	
    }
    /// <summary>
    /// Tao lenh lay du lieu nhiet do, do am cac sensor
    /// </summary>
    /// <param name="ip"></param>
    /// <returns></returns>
    public String CommandSensor(String ip)
    {
        try
        {
            return ip + "000$";
        }
        catch (Exception ex)
        {
            System.out.println(ex);
            return null;
        }
    }
  /// <summary>
    /// mang luu cac doan du lieu anh
    /// </summary>
    public String[] arrayStringImage = new String[100];

    /// <summary>
    /// Chup xong anh se chuyen sang true
    /// </summary>
    public static boolean takePhotoDone = false;

    public static String img_path = null;

}
