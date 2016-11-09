package com.mis.mapper;

import com.mis.entity.Requireorder;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RequireorderMapper {

    int deleteByPrimaryKey(String id);

    int insert(Requireorder record);

    int insertSelective(Requireorder record);

    List<Requireorder> selectByUsername(String username);

    List<Requireorder> selectByStatus(String username);

    List<Requireorder> selectByType(String type);

    List<Requireorder> selectBySearch(Requireorder record);

    List<Requireorder> selectAll();

    Requireorder selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Requireorder record);

    int updateByPrimaryKey(Requireorder record);

    int updateStatus(String id);

    int updateById(Requireorder requireorder);
}