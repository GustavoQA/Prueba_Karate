package helpers;

import java.util.Arrays;
import java.util.Base64;

public class Encriptardata {
    public static String encodeB64(String encode){
        return Base64.getEncoder().encodeToString(encode.getBytes());
    }

    public static String decodeB64(String decode){
        return new String(Base64.getDecoder().decode(decode));
    }

}
