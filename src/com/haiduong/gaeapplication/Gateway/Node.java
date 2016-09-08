package com.haiduong.gaeapplication.Gateway;

public class Node {
	/// <summary>
    /// Dia chi mac cua cac node (sensor va actor)
    /// </summary>
    public static String Mac = null;

    /// <summary>
    /// Dia chi IP cua cac node(sensor va actor)
    /// </summary>
    public static String Ip = null;

    /// <summary>
    /// Ma lenh cua cac node 
    /// </summary>
    public String Command = null;

    /// <summary>
    /// Ma lenh khi chuyen thanh mang byte cac node
    /// </summary>
    public byte[] Commandbyte = null;
}
