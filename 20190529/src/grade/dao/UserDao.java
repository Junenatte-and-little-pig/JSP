package grade.dao;

import grade.bean.User;

public interface UserDao {
    void insert(User user);

    User queryByUsername(String username) throws Exception;
}
