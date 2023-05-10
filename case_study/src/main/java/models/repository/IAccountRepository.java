package models.repository;

public interface IAccountRepository {
    boolean checkAccount(String userName, String password);
}
