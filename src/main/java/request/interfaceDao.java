package request;

import java.sql.SQLException;
import java.util.List;


public interface interfaceDao<T> {

    void insert(T o) throws SQLException;

    boolean delete(int id) throws SQLException;
    
    boolean update(T o) throws SQLException;
    
    T select(int id);

    List<T> selectAll();
}
