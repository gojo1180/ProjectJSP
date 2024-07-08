package Model;

import java.sql.Date;

public class Pemesanan {
    private int id;
    private String name;
    private String email;
    private String court;
    private Date date;
    private String time;
    private double Harga;
    private String gor_NamaGor;

    public double getHarga() {
        return Harga;
    }

    public void setHarga(double Harga) {
        this.Harga = Harga;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCourt() {
        return court;
    }

    public void setCourt(String court) {
        this.court = court;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getGor_NamaGor() {
        return gor_NamaGor;
    }

    public void setGor_NamaGor(String gor_NamaGot) {
        this.gor_NamaGor = gor_NamaGot;
    }
}
