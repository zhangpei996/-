package com.school.base;

import java.util.List;

public interface BaseDao<Entity,Id> {

    int deleteByPrimaryKey(Id id);

    int insertSelective(Entity entity);

    Entity selectByPrimaryKey(Id id);

    List<Entity> selectAll(Entity entity);

    int updateByPrimaryKeySelective(Entity entity);

}
