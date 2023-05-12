package models.repository;

import model.Product;

import java.util.List;

public interface IAccessoryRepository {
    List<Product> getList();
    Product findById(int id);
    boolean createAt(Product product);
    boolean remove(int id);
    boolean edit(Product product);
    List<Product> search(String name, int startPrice, int endPrice);
}
