package models.model;

public class Accessory {
    private int id;
    private String nameAccessory;
    private double priceAccessory;
    private String imageAccessory;
    private String createAt;
    private String updateAt;

    public Accessory() {
    }

    public Accessory(String nameAccessory, double priceAccessory, String imageAccessory) {
        this.nameAccessory = nameAccessory;
        this.priceAccessory = priceAccessory;
        this.imageAccessory = imageAccessory;
    }

    public Accessory(int id, String nameAccessory, double priceAccessory, String imageAccessory, String createAt, String updateAt) {
        this.id = id;
        this.nameAccessory = nameAccessory;
        this.priceAccessory = priceAccessory;
        this.imageAccessory = imageAccessory;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameAccessory() {
        return nameAccessory;
    }

    public void setNameAccessory(String nameAccessory) {
        this.nameAccessory = nameAccessory;
    }

    public double getPriceAccessory() {
        return priceAccessory;
    }

    public void setPriceAccessory(double priceAccessory) {
        this.priceAccessory = priceAccessory;
    }

    public String getImageAccessory() {
        return imageAccessory;
    }

    public void setImageAccessory(String imageAccessory) {
        this.imageAccessory = imageAccessory;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }
}
