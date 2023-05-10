package models.service.accessory.impl;

import models.model.Accessory;
import models.repository.accessory.IAccessoryRepository;
import models.repository.accessory.impl.AccessoryRepository;
import models.service.accessory.IAccessoryService;
import java.util.List;

public class AccessoryService implements IAccessoryService {
    private static IAccessoryRepository accessoryRepository = new AccessoryRepository();

    @Override
    public List<Accessory> findAll() {
        List<Accessory> accessoryList = accessoryRepository.findAll();
        if (accessoryList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return accessoryList;
    }

    @Override
    public void save(Accessory accessory) {
        accessoryRepository.save(accessory);
    }

    @Override
    public Accessory findById(int id) {
        Accessory accessory = accessoryRepository.findById(id);
        return accessory;
    }

    @Override
    public void update(int id, Accessory accessory) {
        accessoryRepository.update(id, accessory);
    }

    @Override
    public void delete(int id) {
        accessoryRepository.delete(id);
    }

    @Override
    public List<Accessory> findByNameAndPrice(String name, double startPrice, double endPrice) {
        return accessoryRepository.findByNameAndPrice(name,startPrice,endPrice);
    }


}
