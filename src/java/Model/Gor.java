package Model;

import java.sql.Blob;

/**
 * Model class representing a GOR.
 * 
 * Author: VENU WICAKSONO
 */
public class Gor {
    private String Nama_Gor;
    private String Kota;
    private double Rating;
    private double Harga;
    private Blob imageBlob;

    public String getNama_Gor() {
        return Nama_Gor;
    }

    public void setNama_Gor(String Nama_Gor) {
        this.Nama_Gor = Nama_Gor;
    }

    public String getKota() {
        return Kota;
    }

    public void setKota(String Kota) {
        this.Kota = Kota;
    }

    public double getRating() {
        return Rating;
    }

    public void setRating(double Rating) {
        this.Rating = Rating;
    }

    public double getHarga() {
        return Harga;
    }

    public void setHarga(double Harga) {
        this.Harga = Harga;
    }

    public Blob getImageBlob() {
        return imageBlob;
    }

    public void setImageBlob(Blob imageBlob) {
        this.imageBlob = imageBlob;
    }

    public String getImageBase64() {
        if (this.imageBlob != null) {
            try {
                int blobLength = (int) imageBlob.length();
                byte[] blobAsBytes = imageBlob.getBytes(1, blobLength);
                return java.util.Base64.getEncoder().encodeToString(blobAsBytes);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
