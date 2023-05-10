package models.service.accessory;
import models.model.Accessory;

import java.util.List;

public interface IAccessoryService {
    List<Accessory> findAll();

    void save(Accessory accessory);

    Accessory findById(int id);

    void update(int id, Accessory accessory);

    void delete(int id);

    List<Accessory>findByNameAndPrice(String name, double startPrice, double endPrice);
}
