/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Blob;

/**
 *
 * @author VENU WICAKSONO
 */
public class Berita {
    private int id;
    private String judul;
    private String penulis;
    private String tanggal;
    private String konten;
    private Blob imageBlob;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getPenulis() {
        return penulis;
    }

    public void setPenulis(String penulis) {
        this.penulis = penulis;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getKonten() {
        return konten;
    }

    public void setKonten(String konten) {
        this.konten = konten;
    }

    public Blob getImageBlob() {
        return imageBlob;
    }

    public void setImageBlob(Blob imageBlob) {
        this.imageBlob = imageBlob;
    }

    // Getter dan setter untuk semua atribut

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

