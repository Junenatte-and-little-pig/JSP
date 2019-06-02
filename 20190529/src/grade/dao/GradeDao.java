package grade.dao;

import java.util.List;

import grade.bean.Grade;

public interface GradeDao {
    void insert(Grade grade);

    void update(Grade grade) throws Exception;

    Grade queryByUsername(String username) throws Exception;

    List<Grade> queryAll() throws Exception;
}
