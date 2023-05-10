package models.service.impl;

import models.repository.IAccountRepository;
import models.repository.Impl.AccountRepositoryImpl;
import models.service.IAccountService;

public class AccountReposiroryImpl implements IAccountService {
    IAccountRepository accountRepository = new AccountRepositoryImpl();
    @Override
    public boolean checkAccount(String userName, String password) {
        return accountRepository.checkAccount(userName,password);
    }
}
