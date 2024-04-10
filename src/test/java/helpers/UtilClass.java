package helpers;

import java.util.Base64;

public class UtilClass {

    public static String decodeB64(String encode){
        return new String(Base64.getDecoder().decode(encode));
    }

    public static String encodeB64(String encode){
        return Base64.getEncoder().encodeToString(encode.getBytes());
    }

    public static void onlyPrint(String mensaje){
        System.out.println(">>> mensaje: "+mensaje);
    }
}