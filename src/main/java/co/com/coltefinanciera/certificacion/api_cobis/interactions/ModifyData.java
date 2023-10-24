package co.com.coltefinanciera.certificacion.api_cobis.interactions;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.*;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.text.ParseException;
import java.util.Base64;

public class ModifyData {

    public static String encrypt(String data, String secretKey) throws Exception {
        SecretKey key = new SecretKeySpec(secretKey.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedBytes = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    public static String decrypt(String jwt, String secretKey) throws Exception {
        String[] parts = jwt.split("\\.");
        String encryptedText = parts[1];
        String header = new String(Base64.getUrlDecoder().decode(parts[0]));
        int ivEndIndex = header.indexOf("\"iv\":\"") + 6;
        String ivString = header.substring(ivEndIndex, header.indexOf("\"", ivEndIndex));
        byte[] iv = Base64.getUrlDecoder().decode(ivString);

        byte[] secretKeyBytes = secretKey.getBytes();
        SecretKeySpec secretKeySpec = new SecretKeySpec(secretKeyBytes, "AES");

        byte[] encryptedBytes = Base64.getUrlDecoder().decode(encryptedText);

        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        GCMParameterSpec spec = new GCMParameterSpec(128, iv);
        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, spec);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);

        return new String(decryptedBytes);
    }
}

